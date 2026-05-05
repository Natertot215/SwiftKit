import SwiftUI

// SwiftUI `View/visualEffect(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/visualeffect(_:).md
// macOS 14.0+. Applies effects with access to GeometryProxy (no layout invalidation).

struct VisualEffectPage: View {
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/visualEffect(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Applies a VisualEffect to the view through a closure that has access to a GeometryProxy. Lets effects react to position and size without invalidating layout.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/visualeffect(_:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private func tile(_ label: String) -> some View {
        Text(label)
            .font(.headline).foregroundStyle(.white)
            .frame(width: 100, height: 70)
            .background(Color.accentColor.gradient, in: RoundedRectangle(cornerRadius: 8))
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 24) {
                tile("Source")
                    .visualEffect { content, proxy in
                        content.offset(x: proxy.size.width * 0.3)
                    }
                Text("\u{2190} offset by 30% of own width")
                    .font(.callout).foregroundStyle(.secondary)
            }
            APICallout(".visualEffect { content, proxy in content.offset(x: proxy.size.width * 0.3) }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Position-driven scale (in named coordinate space)") {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 16) {
                        ForEach(0..<10) { i in
                            tile("\(i)")
                                .visualEffect { content, proxy in
                                    let frame = proxy.frame(in: .named("vEffectScroll"))
                                    let center = frame.midX
                                    let scale = max(0.6, 1 - abs(center - 220) / 800)
                                    return content.scaleEffect(scale)
                                }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .frame(height: 110)
                .coordinateSpace(name: "vEffectScroll")
            }

            VariantRow(title: "Geometry-driven blur") {
                HStack(spacing: 16) {
                    ForEach(0..<5) { i in
                        tile("\(i)")
                            .visualEffect { content, proxy in
                                let h = proxy.size.height
                                return content.blur(radius: h / 60)
                            }
                            .frame(height: CGFloat(40 + i * 20))
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Stationary view, animated effect") {
            VStack(alignment: .leading, spacing: 12) {
                tile("\(Int(scrollOffset))")
                    .visualEffect { content, _ in
                        content.offset(x: scrollOffset).scaleEffect(1 + abs(scrollOffset) / 600)
                    }
                    .animation(.easeInOut, value: scrollOffset)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Text("offset").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $scrollOffset, in: -120...120).frame(width: 280)
                    Text(String(format: "%+.0f", scrollOffset)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Effects don't invalidate layout.", "Returning .offset / .scaleEffect / .blur / etc. from the closure is safe in scroll views and lists \u{2014} no relayout fires per frame.", "lock"),
        ("Closure runs with current geometry.", "The GeometryProxy gives the live size and frame in any coordinate space, so the effect can react to scroll position, container size, etc.", "scope"),
        ("Compose multiple modifiers on content.", "The closure's first argument is an EmptyVisualEffect placeholder \u{2014} chain VisualEffect modifier methods (.offset, .blur, .scaleEffect) and return the composed value.", "function"),
        ("Use coordinateSpace for stable reads.", "Pair with .coordinateSpace(.named(\"\u{2026}\")) to make the proxy frame stable across scroll containers.", "ruler")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }

    private struct VariantRow<Content: View>: View {
        let title: String
        @ViewBuilder var content: () -> Content
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline).foregroundStyle(.primary)
                content()
            }
        }
    }
}

#Preview {
    VisualEffectPage().frame(width: 1100, height: 1000)
}
