import SwiftUI

struct TimelineViewGalleryPage: View {
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

extension TimelineViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.timelineView",
        title: "TimelineView",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "TimelineView",
            "TimelineSchedule",
            "TimelineViewDefaultContext"
        ],
        blurb: "A view that updates according to a schedule that you provide. Pair with built-in or custom TimelineSchedule values to drive periodic repaints — clocks, frame-driven previews, animation runners.",
        signature: "struct TimelineView<Schedule, Content> where Schedule : TimelineSchedule",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/animations/timelineview.md",
        page: { AnyView(TimelineViewGalleryPage()) }
    )
}

#Preview {
    TimelineViewGalleryPage()
        .frame(width: 900, height: 700)
}
