import SwiftUI

// SwiftUI transform + geometry effects reference page.
// Covers: View/scaleEffect, View/scaledToFit, View/scaledToFill, View/aspectRatio,
//         View/rotationEffect, View/rotation3DEffect, View/transformEffect,
//         View/projectionEffect, ProjectionTransform, ContentMode,
//         View/blur, View/mask(alignment:_:), View/clipped, View/clipShape
// macOS 10.15+

struct TransformEffectsPage: View {
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0

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
            Text("Transform · Clip · Blur Effects")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("scaleEffect, rotationEffect, rotation3DEffect, transformEffect, clipShape, blur, mask, aspectRatio, ContentMode.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/ · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var sampleBox: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 80, height: 60)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 20) {
                sampleBox.scaleEffect(0.7)
                sampleBox
                sampleBox.scaleEffect(1.3)
            }
            APICallout(".scaleEffect(0.7) / 1.0 / 1.3")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TEVariantRow(title: "scaleEffect(_:anchor:)") {
                HStack(spacing: 20) {
                    ForEach([0.5, 0.75, 1.0, 1.5], id: \.self) { s in
                        VStack(spacing: 4) {
                            sampleBox.scaleEffect(s)
                            Text(String(format: "%.2f", s)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            TEVariantRow(title: "scaleEffect(x:y:anchor:) — non-uniform") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        sampleBox.scaleEffect(x: 1.5, y: 0.5)
                        APICallout("x:1.5, y:0.5")
                    }
                    VStack(spacing: 6) {
                        sampleBox.scaleEffect(x: 0.5, y: 1.5)
                        APICallout("x:0.5, y:1.5")
                    }
                    VStack(spacing: 6) {
                        sampleBox.scaleEffect(x: -1, y: 1)
                        APICallout("x:-1 (mirror)")
                    }
                }
            }

            TEVariantRow(title: "rotationEffect(_:anchor:)") {
                HStack(spacing: 20) {
                    ForEach([0, 30, 60, 90, 180], id: \.self) { deg in
                        VStack(spacing: 6) {
                            sampleBox.rotationEffect(.degrees(Double(deg)))
                            Text("\(deg)°").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            TEVariantRow(title: "rotation3DEffect(_:axis:anchor:anchorZ:perspective:)") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        sampleBox.rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                        APICallout("axis: (x:1,y:0,z:0)")
                    }
                    VStack(spacing: 6) {
                        sampleBox.rotation3DEffect(.degrees(45), axis: (x: 0, y: 1, z: 0))
                        APICallout("axis: (x:0,y:1,z:0)")
                    }
                    VStack(spacing: 6) {
                        sampleBox.rotation3DEffect(.degrees(45), axis: (x: 1, y: 1, z: 0))
                        APICallout("axis: (x:1,y:1,z:0)")
                    }
                }
            }

            TEVariantRow(title: "aspectRatio(_:contentMode:) — .fit vs .fill") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 60)
                            .background(.secondary.opacity(0.15), in: Rectangle())
                        APICallout(".fit")
                    }
                    VStack(spacing: 6) {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 60)
                            .clipped()
                            .background(.secondary.opacity(0.15), in: Rectangle())
                        APICallout(".fill + .clipped()")
                    }
                }
            }

            TEVariantRow(title: "clipShape(_:style:)") {
                HStack(spacing: 16) {
                    let shapes: [(String, any Shape)] = [
                        ("Circle", Circle()),
                        ("Capsule", Capsule()),
                        ("RoundedRectangle", RoundedRectangle(cornerRadius: 16))
                    ]
                    ForEach(shapes, id: \.0) { name, shape in
                        VStack(spacing: 6) {
                            Image(systemName: "photo.fill")
                                .font(.title)
                                .frame(width: 80, height: 60)
                                .background(LinearGradient(colors: [.blue, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .clipShape(AnyShape(shape))
                            Text(name).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            TEVariantRow(title: "mask(alignment:_:) — shape masking") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(width: 120, height: 80)
                            .mask {
                                Text("MASKED")
                                    .font(.title2.bold())
                            }
                        APICallout(".mask { Text(...) }")
                    }
                    VStack(spacing: 6) {
                        LinearGradient(colors: [Color.accentColor, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(width: 80, height: 80)
                            .mask { Circle() }
                        APICallout(".mask { Circle() }")
                    }
                }
            }

            TEVariantRow(title: "blur(radius:opaque:)") {
                HStack(spacing: 16) {
                    ForEach([0, 2, 5, 10], id: \.self) { r in
                        VStack(spacing: 6) {
                            sampleBox.blur(radius: CGFloat(r))
                            Text("radius: \(r)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            TEVariantRow(title: "transformEffect — CGAffineTransform") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        sampleBox
                            .transformEffect(CGAffineTransform(a: 1, b: 0.3, c: 0, d: 1, tx: 0, ty: 0))
                        APICallout(".transformEffect(skew)")
                    }
                    VStack(spacing: 6) {
                        sampleBox
                            .transformEffect(CGAffineTransform(translationX: 10, y: -10))
                        APICallout(".transformEffect(translation)")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TEVariantRow(title: "Interactive scale + rotation") {
                VStack(alignment: .leading, spacing: 12) {
                    sampleBox
                        .scaleEffect(scale)
                        .rotationEffect(.degrees(rotation))
                        .animation(.spring, value: scale)
                        .animation(.spring, value: rotation)
                        .frame(height: 120)

                    HStack {
                        Text("Scale").font(.caption).foregroundStyle(.secondary).frame(width: 60, alignment: .leading)
                        Slider(value: $scale, in: 0.2...3.0).frame(width: 220)
                        Text(String(format: "%.2f", scale)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Rotation").font(.caption).foregroundStyle(.secondary).frame(width: 60, alignment: .leading)
                        Slider(value: $rotation, in: -180...180).frame(width: 220)
                        Text("\(Int(rotation))°").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("scaleEffect does not affect layout.", "The view retains its original layout frame when scaled — neighboring views don't reflow. Use .frame after scaling if you need layout to respect the new size.", "arrow.up.left.and.arrow.down.right"),
        ("rotation3DEffect with perspective.", "Pass a perspective value > 0 (e.g. 1) to the perspective parameter for a realistic 3D card-flip look. perspective: 0 gives a flat projection.", "view.3d"),
        ("clipShape vs mask — subtle difference.", ".clipShape clips using the alpha of the shape; .mask clips using the alpha of any view (text, gradients, etc.) giving more compositional flexibility.", "scissors"),
        ("blur applies after the view is rendered.", "The blur is a post-process filter — it blurs the entire rendered subtree including its background. Combine with .background for frosted-glass effects.", "drop.halffull"),
        ("transformEffect applies a raw CGAffineTransform.", "Use when you need skew, non-axis-aligned scale, or other transforms not covered by the higher-level modifiers.", "square.and.pencil")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct TEVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    TransformEffectsPage()
        .frame(width: 1100, height: 1400)
}
