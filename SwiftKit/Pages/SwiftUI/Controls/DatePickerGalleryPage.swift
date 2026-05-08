import SwiftUI

/// Gallery page scaffold for DatePicker. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct DatePickerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "DatePicker", api: nil) { Color.clear }
            VariantTile(name: "MultiDatePicker", api: nil) { Color.clear }
            VariantTile(name: "DatePickerStyle", api: nil) { Color.clear }
            VariantTile(name: "DefaultDateProgressLabel", api: nil) { Color.clear }
            VariantTile(name: "datePickerStyle(_:)", api: nil) { Color.clear }
        }
    }
}

extension DatePickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.datePicker",
        title: "DatePicker",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["DatePicker", "DatePickerStyle", "MultiDatePicker"],
        blurb: "DatePicker — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(DatePickerGalleryPage()) }
    )
}
