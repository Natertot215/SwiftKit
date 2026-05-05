import SwiftUI

// SwiftUI `View/shadow(color:radius:x:y:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/shadow(color:radius:x:y:).md
// macOS 10.15+. Adds a colored shadow behind the view.

struct ShadowPage: View {
    @State private var radius: Double = 6
    @State private var offsetX: Double = 0
    @State private var offsetY: Double = 4

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
            Text("View/shadow(color:radius:x:y:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adds a colored shadow behind the view. Default color is a semi-transparent black; radius blurs the shadow's edges; x and y offset it.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/shadow(color:radius:x:y:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private func tile() -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.tint)
            .frame(width: 100, height: 70)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 32) {
                tile()
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                tile().shadow(radius: 6, x: 0, y: 4)
            }
            APICallout(".shadow(radius: 6, x: 0, y: 4)")
        }
        .padding(.bottom, 16)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 32) {
            VariantRow(title: "Radius progression") {
                HStack(spacing: 24) {
                    ForEach([0.0, 2, 6, 12, 20], id: \.self) { r in
                        VStack(spacing: 6) {
                            tile().shadow(radius: r)
                            Text("radius: \(Int(r))")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.bottom, 12)
            }

            VariantRow(title: "Offset variants (radius 8)") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        tile().shadow(radius: 8, x: 0, y: 0)
                        Text("(0, 0)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile().shadow(radius: 8, x: 8, y: 0)
                        Text("(8, 0)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile().shadow(radius: 8, x: 0, y: 8)
                        Text("(0, 8)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile().shadow(radius: 8, x: -6, y: 6)
                        Text("(-6, 6)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            VariantRow(title: "Color variants") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        tile().shadow(radius: 8)
                        Text("default").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile().shadow(color: .accentColor, radius: 12)
                        Text(".accentColor").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile().shadow(color: .pink, radius: 12)
                        Text(".pink").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile().shadow(color: .primary.opacity(0.4), radius: 4)
                        Text(".primary.opacity(0.4)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                tile()
                    .shadow(radius: radius, x: offsetX, y: offsetY)
                    .animation(.easeInOut, value: radius)
                    .animation(.easeInOut, value: offsetX)
                    .animation(.easeInOut, value: offsetY)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Text("radius").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $radius, in: 0...30).frame(width: 240)
                    Text(String(format: "%.1f", radius)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                HStack {
                    Text("x").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $offsetX, in: -20...20).frame(width: 240)
                    Text(String(format: "%+.1f", offsetX)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                HStack {
                    Text("y").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $offsetY, in: -20...20).frame(width: 240)
                    Text(String(format: "%+.1f", offsetY)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Default color is semi-transparent black.", "Specifically Color(.sRGBLinear, white: 0, opacity: 0.33). Override with the color: parameter for tinted shadows.", "circle.fill"),
        ("Radius 0 = sharp shadow.", "Use a radius of 0 for crisp drop-shadow chrome. Larger radii are softer.", "circle.dashed"),
        ("x and y offset the shadow.", "Positive x is leading-to-trailing; positive y is top-to-bottom. The frame is unchanged.", "arrow.up.left.and.arrow.down.right"),
        ("Animatable.", "Inside withAnimation, the radius and offsets interpolate smoothly \u{2014} useful for elevation transitions.", "wand.and.sparkles"),
        ("ShadowStyle (macOS 13+) is a richer alternative.", "When using .shadow(color:radius:) on a Shape, consider passing a ShadowStyle (drop or inner) for more control.", "rectangle.stack")
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
    ShadowPage().frame(width: 1100, height: 1000)
}
