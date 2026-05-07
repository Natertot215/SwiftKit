import SwiftUI

struct ScrollPhaseGalleryPage: View {
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

extension ScrollPhaseGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollPhase",
        title: "ScrollPhase",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollPhase",
            "ScrollPhaseChangeContext",
            "View/onScrollPhaseChange(_:)"
        ],
        blurb: "Describes the state of a scrollable view's scroll gesture across four phases — idle, panning (user-driven), decelerating, and animating (programmatic). Observe transitions with onScrollPhaseChange and use ScrollPhaseChangeContext for additional metadata.",
        signature: "@frozen enum ScrollPhase",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollphase.md",
        page: { AnyView(ScrollPhaseGalleryPage()) }
    )
}

#Preview {
    ScrollPhaseGalleryPage()
        .frame(width: 900, height: 700)
}
