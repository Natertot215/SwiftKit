import SwiftUI

struct WebViewGalleryPage: View {
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

extension WebViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.webView",
        title: "WebView",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "WebView",
            "View/webViewBackForwardNavigationGestures(_:)",
            "View/webViewContentBackground(_:)",
            "View/webViewContextMenu(menu:)",
            "View/webViewElementFullscreenBehavior(_:)",
            "View/webViewLinkPreviews(_:)",
            "View/webViewMagnificationGestures(_:)",
            "View/webViewOnScrollGeometryChange(for:of:action:)",
            "View/webViewScrollInputBehavior(_:for:)",
            "View/webViewScrollPosition(_:)",
            "View/webViewTextSelection(_:)"
        ],
        blurb: "Embeds a WebKit web view in SwiftUI. Companion modifiers configure navigation gestures, content background, context menus, fullscreen behavior, link previews, magnification, scroll behavior, and text selection.",
        signature: "struct WebView : View",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/technology-specific-views/webviewscrollposition(_:).md",
        page: { AnyView(WebViewGalleryPage()) }
    )
}

#Preview {
    WebViewGalleryPage()
        .frame(width: 900, height: 700)
}
