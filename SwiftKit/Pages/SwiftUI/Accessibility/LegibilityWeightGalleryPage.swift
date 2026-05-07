import SwiftUI

struct LegibilityWeightGalleryPage: View {
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

extension LegibilityWeightGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.legibilityWeight",
        title: "LegibilityWeight",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "LegibilityWeight",
            "swiftui.accessible-appearance.legibilityweight"
        ],
        blurb: "The Accessibility Bold Text user setting. Read via the legibilityWeight environment value to mirror the system bold setting in custom font weight choices.",
        signature: "enum LegibilityWeight",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/accessible-appearance/legibilityweight.md",
        page: { AnyView(LegibilityWeightGalleryPage()) }
    )
}

#Preview {
    LegibilityWeightGalleryPage()
        .frame(width: 900, height: 700)
}
