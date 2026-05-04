import SwiftUI

// TextRenderer reference page.
// Covers: textRenderer(_:), TextRenderer, TextProxy
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 15+ (TextRenderer / textRenderer(_:))

struct TextRendererPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("TextRenderer")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A protocol for drawing text with custom layout and visual effects.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/textRenderer(_:) · TextRenderer · TextProxy · macOS 15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TRCard(api: "Text(…).textRenderer(MyRenderer())") {
            if #available(macOS 15, *) {
                Text("Custom Rendered")
                    .font(.title)
                    .textRenderer(WaveRenderer())
            } else {
                Text("Requires macOS 15+")
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TRVariant(title: "TextRenderer protocol overview") {
                TRCard(api: "struct MyRenderer: TextRenderer { func draw(layout: Text.Layout, in context: inout GraphicsContext) }") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("TextRenderer is a protocol requiring a single method:")
                        Text("func draw(layout: Text.Layout, in context: inout GraphicsContext)")
                            .fontDesign(.monospaced)
                            .font(.caption)
                            .padding(6)
                            .background(.background.tertiary, in: RoundedRectangle(cornerRadius: 4))
                        Text("The layout provides runs, lines, and glyph positions. The context is a SwiftUI GraphicsContext for drawing.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            TRVariant(title: "TextProxy") {
                TRCard(api: "TextProxy — read-only view into a resolved text run's properties") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("TextProxy is provided inside the draw method to access individual text runs.")
                            .font(.body)
                        Text("It exposes properties like font, foreground color, and character range within the overall layout.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            if #available(macOS 15, *) {
                TRVariant(title: "Live demo — WaveRenderer") {
                    TRCard(api: "Text(\"Wave Effect\").textRenderer(WaveRenderer())") {
                        Text("Wave Effect Text")
                            .font(.title2)
                            .fontWeight(.bold)
                            .textRenderer(WaveRenderer())
                    }
                }

                TRVariant(title: "Applying to different text styles") {
                    HStack(alignment: .top, spacing: 16) {
                        TRCard(api: ".font(.largeTitle).textRenderer(WaveRenderer())") {
                            Text("Big Wave")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .textRenderer(WaveRenderer())
                        }
                        TRCard(api: ".font(.caption).textRenderer(WaveRenderer())") {
                            Text("Small wave effect on caption text")
                                .font(.caption)
                                .textRenderer(WaveRenderer())
                        }
                    }
                }
            }
        }
    }

    private struct TRNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TRNote] = [
        .init(title: "TextRenderer gives full control over text drawing.", detail: "You receive the complete text layout — runs, lines, glyphs — and a GraphicsContext. You can translate, rotate, or color-shift individual characters.", symbol: "wand.and.stars"),
        .init(title: "textRenderer(_:) is applied to individual Text views.", detail: "Apply it directly to Text(…), not to a container. Each Text view can have its own renderer.", symbol: "a.magnify"),
        .init(title: "TextProxy exposes resolved font and style per run.", detail: "Inside draw(layout:in:), iterate over Text.Layout.Line and Text.Layout.Run. TextProxy on each run gives the resolved font, foreground color, and more.", symbol: "doc.text.magnifyingglass"),
        .init(title: "Requires macOS 15 / iOS 18.", detail: "TextRenderer and textRenderer(_:) shipped with the WWDC 2024 SDK. Use #available guards for earlier deployment targets.", symbol: "info.circle"),
    ]

    @ViewBuilder private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

@available(macOS 15, *)
private struct WaveRenderer: TextRenderer {
    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                var copy = context
                let amplitude: CGFloat = 3
                let phase = run.typographicBounds.origin.x / 20
                let offset = sin(phase) * amplitude
                copy.translateBy(x: 0, y: offset)
                copy.draw(run)
            }
        }
    }
}

private struct TRCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 320, minHeight: 48, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TRVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    TextRendererPage().frame(width: 900, height: 900)
}
