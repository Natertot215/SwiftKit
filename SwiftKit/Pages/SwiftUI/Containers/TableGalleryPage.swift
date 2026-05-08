import SwiftUI

/// Gallery page scaffold for Table. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct TableGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Table", api: nil) { Color.clear }
            VariantTile(name: "TableColumn", api: nil) { Color.clear }
            VariantTile(name: "TableRow", api: nil) { Color.clear }
            VariantTile(name: "DisclosureTableRow", api: nil) { Color.clear }
            VariantTile(name: "TableColumnContent", api: nil) { Color.clear }
            VariantTile(name: "TableRowContent", api: nil) { Color.clear }
            VariantTile(name: "DynamicTableRowContent", api: nil) { Color.clear }
            VariantTile(name: "TableColumnBuilder", api: nil) { Color.clear }
            VariantTile(name: "TableRowBuilder", api: nil) { Color.clear }
            VariantTile(name: "TableColumnCustomization", api: nil) { Color.clear }
            VariantTile(name: "TableColumnCustomizationBehavior", api: nil) { Color.clear }
            VariantTile(name: "TableColumnAlignment", api: nil) { Color.clear }
            VariantTile(name: "TableForEachContent", api: nil) { Color.clear }
            VariantTile(name: "TableColumnForEach", api: nil) { Color.clear }
            VariantTile(name: "TableHeaderRowContent", api: nil) { Color.clear }
            VariantTile(name: "TableOutlineGroupContent", api: nil) { Color.clear }
            VariantTile(name: "TupleTableRowContent", api: nil) { Color.clear }
            VariantTile(name: "EmptyTableRowContent", api: nil) { Color.clear }
            VariantTile(name: "tableColumnHeaders(_:)", api: nil) { Color.clear }
            VariantTile(name: "tableStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "TableStyle", api: nil) { Color.clear }
            VariantTile(name: "TableStyleConfiguration", api: nil) { Color.clear }
        }
    }
}

extension TableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.containers.table",
        title: "Table",
        folder: "Containers",
        framework: .swiftUI,
        absorbedSymbols: ["Table", "TableColumn", "TableRow"],
        blurb: "Table — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(TableGalleryPage()) }
    )
}
