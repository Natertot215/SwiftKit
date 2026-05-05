import SwiftUI

// SwiftUI `View/projectionEffect(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/projectioneffect(_:).md
// macOS 10.15+. Applies a ProjectionTransform to the rendered output.

struct ProjectionEffectPage: View {
    @State private var degrees: Double = 0

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
            Text("View/projectionEffect(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Applies a ProjectionTransform to the view's rendered output. Use it to bridge a CATransform3D-style 3D matrix into SwiftUI's render pipeline.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/projectioneffect(_:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private func tile(_ label: String) -> some View {
        Text(label)
            .font(.headline).foregroundStyle(.white)
            .frame(width: 110, height: 70)
            .background(Color.accentColor.gradient, in: RoundedRectangle(cornerRadius: 8))
    }

    private var defaultDemo: some View {
        let t = CATransform3DMakeRotation(-30 * .pi / 180, 0, 0, 1)
        return VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 32) {
                tile("Original")
                tile("Rotated").projectionEffect(ProjectionTransform(t))
            }
            APICallout(".projectionEffect(.init(CATransform3DMakeRotation(-30 * .pi / 180, 0, 0, 1)))")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Identity / affine / 3D rotation") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        tile("identity").projectionEffect(ProjectionTransform())
                        Text("ProjectionTransform()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile("affine")
                            .projectionEffect(ProjectionTransform(
                                CGAffineTransform.identity.scaledBy(x: 0.85, y: 0.85)
                            ))
                        Text("init(CGAffineTransform)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile("3D-Z 25\u{00b0}")
                            .projectionEffect(ProjectionTransform(
                                CATransform3DMakeRotation(25 * .pi / 180, 0, 0, 1)
                            ))
                        Text("init(CATransform3D)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            VariantRow(title: "Inversion") {
                let t = ProjectionTransform(CGAffineTransform(scaleX: 1.4, y: 1.4))
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        tile("forward").projectionEffect(t)
                        Text(".scaledBy 1.4x").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile("inverted").projectionEffect(t.inverted())
                        Text(".inverted()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Interactive (rotate around z)") {
            VStack(alignment: .leading, spacing: 12) {
                tile("Live")
                    .projectionEffect(ProjectionTransform(
                        CATransform3DMakeRotation(degrees * .pi / 180, 0, 0, 1)
                    ))
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
        ("Bridges CATransform3D and CGAffineTransform.", "ProjectionTransform has init(_: CATransform3D) and init(_: CGAffineTransform). Useful when porting Core Animation code or composing 3D pre-multiplied matrices.", "square.grid.3x3.fill"),
        ("Frame is unchanged.", "Render-only \u{2014} layout doesn't reflow. Apply a frame before the projection if you need a specific bounding box.", "rectangle.dashed"),
        ("ProjectionTransform exposes .invert / .concatenating.", "You can compose multiple transforms or invert one in place via the value-type methods.", "function"),
        ("isAffine flags 2D matrices.", "ProjectionTransform's isAffine indicates whether the matrix could be reduced to a CGAffineTransform.", "checkmark.circle")
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
    ProjectionEffectPage().frame(width: 1100, height: 1000)
}
