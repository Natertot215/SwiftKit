import SwiftUI

struct DatePickerGalleryPage: View {
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

extension DatePickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.datePicker",
        title: "DatePicker",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["DatePicker"],
        blurb: "A control for selecting an absolute date, optionally including a time. Bind to a Date instance and configure displayed components.",
        signature: "struct DatePicker<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/datepicker.md",
        page: { AnyView(DatePickerGalleryPage()) }
    )
}

#Preview {
    DatePickerGalleryPage()
        .frame(width: 900, height: 700)
}
