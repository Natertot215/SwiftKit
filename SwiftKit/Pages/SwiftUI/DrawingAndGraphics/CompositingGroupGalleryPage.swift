import SwiftUI

// SwiftUI `View/compositingGroup()` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/compositinggroup().md
// macOS 10.15+. Wraps the view in a compositing group so ancestor effects apply after this view renders.

struct CompositingGroupGalleryPage: View {
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
            Text("View/compositingGroup()")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Wraps the subtree into a compositing group. Ancestor opacity / blendMode / shadow apply once to the flattened group instead of independently to each child.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/compositinggroup().md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private func stack() -> some View {
        ZStack {
            Text("Compositing")
                .font(.largeTitle)
                .foregroundStyle(.black)
                .padding(20)
                .background(Color.red)
            Text("Compositing")
                .font(.largeTitle)
                .foregroundStyle(.primary)
                .blur(radius: 2)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 32) {
                VStack(alignment: .leading, spacing: 6) {
                    stack().opacity(0.5)
                    Text("Without compositingGroup() \u{2014} each child is 50% transparent independently, blur sees the red rect at full opacity.").font(.caption).foregroundStyle(.secondary).frame(width: 280, alignment: .leading)
                }
                VStack(alignment: .leading, spacing: 6) {
                    stack().compositingGroup().opacity(0.5)
                    Text("With compositingGroup() \u{2014} children flatten first, then 50% opacity applies to the composed result.").font(.caption).foregroundStyle(.secondary).frame(width: 280, alignment: .leading)
                }
            }
            APICallout(".compositingGroup().opacity(0.5)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Shadow over multiple children") {
                HStack(alignment: .top, spacing: 32) {
                    VStack(alignment: .leading, spacing: 6) {
                        ZStack {
                            Circle().fill(.blue).frame(width: 60, height: 60).offset(x: -10)
                            Circle().fill(.green).frame(width: 60, height: 60).offset(x: 30)
                        }
                        .shadow(color: .black.opacity(0.5), radius: 6, y: 4)
                        .frame(width: 140, height: 80)

                        Text("Shadow per child \u{2014} interior overlaps darken").font(.caption).foregroundStyle(.secondary).frame(width: 220, alignment: .leading)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        ZStack {
                            Circle().fill(.blue).frame(width: 60, height: 60).offset(x: -10)
                            Circle().fill(.green).frame(width: 60, height: 60).offset(x: 30)
                        }
                        .compositingGroup()
                        .shadow(color: .black.opacity(0.5), radius: 6, y: 4)
                        .frame(width: 140, height: 80)

                        Text("compositingGroup() \u{2014} single outer silhouette shadow").font(.caption).foregroundStyle(.secondary).frame(width: 220, alignment: .leading)
                    }
                }
            }

            VariantRow(title: "BlendMode within an opacity scope") {
                HStack(alignment: .top, spacing: 32) {
                    VStack(alignment: .leading, spacing: 6) {
                        ZStack {
                            Color.yellow.frame(width: 80, height: 80)
                            Color.red.frame(width: 60, height: 60).offset(x: 22, y: 22)
                                .blendMode(.multiply)
                        }
                        .opacity(0.5)
                        .frame(width: 110, height: 110)
                        Text("Blend before opacity").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        ZStack {
                            Color.yellow.frame(width: 80, height: 80)
                            Color.red.frame(width: 60, height: 60).offset(x: 22, y: 22)
                                .blendMode(.multiply)
                        }
                        .compositingGroup()
                        .opacity(0.5)
                        .frame(width: 110, height: 110)
                        Text("compositingGroup() \u{2014} blend confined").font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Drag-able comparison") {
            Text("compositingGroup is a compile-time switch \u{2014} no interactive state. The Variants section above shows the resulting visual difference.")
                .font(.callout).foregroundStyle(.tertiary).italic()
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Stages effects.", "compositingGroup splits a render into two stages: (1) flatten this subtree, (2) apply ancestor effects (opacity, blendMode, shadow) to the result.", "rectangle.stack"),
        ("Free with simple subtrees.", "For one or two children with no overlap, compositingGroup costs nothing visible \u{2014} ancestor effects already apply correctly.", "checkmark.circle"),
        ("drawingGroup is more aggressive.", "compositingGroup flattens for compositing only; drawingGroup rasterizes into a Metal surface. Use drawingGroup when you also need a perf flatten.", "cpu"),
        ("Common need: outer-only shadow.", "Adding a shadow to a multi-child container creates per-child shadows \u{2014} compositingGroup before .shadow gives a single silhouette shadow.", "shadow")
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

extension CompositingGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.compositingGroup",
        title: "CompositingGroup",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/compositingGroup()",
            "View/drawingGroup(opaque:colorMode:)",
            "ColorRenderingMode"
        ],
        blurb: "Forces a view's contents to render into an offscreen buffer before being composited — compositingGroup for SwiftUI semantics, drawingGroup for Metal-backed flattening, with ColorRenderingMode controlling working color space.",
        signature: nil,
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/compositinggroup().md",
        page: { AnyView(CompositingGroupGalleryPage()) }
    )
}

#Preview {
    CompositingGroupGalleryPage().frame(width: 1100, height: 1000)
}
