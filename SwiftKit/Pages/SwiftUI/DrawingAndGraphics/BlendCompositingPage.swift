import SwiftUI

// SwiftUI blend mode + compositing reference page.
// Covers: View/blendMode(_:), BlendMode, View/compositingGroup(),
//         View/drawingGroup(opaque:colorMode:), ColorRenderingMode,
//         View/materialActiveAppearance(_:), MaterialActiveAppearance,
//         VisualEffect, EmptyVisualEffect, View/visualEffect(_:),
//         CompositorContent, CompositorContentBuilder, AnyCompositorContent
// macOS 10.15+

struct BlendCompositingPage: View {
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
            Text("BlendMode · CompositingGroup · DrawingGroup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("blendMode, compositingGroup, drawingGroup, ColorRenderingMode, VisualEffect, MaterialActiveAppearance.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/ · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Circle().fill(.blue).frame(width: 80, height: 80).offset(x: -20)
                Circle().fill(.red).frame(width: 80, height: 80).offset(x: 20).blendMode(.multiply)
            }
            .frame(width: 160, height: 100)
            APICallout("Circle().blendMode(.multiply)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            BCVariantRow(title: "BlendMode — common modes") {
                let modes: [(String, BlendMode)] = [
                    ("normal", .normal),
                    ("multiply", .multiply),
                    ("screen", .screen),
                    ("overlay", .overlay),
                    ("darken", .darken),
                    ("lighten", .lighten),
                    ("colorDodge", .colorDodge),
                    ("colorBurn", .colorBurn),
                    ("difference", .difference),
                    ("exclusion", .exclusion),
                    ("plusLighter", .plusLighter),
                    ("plusDarker", .plusDarker)
                ]
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(140)), count: 4), spacing: 12) {
                    ForEach(modes, id: \.0) { name, mode in
                        VStack(spacing: 4) {
                            ZStack {
                                Circle().fill(.blue).frame(width: 50, height: 50).offset(x: -12)
                                Circle().fill(.red).frame(width: 50, height: 50).offset(x: 12).blendMode(mode)
                            }
                            .frame(width: 80, height: 60)
                            .background(.black.opacity(0.05), in: RoundedRectangle(cornerRadius: 6))
                            Text(".\(name)").font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            BCVariantRow(title: "compositingGroup() — isolates blend modes") {
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 6) {
                        ZStack {
                            Color.accentColor.frame(width: 100, height: 80)
                            VStack(spacing: -10) {
                                Circle().fill(.white).frame(width: 50, height: 50)
                                Circle().fill(.white).frame(width: 50, height: 50)
                            }
                            .blendMode(.multiply)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("without compositingGroup")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        ZStack {
                            Color.accentColor.frame(width: 100, height: 80)
                            VStack(spacing: -10) {
                                Circle().fill(.white).frame(width: 50, height: 50)
                                Circle().fill(.white).frame(width: 50, height: 50)
                            }
                            .compositingGroup()
                            .blendMode(.multiply)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("with compositingGroup")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
            }

            BCVariantRow(title: "drawingGroup(opaque:colorMode:) — rasterize subtree") {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 20) {
                        VStack(spacing: 6) {
                            complexScene
                            Text("without drawingGroup").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            complexScene.drawingGroup()
                            Text(".drawingGroup()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                    Text("Rasterizes the view hierarchy to a single texture. Improves performance for complex blended content.")
                        .font(.footnote).foregroundStyle(.secondary)
                }
            }

            BCVariantRow(title: "ColorRenderingMode") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        sampleGradient.drawingGroup(opaque: false, colorMode: .linear)
                        Text(".linear").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        sampleGradient.drawingGroup(opaque: false, colorMode: .extendedLinear)
                        Text(".extendedLinear").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        sampleGradient.drawingGroup(opaque: false, colorMode: .nonLinear)
                        Text(".nonLinear").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            BCVariantRow(title: "visualEffect(_:) — geometry-aware visual transforms") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Circle()
                            .fill(.tint)
                            .frame(width: 80, height: 80)
                            .visualEffect { content, geometry in
                                content
                                    .scaleEffect(CGSize(width: geometry.size.width / 80, height: 1))
                                    .blur(radius: 2)
                            }
                        APICallout(".visualEffect { content, geometry in ... }")
                    }
                    Text("visualEffect provides the view's GeometryProxy without breaking layout — useful for parallax and size-reactive effects.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: 300)
                }
            }

            BCVariantRow(title: "materialActiveAppearance(_:)") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        ZStack {
                            LinearGradient(colors: [.blue, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                            RoundedRectangle(cornerRadius: 8).fill(.thinMaterial).frame(width: 80, height: 50)
                        }
                        .frame(width: 100, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text(".active").font(.caption).foregroundStyle(.secondary)
                    }
                    Text("materialActiveAppearance(_:) controls whether materials render in their active or inactive appearance regardless of window focus state.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: 300)
                }
            }
        }
    }

    private var complexScene: some View {
        ZStack {
            ForEach(0..<6, id: \.self) { i in
                Circle()
                    .fill(Color(hue: Double(i) / 6, saturation: 0.8, brightness: 0.9).opacity(0.7))
                    .frame(width: 40, height: 40)
                    .offset(
                        x: 25 * cos(.pi * 2 / 6 * Double(i)),
                        y: 25 * sin(.pi * 2 / 6 * Double(i))
                    )
                    .blendMode(.plusLighter)
            }
        }
        .frame(width: 110, height: 110)
    }

    private var sampleGradient: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
            .frame(width: 100, height: 60)
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BCVariantRow(title: "Blend mode showcase — additive vs subtractive") {
                HStack(spacing: 20) {
                    ForEach([("+Lighter", BlendMode.plusLighter), ("Multiply", .multiply), ("Screen", .screen)], id: \.0) { name, mode in
                        VStack(spacing: 6) {
                            ZStack {
                                Circle().fill(.red).frame(width: 60, height: 60).offset(x: -15, y: -10)
                                Circle().fill(.green).frame(width: 60, height: 60).offset(x: 15, y: -10).blendMode(mode)
                                Circle().fill(.blue).frame(width: 60, height: 60).offset(x: 0, y: 15).blendMode(mode)
                            }
                            .frame(width: 100, height: 90)
                            .background(.black.opacity(0.05), in: RoundedRectangle(cornerRadius: 8))
                            Text(name).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("blendMode affects how a view composites with views below it.", "The blend mode is applied between the view and the content already drawn beneath it in the same compositing group. It doesn't affect siblings at the same level unless they're in a ZStack.", "square.2.layers.3d"),
        ("compositingGroup isolates blend math.", "Without compositingGroup, blend modes leak through to the parent background. Wrap siblings in a group with .compositingGroup() before applying a blend mode to unify them as one layer.", "square.stack"),
        ("drawingGroup rasterizes for performance.", "Rasterizing a complex blended scene to a single texture allows the GPU to composite it efficiently. Use for particle effects, heavy shadow stacks, or blur-with-blend combinations.", "cpu"),
        ("visualEffect(_:) reads geometry without breaking layout.", "Unlike GeometryReader, .visualEffect does not affect the layout of other views. It's read-only geometry — ideal for scroll-driven parallax.", "arrow.up.left.and.arrow.down.right"),
        ("MaterialActiveAppearance defaults to automatic.", "By default, materials appear inactive (dimmed) when the window loses focus. Override with .materialActiveAppearance(.always) to keep them vivid.", "eye")
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

private struct BCVariantRow<Content: View>: View {
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
    BlendCompositingPage()
        .frame(width: 1200, height: 1400)
}
