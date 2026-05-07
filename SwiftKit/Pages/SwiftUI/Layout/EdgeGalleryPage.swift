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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
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
