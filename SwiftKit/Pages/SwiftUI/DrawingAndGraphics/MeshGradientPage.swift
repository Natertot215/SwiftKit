import SwiftUI

// SwiftUI `MeshGradient` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/meshgradient.md
// macOS 15.0+. A 2D gradient defined by a grid of positioned colors.

struct MeshGradientPage: View {
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
            Text("MeshGradient")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A two-dimensional gradient defined by a grid of positioned colors. Colors interpolate across tessellated Bézier patches.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/meshgradient.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [0.5, 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ],
                colors: [
                    .red, .purple, .indigo,
                    .orange, .white, .blue,
                    .yellow, .green, .mint
                ]
            )
            .frame(width: 320, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            APICallout("MeshGradient(width: 3, height: 3, points: [...], colors: [...])")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            MGVariantRow(title: "2x2 grid — corner colors") {
                MeshGradient(
                    width: 2,
                    height: 2,
                    points: [[0, 0], [1, 0], [0, 1], [1, 1]],
                    colors: [.blue, .purple, .orange, .pink]
                )
                .frame(width: 280, height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            MGVariantRow(title: "3x3 cool palette") {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [
                        [0, 0], [0.5, 0], [1, 0],
                        [0, 0.5], [0.5, 0.5], [1, 0.5],
                        [0, 1], [0.5, 1], [1, 1]
                    ],
                    colors: [
                        .indigo, .blue, .cyan,
                        .blue, .teal, .mint,
                        .purple, .indigo, .blue
                    ]
                )
                .frame(width: 280, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            MGVariantRow(title: "Distorted control points — bowed mesh") {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [
                        [0, 0],   [0.5, 0.1], [1, 0],
                        [0.1, 0.5], [0.6, 0.6], [0.9, 0.5],
                        [0, 1],   [0.5, 0.9], [1, 1]
                    ],
                    colors: [
                        .pink, .orange, .yellow,
                        .red, .white, .green,
                        .purple, .blue, .teal
                    ]
                )
                .frame(width: 280, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        MGVariantRow(title: "Use as ShapeStyle — fill any Shape") {
            HStack(spacing: 16) {
                Circle()
                    .fill(MeshGradient(
                        width: 2, height: 2,
                        points: [[0, 0], [1, 0], [0, 1], [1, 1]],
                        colors: [.purple, .pink, .orange, .yellow]
                    ))
                    .frame(width: 120, height: 120)
                RoundedRectangle(cornerRadius: 16)
                    .fill(MeshGradient(
                        width: 2, height: 2,
                        points: [[0, 0], [1, 0], [0, 1], [1, 1]],
                        colors: [.blue, .indigo, .teal, .mint]
                    ))
                    .frame(width: 160, height: 120)
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("MeshGradient is both a View and a ShapeStyle.", "It can stand alone as a view (in a frame) or fill a Shape via shape.fill(meshGradient).", "square.grid.3x3.fill"),
        ("Width × height defines the grid.", "Pass width and height counts; provide width*height entries for points and colors. SIMD2<Float> is the typical point literal — [x, y] in [0, 1] coordinates.", "grid"),
        ("Colors interpolate via Bézier patches.", "By default, colors interpolate linearly. Set smoothsColors: true on the initializer to interpolate via cubic curves derived from neighbor colors for softer transitions.", "wand.and.stars"),
        ("Distort control points to bend the mesh.", "Move grid points inward/outward to bow or warp the mesh. Each interior vertex has four implicit Bézier tangents the framework derives from its neighbors.", "scribble"),
        ("macOS 15+ only.", "MeshGradient was introduced in macOS 15 / iOS 18. There is no fallback on earlier OS versions; gate with #available if you target older systems.", "calendar")
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

private struct MGVariantRow<Content: View>: View {
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
    MeshGradientPage()
        .frame(width: 1100, height: 1200)
}
