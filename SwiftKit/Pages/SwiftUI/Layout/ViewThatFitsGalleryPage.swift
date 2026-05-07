import SwiftUI

struct ViewThatFitsGalleryPage: View {
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

extension ViewThatFitsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.viewThatFits",
        title: "ViewThatFits",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "ViewThatFits",
        ],
        blurb: "A view that adapts to the available space by selecting the first child whose ideal size fits within the proposal. Provide candidates in preference order — usually largest to smallest — to gracefully degrade content under tight space constraints.",
        signature: "@frozen struct ViewThatFits<Content> where Content : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/viewthatfits.md",
        page: { AnyView(ViewThatFitsGalleryPage()) }
    )
}

#Preview {
    ViewThatFitsGalleryPage()
        .frame(width: 900, height: 700)
}
