import SwiftUI

struct TableGalleryPage: View {
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

extension TableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.tables.tables",
        title: "Tables",
        folder: "Tables",
        framework: .swiftUI,
        absorbedSymbols: [
            "Table",
            "TableColumn",
            "TableColumnContent",
            "TableColumnCustomization",
            "TableRow",
            "TableRowContent",
            "DisclosureTableRow",
            "swiftui.tables.building-a-great-mac-app-with-swiftui"
        ],
        blurb: "A container that presents rows of data arranged in one or more columns, with optional selection, sorting, and column customization. The Tables family covers Table itself plus the column/row builder protocols and customization data structure.",
        signature: "Table \u{00b7} TableColumn \u{00b7} TableRow \u{00b7} TableColumnContent \u{00b7} TableRowContent \u{00b7} TableColumnCustomization \u{00b7} DisclosureTableRow",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/tables/table.md",
        page: { AnyView(TableGalleryPage()) }
    )
}

#Preview {
    TableGalleryPage()
        .frame(width: 900, height: 700)
}
