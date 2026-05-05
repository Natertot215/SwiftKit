import SwiftUI

// SwiftUI `View/drawingGroup(opaque:colorMode:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/drawinggroup(opaque:colormode:).md
// macOS 10.15+. Composites this view's contents into an offscreen image before final display.

struct DrawingGroupPage: View {
    @State private var opaque = false
    @State private var colorMode: ColorRenderingMode = .nonLinear

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
            Text("View/drawingGroup(opaque:colorMode:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Flattens this view's subtree into a single offscreen Metal surface before final display. Use it to fix perf hot spots with stacked filters or to make ancestor effects apply once to a composed image.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/drawinggroup(opaque:colormode:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private func stack() -> some View {
        ZStack {
            ForEach(0..<8) { i in
                Circle()
                    .fill(.tint.opacity(0.5))
                    .frame(width: 70, height: 70)
                    .offset(x: cos(Double(i) * .pi / 4) * 30, y: sin(Double(i) * .pi / 4) * 30)
                    .blur(radius: 4)
                    .blendMode(.plusLighter)
            }
        }
        .frame(width: 160, height: 130)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 32) {
                VStack(alignment: .leading, spacing: 6) {
                    stack()
                    Text("No drawingGroup \u{2014} each child rendered through the SwiftUI graph").font(.caption).foregroundStyle(.secondary).frame(width: 240, alignment: .leading)
                }
                VStack(alignment: .leading, spacing: 6) {
                    stack().drawingGroup()
                    Text("drawingGroup() \u{2014} flattened to one Metal surface").font(.caption).foregroundStyle(.secondary).frame(width: 240, alignment: .leading)
                }
            }
            APICallout(".drawingGroup()")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Compositing group + drawing group") {
                HStack(alignment: .top, spacing: 24) {
                    VStack(spacing: 6) {
                        stack().compositingGroup().opacity(1.0)
                        Text(".compositingGroup().opacity(1.0)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        stack().drawingGroup().opacity(1.0)
                        Text(".drawingGroup().opacity(1.0)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            VariantRow(title: "Color rendering modes") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        stack().drawingGroup(colorMode: .nonLinear)
                        Text(".nonLinear").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        stack().drawingGroup(colorMode: .linear)
                        Text(".linear").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        stack().drawingGroup(colorMode: .extendedLinear)
                        Text(".extendedLinear").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                stack().drawingGroup(opaque: opaque, colorMode: colorMode)
                    .frame(maxWidth: .infinity, alignment: .center)
                Toggle("opaque", isOn: $opaque)
                    .toggleStyle(.switch)
                    .frame(maxWidth: 220, alignment: .leading)
                Picker("colorMode", selection: $colorMode) {
                    Text(".nonLinear").tag(ColorRenderingMode.nonLinear)
                    Text(".linear").tag(ColorRenderingMode.linear)
                    Text(".extendedLinear").tag(ColorRenderingMode.extendedLinear)
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: 360)
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Flattens to a Metal surface.", "drawingGroup composes the subtree's content into an offscreen image. Subsequent rendering operates on that image, not on the SwiftUI graph below.", "cpu"),
        ("Use for filter-heavy stacks.", "Multiple blurs / blend modes / color filters over a complex subtree are dramatically faster after a drawingGroup flatten.", "speedometer"),
        ("Native views won't render.", "AppKit-backed views (TextEditor, WebView, video) log a warning and show a placeholder \u{2014} drawingGroup can't capture them. Wrap only pure-SwiftUI subtrees.", "exclamationmark.triangle"),
        ("opaque: true forces alpha = 1.", "Set when the subtree is known opaque \u{2014} the renderer can drop the alpha channel for a small additional speedup.", "circle.fill"),
        ("colorMode for HDR / wide-gamut.", ".extendedLinear preserves out-of-gamut values across the offscreen render \u{2014} important for HDR content.", "sun.max")
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
    DrawingGroupPage().frame(width: 1100, height: 1000)
}
