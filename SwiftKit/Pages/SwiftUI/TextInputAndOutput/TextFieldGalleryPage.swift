import SwiftUI

struct TextFieldGalleryPage: View {
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

extension TextFieldGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textField",
        title: "TextField",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.textfield"],
        blurb: "A control that displays an editable text interface.",
        signature: "struct TextField<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textfield.md",
        page: { AnyView(TextFieldGalleryPage()) }
    )
}

#Preview {
    TextFieldGalleryPage()
        .frame(width: 900, height: 700)
}
