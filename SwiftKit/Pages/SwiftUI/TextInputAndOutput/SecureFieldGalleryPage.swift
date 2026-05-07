import SwiftUI

struct SecureFieldGalleryPage: View {
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

extension SecureFieldGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.secureField",
        title: "SecureField",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.securefield"],
        blurb: "A control into which people securely enter private text.",
        signature: "struct SecureField<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/securefield.md",
        page: { AnyView(SecureFieldGalleryPage()) }
    )
}

#Preview {
    SecureFieldGalleryPage()
        .frame(width: 900, height: 700)
}
