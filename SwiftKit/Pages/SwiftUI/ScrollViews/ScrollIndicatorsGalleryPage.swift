import SwiftUI

struct ScrollIndicatorsGalleryPage: View {
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

extension ScrollIndicatorsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollIndicators",
        title: "ScrollIndicators",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/scrollIndicators(_:axes:)",
            "ScrollIndicatorVisibility",
            "View/scrollIndicatorsFlash(onAppear:)",
            "View/scrollIndicatorsFlash(trigger:)"
        ],
        blurb: "Controls the appearance of scroll indicators. Set per-axis visibility with scrollIndicators using ScrollIndicatorVisibility, and optionally flash the indicators on appearance or in response to a trigger value to draw attention to scrollable content.",
        signature: "func scrollIndicators(_ visibility: ScrollIndicatorVisibility, axes: Axis.Set = [.vertical, .horizontal]) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollindicators(_:axes:).md",
        page: { AnyView(ScrollIndicatorsGalleryPage()) }
    )
}

#Preview {
    ScrollIndicatorsGalleryPage()
        .frame(width: 900, height: 700)
}
