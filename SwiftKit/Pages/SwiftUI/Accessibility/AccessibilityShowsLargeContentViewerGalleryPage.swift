import SwiftUI

struct AccessibilityShowsLargeContentViewerGalleryPage: View {
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

extension AccessibilityShowsLargeContentViewerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityShowsLargeContentViewer",
        title: "AccessibilityShowsLargeContentViewer",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityShowsLargeContentViewer()",
            "View/accessibilityShowsLargeContentViewer(_:)",
            "swiftui.accessible-appearance.accessibilityshowslargecontentviewer()",
            "swiftui.accessible-appearance.accessibilityshowslargecontentviewer(_:)"
        ],
        blurb: "Adds a default or custom large content view shown by the Large Content Viewer when users long-press fixed-size controls. Required for toolbar items and tab icons that can't scale with Dynamic Type.",
        signature: "func accessibilityShowsLargeContentViewer<V>(@ViewBuilder _ largeContentView: () -> V) -> some View where V : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-appearance/accessibilityshowslargecontentviewer().md",
        page: { AnyView(AccessibilityShowsLargeContentViewerGalleryPage()) }
    )
}

#Preview {
    AccessibilityShowsLargeContentViewerGalleryPage()
        .frame(width: 900, height: 700)
}
