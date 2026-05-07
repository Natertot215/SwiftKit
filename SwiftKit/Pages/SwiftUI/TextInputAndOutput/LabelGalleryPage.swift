import SwiftUI

struct LabelGalleryPage: View {
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

extension LabelGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.label",
        title: "Label",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.label", "Label"],
        blurb: "A standard label for user interface items, consisting of an icon with a title.",
        signature: "struct Label<Title, Icon> where Title : View, Icon : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/label.md",
        page: { AnyView(LabelGalleryPage()) }
    )
}

#Preview {
    LabelGalleryPage()
        .frame(width: 900, height: 700)
}
