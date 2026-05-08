import SwiftUI

/// Gallery page scaffold for List. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ListGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "List", api: nil) { Color.clear }
            VariantTile(name: "ForEach", api: nil) { Color.clear }
            VariantTile(name: "OutlineGroup", api: nil) { Color.clear }
            VariantTile(name: "DisclosureGroup", api: nil) { Color.clear }
            VariantTile(name: "EditActions", api: nil) { Color.clear }
            VariantTile(name: "EditableCollectionContent", api: nil) { Color.clear }
            VariantTile(name: "IndexedIdentifierCollection", api: nil) { Color.clear }
            VariantTile(name: "RefreshAction", api: nil) { Color.clear }
            VariantTile(name: "ListItemTint", api: nil) { Color.clear }
            VariantTile(name: "ListSectionSpacing", api: nil) { Color.clear }
            VariantTile(name: "BackgroundProminence", api: nil) { Color.clear }
            VariantTile(name: "BadgeProminence", api: nil) { Color.clear }
            VariantTile(name: "AlternatingRowBackgroundBehavior", api: nil) { Color.clear }
            VariantTile(name: "EditMode", api: nil) { Color.clear }
            VariantTile(name: "Prominence", api: nil) { Color.clear }
            VariantTile(name: "swipeActions(edge:allowsFullSwipe:content:)", api: nil) { Color.clear }
            VariantTile(name: "listRowBackground(_:)", api: nil) { Color.clear }
            VariantTile(name: "listRowInsets(_:)", api: nil) { Color.clear }
            VariantTile(name: "listRowSeparator(_:edges:)", api: nil) { Color.clear }
            VariantTile(name: "listRowSeparatorTint(_:edges:)", api: nil) { Color.clear }
            VariantTile(name: "listRowSpacing(_:)", api: nil) { Color.clear }
            VariantTile(name: "listRowHoverEffect(_:)", api: nil) { Color.clear }
            VariantTile(name: "listSectionSeparator(_:edges:)", api: nil) { Color.clear }
            VariantTile(name: "listSectionSeparatorTint(_:edges:)", api: nil) { Color.clear }
            VariantTile(name: "listSectionSpacing(_:)", api: nil) { Color.clear }
            VariantTile(name: "listSectionMargins(_:_:)", api: nil) { Color.clear }
            VariantTile(name: "listSectionIndexVisibility(_:)", api: nil) { Color.clear }
            VariantTile(name: "listItemTint(_:)", api: nil) { Color.clear }
            VariantTile(name: "headerProminence(_:)", api: nil) { Color.clear }
            VariantTile(name: "badge(_:)", api: nil) { Color.clear }
            VariantTile(name: "badgeProminence(_:)", api: nil) { Color.clear }
            VariantTile(name: "alternatingRowBackgrounds(_:)", api: nil) { Color.clear }
            VariantTile(name: "refreshable(action:)", api: nil) { Color.clear }
            VariantTile(name: "selectionDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "deleteDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "moveDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "sectionIndexLabel(_:)", api: nil) { Color.clear }
        }
    }
}

extension ListGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.containers.list",
        title: "List",
        folder: "Containers",
        framework: .swiftUI,
        absorbedSymbols: ["ForEach", "List", "OutlineGroup"],
        blurb: "List — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ListGalleryPage()) }
    )
}
