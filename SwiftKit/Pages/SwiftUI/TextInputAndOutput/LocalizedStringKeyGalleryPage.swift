import SwiftUI

struct LocalizedStringKeyGalleryPage: View {
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

extension LocalizedStringKeyGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.localizedStringKey",
        title: "LocalizedStringKey",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.localizedstringkey",
            "swiftui.text-input-and-output.preparing-views-for-localization"
        ],
        blurb: "The key used to look up an entry in a strings file or strings dictionary file. SwiftUI implicitly creates a LocalizedStringKey when you initialize Text, Toggle, or Picker with a string literal.",
        signature: "@frozen struct LocalizedStringKey",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/localizedstringkey.md",
        page: { AnyView(LocalizedStringKeyGalleryPage()) }
    )
}

#Preview {
    LocalizedStringKeyGalleryPage()
        .frame(width: 900, height: 700)
}
