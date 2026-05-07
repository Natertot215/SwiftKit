import SwiftUI

struct MultiDatePickerGalleryPage: View {
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

extension MultiDatePickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.multiDatePicker",
        title: "MultiDatePicker",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["MultiDatePicker"],
        blurb: "A control for picking multiple dates at once, binding to a Set of DateComponents.",
        signature: "struct MultiDatePicker<Label> where Label : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/multidatepicker.md",
        page: { AnyView(MultiDatePickerGalleryPage()) }
    )
}

#Preview {
    MultiDatePickerGalleryPage()
        .frame(width: 900, height: 700)
}
