import SwiftUI

struct ListGalleryPage: View {
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

extension ListGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.list",
        title: "List",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "AlternatingRowBackgroundBehavior",
            "BackgroundProminence",
            "Displaying data in lists",
            "List",
            "ListItemTint",
            "ListSectionSpacing",
            "Prominence",
            "View/alternatingRowBackgrounds(_:)",
            "View/headerProminence(_:)",
            "View/listItemTint(_:)",
            "View/listRowBackground(_:)",
            "View/listRowHoverEffect(_:)",
            "View/listRowHoverEffectDisabled(_:)",
            "View/listRowInsets(_:)",
            "View/listRowSeparator(_:edges:)",
            "View/listRowSeparatorTint(_:edges:)",
            "View/listRowSpacing(_:)",
            "View/listSectionIndexVisibility(_:)",
            "View/listSectionMargins(_:_:)",
            "View/listSectionSeparator(_:edges:)",
            "View/listSectionSeparatorTint(_:edges:)",
            "View/listSectionSpacing(_:)",
            "View/sectionIndexLabel(_:)"
        ],
        blurb: "A container that presents rows of data arranged in a single column, optionally providing the ability to select one or more members. Absorbs the full set of List-only modifiers — row insets, spacing, backgrounds, separators, hover effects, item tint, header prominence, alternating row backgrounds, and section index/margin presentation.",
        signature: "struct List<SelectionValue, Content> where SelectionValue : Hashable, Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/lists/list.md",
        page: { AnyView(ListGalleryPage()) }
    )
}

#Preview {
    ListGalleryPage()
        .frame(width: 900, height: 700)
}
