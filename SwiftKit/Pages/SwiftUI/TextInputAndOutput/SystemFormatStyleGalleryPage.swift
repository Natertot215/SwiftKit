import SwiftUI

struct SystemFormatStyleGalleryPage: View {
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

extension SystemFormatStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.systemFormatStyle",
        title: "SystemFormatStyle",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.systemformatstyle",
            "swiftui.text-input-and-output.timedatasource"
        ],
        blurb: "A namespace for format styles that implement designs used across Apple's platforms, plus the TimeDataSource that supplies live, automatically updating values to Text.",
        signature: "enum SystemFormatStyle · struct TimeDataSource<Value>",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/systemformatstyle.md",
        page: { AnyView(SystemFormatStyleGalleryPage()) }
    )
}

#Preview {
    SystemFormatStyleGalleryPage()
        .frame(width: 900, height: 700)
}
