import SwiftUI

struct ScrollTransitionGalleryPage: View {
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

extension ScrollTransitionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollTransition",
        title: "ScrollTransition",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/scrollTransition(_:axis:transition:)"
        ],
        blurb: "Animates a visual effect symmetrically as a view enters or leaves the visible region of a containing scroll view. Drives the transition between the topLeading, identity, and bottomTrailing scroll-transition phases.",
        signature: "func scrollTransition(_ configuration: ScrollTransitionConfiguration = .interactive, axis: Axis? = nil, transition: @escaping @Sendable (EmptyVisualEffect, ScrollTransitionPhase) -> some VisualEffect) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrolltransition(_:axis:transition:).md",
        page: { AnyView(ScrollTransitionGalleryPage()) }
    )
}

#Preview {
    ScrollTransitionGalleryPage()
        .frame(width: 900, height: 700)
}
