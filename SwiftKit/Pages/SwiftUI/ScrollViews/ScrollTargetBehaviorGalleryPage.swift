import SwiftUI

struct ScrollTargetBehaviorGalleryPage: View {
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

extension ScrollTargetBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollTargetBehavior",
        title: "ScrollTargetBehavior",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollTargetBehavior",
            "View/scrollTargetBehavior(_:)",
            "View/scrollTargetLayout(isEnabled:)",
            "ScrollTarget",
            "PagingScrollTargetBehavior",
            "ViewAlignedScrollTargetBehavior",
            "AnyScrollTargetBehavior",
            "ScrollTargetBehaviorContext",
            "ScrollTargetBehaviorProperties",
            "ScrollTargetBehaviorPropertiesContext",
            "ScrollContentOffsetAdjustmentBehavior"
        ],
        blurb: "Customizes where scroll gestures end. Define your own behavior or use built-ins (Paging, ViewAligned, Any) to align scroll targets to container or view geometry, paired with scrollTargetLayout to mark the repeating content.",
        signature: "protocol ScrollTargetBehavior",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrolltargetbehavior.md",
        page: { AnyView(ScrollTargetBehaviorGalleryPage()) }
    )
}

#Preview {
    ScrollTargetBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
