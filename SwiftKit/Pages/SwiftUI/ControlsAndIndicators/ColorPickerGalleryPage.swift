import SwiftUI

struct ColorPickerGalleryPage: View {
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

extension ColorPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.colorPicker",
        title: "ColorPicker",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["ColorPicker"],
        blurb: "A control used to select a color from the system color picker UI. Supports opacity by default; toggle supportsOpacity to disable.",
        signature: "struct ColorPicker<Label> where Label : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/colorpicker.md",
        page: { AnyView(ColorPickerGalleryPage()) }
    )
}

#Preview {
    ColorPickerGalleryPage()
        .frame(width: 900, height: 700)
}
