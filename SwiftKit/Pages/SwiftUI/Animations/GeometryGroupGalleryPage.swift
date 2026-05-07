import SwiftUI

// geometryGroup() — isolates a child's geometry so layout-driven transitions
// animate as a unit instead of per-frame.

struct GeometryGroupGalleryPage: View {
    @State private var swapped: Bool = false

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Live demo — two stacks side-by-side, only the right one geometryGroup'd

            VariantTile(
                name: "Without .geometryGroup()",
                api: "// no isolation"
            ) {
                VStack(spacing: 6) {
                    swappingStack
                    Text("Children move independently")
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                }
            }

            VariantTile(
                name: "With .geometryGroup()",
                api: ".geometryGroup()"
            ) {
                VStack(spacing: 6) {
                    swappingStack
                        .geometryGroup()
                    Text("Children move as a group")
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                }
            }

            VariantTile(
                name: "Swap children",
                api: "withAnimation(.spring) { swapped.toggle() }"
            ) {
                Button(swapped ? "Reset" : "Swap order") {
                    withAnimation(.spring(duration: 0.6, bounce: 0.2)) {
                        swapped.toggle()
                    }
                }
                .buttonStyle(.bordered)
                .controlSize(.small)
            }

            // MARK: Reference

            ReferenceTile(
                name: "View.geometryGroup()",
                signature: "func geometryGroup() -> some View",
                note: "Isolates the geometry (position and size) of this view from its parent. Use when interpolating a layout change so descendants animate as a single rigid group rather than each animating their own frame independently."
            )

            ReferenceTile(
                name: "When to reach for it",
                signature: "// layout-driven transitions",
                note: "Pair with structural changes — reordering, insertions, or .matchedGeometryEffect — when child views appear to animate \"in pieces\" rather than as a whole. .geometryGroup() unifies their motion."
            )
        }
    }

    private var swappingStack: some View {
        HStack(spacing: 6) {
            ForEach(swapped ? [3, 2, 1] : [1, 2, 3], id: \.self) { i in
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(.tint.opacity(Double(i) / 3.0))
                    .frame(width: 22, height: 28)
            }
        }
    }
}

extension GeometryGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.geometryGroup",
        title: "GeometryGroup",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["View/geometryGroup()"],
        blurb: "Isolates the geometry (e.g. position and size) of the view from its parent view. Useful when interpolating layout-dependent transitions so child geometry animates as a unit.",
        signature: "func geometryGroup() -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/geometrygroup().md",
        page: { AnyView(GeometryGroupGalleryPage()) }
    )
}

#Preview {
    GeometryGroupGalleryPage()
        .frame(width: 900, height: 700)
}
