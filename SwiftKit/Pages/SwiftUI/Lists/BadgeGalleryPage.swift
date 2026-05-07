import SwiftUI

struct BadgeGalleryPage: View {
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

extension BadgeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.badge",
        title: "Badge",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/badge(_:)",
            "View/badgeProminence(_:)",
            "BadgeProminence"
        ],
        blurb: "Generates a badge from an integer count or text label. Use badgeProminence to render the badge with .standard, .increased, or .decreased visual weight.",
        signature: "func badge(_ count: Int) -> some View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/lists/badge(_:).md",
        page: { AnyView(BadgeGalleryPage()) }
    )
}

#Preview {
    BadgeGalleryPage()
        .frame(width: 900, height: 700)
}
