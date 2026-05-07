import SwiftUI

struct EdgeGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".top",
                api: ".padding(.top, 24)"
            ) {
                edgeDemoBox(.top)
            }

            VariantTile(
                name: ".leading",
                api: ".padding(.leading, 24)"
            ) {
                edgeDemoBox(.leading)
            }

            VariantTile(
                name: ".bottom",
                api: ".padding(.bottom, 24)"
            ) {
                edgeDemoBox(.bottom)
            }

            VariantTile(
                name: ".trailing",
                api: ".padding(.trailing, 24)"
            ) {
                edgeDemoBox(.trailing)
            }

            VariantTile(
                name: "Edge.Set.horizontal",
                api: ".padding(.horizontal, 24)"
            ) {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.tint.opacity(0.18))
                        .frame(width: 140, height: 56)
                    RoundedRectangle(cornerRadius: 6)
                        .strokeBorder(.tint, lineWidth: 1)
                        .frame(width: 92, height: 56)
                }
            }

            VariantTile(
                name: "Edge.Set.vertical",
                api: ".padding(.vertical, 16)"
            ) {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.tint.opacity(0.18))
                        .frame(width: 100, height: 80)
                    RoundedRectangle(cornerRadius: 6)
                        .strokeBorder(.tint, lineWidth: 1)
                        .frame(width: 100, height: 48)
                }
            }

            ReferenceTile(
                name: "enum Edge",
                signature: "@frozen enum Edge : Int8, CaseIterable  // .top, .leading, .bottom, .trailing",
                note: "The four rectangular edges in reading-order coordinates. Used by safe-area, padding, border, and overlay modifiers to address one or more sides."
            )

            ReferenceTile(
                name: "Edge.Set",
                signature: "struct Edge.Set : OptionSet  // .top, .leading, .bottom, .trailing, .horizontal, .vertical, .all",
                note: "Pass to .padding/.border/.safeAreaInset to target multiple edges at once. .horizontal == [.leading, .trailing]; .vertical == [.top, .bottom]."
            )

            ReferenceTile(
                name: "HorizontalEdge / VerticalEdge",
                signature: "@frozen enum HorizontalEdge  /  @frozen enum VerticalEdge",
                note: "Single-axis variants for APIs that only accept one orientation — listRowSeparator(_:edges:), .scrollIndicators(_:edges:), and similar narrow modifiers."
            )

            ReferenceTile(
                name: "Edge3D",
                signature: "@frozen enum Edge3D  // adds .front, .back",
                note: "Six-faced cubic edge type for spatial layouts on visionOS. Extends the 2D Edge with depth-axis values; safe to ignore on macOS-only apps.",
                badge: "visionOS"
            )
        }
    }

    private func edgeDemoBox(_ edge: Edge) -> some View {
        let alignment: Alignment = {
            switch edge {
            case .top: return .top
            case .leading: return .leading
            case .bottom: return .bottom
            case .trailing: return .trailing
            }
        }()
        return ZStack(alignment: alignment) {
            RoundedRectangle(cornerRadius: 6)
                .fill(.tint.opacity(0.18))
                .frame(width: 120, height: 80)
            RoundedRectangle(cornerRadius: 4)
                .fill(.tint)
                .frame(width: 36, height: 12)
                .padding(6)
        }
    }
}

extension EdgeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.edge",
        title: "Edge",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Edge",
            "Edge3D",
            "HorizontalEdge",
            "VerticalEdge",
            "swiftui.layout-adjustments.edge",
            "swiftui.layout-adjustments.edge3d",
            "swiftui.layout-adjustments.horizontaledge",
            "swiftui.layout-adjustments.verticaledge",
        ],
        blurb: "An enumeration of the rectangular edges (top, bottom, leading, trailing) used by safe-area, padding, and border modifiers. HorizontalEdge and VerticalEdge narrow the set to one axis; Edge3D adds the depth axis for spatial layouts.",
        signature: "@frozen enum Edge : Int8, CaseIterable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/edge.md",
        page: { AnyView(EdgeGalleryPage()) }
    )
}

#Preview {
    EdgeGalleryPage()
        .frame(width: 900, height: 700)
}
