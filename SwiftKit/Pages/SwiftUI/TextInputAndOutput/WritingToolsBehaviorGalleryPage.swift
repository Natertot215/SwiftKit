import SwiftUI

struct WritingToolsBehaviorGalleryPage: View {
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

extension WritingToolsBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.writingToolsBehavior",
        title: "WritingToolsBehavior",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.writingtoolsbehavior",
            "swiftui.text-input-and-output.writingtoolsbehavior(_:)"
        ],
        blurb: "Controls the Writing Tools editing experience for text and text input.",
        signature: "struct WritingToolsBehavior · func writingToolsBehavior(_:)",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/writingtoolsbehavior.md",
        page: { AnyView(WritingToolsBehaviorGalleryPage()) }
    )
}

#Preview {
    WritingToolsBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
