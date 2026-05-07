import SwiftUI

struct ContentTransitionGalleryPage: View {
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

extension ContentTransitionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.contentTransition",
        title: "ContentTransition",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "ContentTransition",
            "View/contentTransition(_:)",
            "EnvironmentValues/contentTransition",
            "EnvironmentValues/contentTransitionAddsDrawingGroup"
        ],
        blurb: "A kind of transition that applies to the content within a single view, rather than to the insertion or removal of a view. Drives effects like numericText interpolations on Text content changes.",
        signature: "struct ContentTransition",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/animations/contenttransition.md",
        page: { AnyView(ContentTransitionGalleryPage()) }
    )
}

#Preview {
    ContentTransitionGalleryPage()
        .frame(width: 900, height: 700)
}
