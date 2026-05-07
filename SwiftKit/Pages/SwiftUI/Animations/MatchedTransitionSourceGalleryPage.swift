import SwiftUI

struct MatchedTransitionSourceGalleryPage: View {
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

extension MatchedTransitionSourceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.matchedTransitionSource",
        title: "MatchedTransitionSource",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/matchedTransitionSource(id:in:)",
            "View/matchedTransitionSource(id:in:configuration:)",
            "MatchedTransitionSourceConfiguration",
            "EmptyMatchedTransitionSourceConfiguration"
        ],
        blurb: "Identifies a source view for a navigation transition zoom effect. Pair with a destination view that adopts a matching navigationTransition(.zoom(sourceID:in:)) so SwiftUI animates a hero-style transition.",
        signature: "func matchedTransitionSource(id: some Hashable, in: Namespace.ID) -> some View",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/animations/matchedtransitionsource(id:in:).md",
        page: { AnyView(MatchedTransitionSourceGalleryPage()) }
    )
}

#Preview {
    MatchedTransitionSourceGalleryPage()
        .frame(width: 900, height: 700)
}
