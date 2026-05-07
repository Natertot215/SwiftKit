import SwiftUI

struct PresentedWindowToolbarStyleGalleryPage: View {
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

extension PresentedWindowToolbarStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.presentedWindowToolbarStyle",
        title: "PresentedWindowToolbarStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: ["View/presentedWindowToolbarStyle(_:)"],
        blurb: "Sets the style for the toolbar in windows created by interacting with this view. Accepts any type conforming to WindowToolbarStyle.",
        signature: "func presentedWindowToolbarStyle<S>(_ style: S) -> some View where S : WindowToolbarStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/view-styles/presentedwindowtoolbarstyle(_:).md",
        page: { AnyView(PresentedWindowToolbarStyleGalleryPage()) }
    )
}

#Preview {
    PresentedWindowToolbarStyleGalleryPage()
        .frame(width: 900, height: 700)
}
