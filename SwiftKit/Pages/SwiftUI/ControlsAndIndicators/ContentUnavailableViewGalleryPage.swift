import SwiftUI

struct ContentUnavailableViewGalleryPage: View {
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

extension ContentUnavailableViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.contentUnavailableView",
        title: "ContentUnavailableView",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["ContentUnavailableView"],
        blurb: "An interface, consisting of a label and additional content, displayed when an app's content is unavailable — empty searches, network errors, or empty lists.",
        signature: "struct ContentUnavailableView<Label, Description, Actions> where Label : View, Description : View, Actions : View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/contentunavailableview.md",
        page: { AnyView(ContentUnavailableViewGalleryPage()) }
    )
}

#Preview {
    ContentUnavailableViewGalleryPage()
        .frame(width: 900, height: 700)
}
