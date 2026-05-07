import SwiftUI

struct TextFieldLinkGalleryPage: View {
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

extension TextFieldLinkGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.textFieldLink",
        title: "TextFieldLink",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["TextFieldLink"],
        blurb: "A control that requests text input from the user when pressed. Surfaces a text-entry interface through a button affordance.",
        signature: "struct TextFieldLink<Label> where Label : View",
        availability: nil,
        docPath: "Documentation/SwiftUI/controls-and-indicators/textfieldlink.md",
        page: { AnyView(TextFieldLinkGalleryPage()) }
    )
}

#Preview {
    TextFieldLinkGalleryPage()
        .frame(width: 900, height: 700)
}
