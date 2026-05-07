import SwiftUI

struct VisibilityGalleryPage: View {
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

extension VisibilityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.visibility",
        title: "Visibility",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["Visibility"],
        blurb: "An enum representing the visibility of a UI element. Cases — automatic, visible, hidden — feed modifiers like labelsVisibility(_:), persistentSystemOverlays(_:), listRowSeparator(_:edges:), and toolbarBackgroundVisibility(_:).",
        signature: "@frozen enum Visibility",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/view-configuration/visibility.md",
        page: { AnyView(VisibilityGalleryPage()) }
    )
}

#Preview {
    VisibilityGalleryPage()
        .frame(width: 900, height: 700)
}
