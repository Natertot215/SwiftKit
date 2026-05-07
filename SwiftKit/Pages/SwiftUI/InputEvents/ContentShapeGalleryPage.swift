import SwiftUI

struct ContentShapeGalleryPage: View {
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

extension ContentShapeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.contentShape",
        title: "ContentShape",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/contentShape(_:eoFill:)",
            "View/contentShape(_:_:eoFill:)",
            "ContentShapeKinds"
        ],
        blurb: "Defines the hit-testing region of a view independently from its visual frame. The kind parameter scopes the shape per interaction (interaction, dragPreview, contextMenuPreview, focusEffect, hoverEffect, accessibility).",
        signature: "func contentShape<S>(_ shape: S, eoFill: Bool = false) -> some View where S : Shape",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/input-events/contentshape(_:eofill:).md",
        page: { AnyView(ContentShapeGalleryPage()) }
    )
}

#Preview {
    ContentShapeGalleryPage()
        .frame(width: 900, height: 700)
}
