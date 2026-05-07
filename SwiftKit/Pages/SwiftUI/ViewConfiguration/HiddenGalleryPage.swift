import SwiftUI

struct HiddenGalleryPage: View {
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

extension HiddenGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.hidden",
        title: "Hidden",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/hidden()"],
        blurb: "Hides this view unconditionally while keeping it in the layout. The view stays present and reserves space, but SwiftUI won't draw it or route interactions to it.",
        signature: "func hidden() -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-configuration/hidden().md",
        page: { AnyView(HiddenGalleryPage()) }
    )
}

#Preview {
    HiddenGalleryPage()
        .frame(width: 900, height: 700)
}
