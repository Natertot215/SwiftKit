import SwiftUI

struct PopoverTipGalleryPage: View {
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

extension PopoverTipGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.popoverTip",
        title: "PopoverTip",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/popoverTip(_:arrowEdge:action:)"
        ],
        blurb: "TipKit modifier that displays a Tip as a popover anchored to a view.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/popovertip(_:arrowedge:action:).md",
        page: { AnyView(PopoverTipGalleryPage()) }
    )
}

#Preview {
    PopoverTipGalleryPage()
        .frame(width: 900, height: 700)
}
