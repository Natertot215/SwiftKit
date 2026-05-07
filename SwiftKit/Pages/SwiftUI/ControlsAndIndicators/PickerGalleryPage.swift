import SwiftUI

struct PickerGalleryPage: View {
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

extension PickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.picker",
        title: "Picker",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: [
            "Picker",
            "View/defaultWheelPickerItemHeight(_:)"
        ],
        blurb: "A control for selecting from a set of mutually exclusive values. Companion modifier defaultWheelPickerItemHeight tunes wheel-style row height.",
        signature: "struct Picker<Label, SelectionValue, Content> where Label : View, SelectionValue : Hashable, Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/picker.md",
        page: { AnyView(PickerGalleryPage()) }
    )
}

#Preview {
    PickerGalleryPage()
        .frame(width: 900, height: 700)
}
