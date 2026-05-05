import SwiftUI

// SwiftUI `View/rotation3DEffect(_:axis:anchor:anchorZ:perspective:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/rotation3deffect(_:axis:anchor:anchorz:perspective:).md
// macOS 10.15+. Renders a view as if rotated in three dimensions around the specified axis.

struct Rotation3DEffectPage: View {
    @State private var degrees: Double = 30

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
            Text("View/rotation3DEffect(_:axis:anchor:anchorZ:perspective:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Renders a view's content as if rotated in three dimensions around the specified axis. The renderer projects the rotated content back onto the original 2D plane.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/rotation3deffect(_:axis:anchor:anchorz:perspective:).md \u{00b7} macOS 10.15+")
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
            HStack(spacing: 32) {
                tile("Y-axis").rotation3DEffect(.degrees(45), axis: (x: 0, y: 1, z: 0))
            }
            APICallout(".rotation3DEffect(.degrees(45), axis: (x: 0, y: 1, z: 0))")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Per-axis rotation") {
                HStack(spacing: 32) {
                    VStack(spacing: 6) {
                        tile("X").rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                        Text("axis: (1, 0, 0)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile("Y").rotation3DEffect(.degrees(45), axis: (x: 0, y: 1, z: 0))
                        Text("axis: (0, 1, 0)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile("Z").rotation3DEffect(.degrees(45), axis: (x: 0, y: 0, z: 1))
                        Text("axis: (0, 0, 1)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            VariantRow(title: "Combined axis (1,1,0)") {
                HStack(spacing: 24) {
                    ForEach([0.0, 25, 45, 65], id: \.self) { d in
                        VStack(spacing: 6) {
                            tile("\(Int(d))\u{00b0}")
                                .rotation3DEffect(.degrees(d), axis: (x: 1, y: 1, z: 0))
                            Text(".degrees(\(Int(d)))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            VariantRow(title: "Perspective (Y axis, 60\u{00b0})") {
                HStack(spacing: 32) {
                    ForEach([0.2, 0.5, 1.0, 2.0], id: \.self) { p in
                        VStack(spacing: 6) {
                            tile(String(format: "p=%.1f", p))
                                .rotation3DEffect(.degrees(60), axis: (x: 0, y: 1, z: 0), perspective: p)
                            Text(String(format: "perspective: %.1f", p))
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Interactive (Y axis)") {
            VStack(alignment: .leading, spacing: 12) {
                tile("\(Int(degrees))\u{00b0}")
                    .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                    .animation(.easeInOut, value: degrees)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Text("degrees").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $degrees, in: -180...180).frame(width: 280)
                    Text(String(format: "%+.0f\u{00b0}", degrees)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("axis is a tuple, not a vector type.", "(x: CGFloat, y: CGFloat, z: CGFloat) — typically use (1,0,0), (0,1,0), (0,0,1) for canonical axes; combinations rotate around an arbitrary axis.", "axis.text.fill"),
        ("Frame is unchanged.", "Like rotationEffect, this is a render-only transform. Layout neighbors don't reflow.", "rectangle.dashed"),
        ("Use perspective to control vanishing point.", "Default 1. Smaller values flatten the perspective; larger values exaggerate it. Values near 0 effectively render an isometric projection.", "scope"),
        ("On visionOS prefer perspectiveRotationEffect.", "For true 3D content layout in visionOS, use perspectiveRotationEffect or rotation3DEffect(_:axis:anchor:) without a perspective parameter.", "visionpro")
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
    Rotation3DEffectPage().frame(width: 1100, height: 1000)
}
