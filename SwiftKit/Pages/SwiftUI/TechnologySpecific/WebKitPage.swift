import SwiftUI
import WebKit

// SwiftUI WebKit modifiers reference page.
// Covers: webViewBackForwardNavigationGestures, webViewContentBackground,
//         webViewContextMenu, webViewElementFullscreenBehavior,
//         webViewLinkPreviews, webViewMagnificationGestures,
//         webViewOnScrollGeometryChange, webViewScrollInputBehavior,
//         webViewScrollPosition, webViewTextSelection
// Source: Documentation/SwiftUI/technology-specific-views/

// Minimal WKWebView wrapper for the demo
private struct WebViewDemo: NSViewRepresentable {
    var urlString: String

    func makeNSView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: config)
        if let url = URL(string: urlString) {
            view.load(URLRequest(url: url))
        }
        return view
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {}
}

struct WebKitPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("WebKit SwiftUI Modifiers")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Configure WebView behavior: navigation gestures, scroll, fullscreen, context menus, and more.")
                .font(.callout).foregroundStyle(.secondary)
            Text("WebKit modifiers macOS 26.0+ (most new ones) · earlier modifiers macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "WebView with common modifiers (macOS 26+)") {
            snippet("""
            import WebKit

            WebView(url: URL(string: "https://apple.com")!)
                .webViewBackForwardNavigationGestures(.enabled)
                .webViewMagnificationGestures(.enabled)
                .webViewTextSelection(.enabled)
                .webViewLinkPreviews(.enabled)
                .webViewContentBackground(.clear)
                .frame(height: 300)
            """)
            APICallout(".webViewBackForwardNavigationGestures(.enabled)")
            Text("SwiftUI's WebView (not WKWebView wrapped in NSViewRepresentable) accepts these modifiers directly — macOS 26+.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "webViewBackForwardNavigationGestures(_:)") {
                snippet("""
                WebView(url: url)
                    .webViewBackForwardNavigationGestures(.enabled)
                    // .enabled  — swipe left/right to navigate history (default on Mac)
                    // .disabled — turn off swipe navigation
                """)
            }

            Block(title: "webViewContentBackground(_:)") {
                snippet("""
                WebView(url: url)
                    .webViewContentBackground(.clear)   // transparent background
                    .webViewContentBackground(.white)   // solid white
                    .webViewContentBackground(.regularMaterial)
                """)
                Text("Sets the background behind the web content — useful for blending a web view into a material-backed pane.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "webViewContextMenu(menu:)") {
                snippet("""
                WebView(url: url)
                    .webViewContextMenu { element in
                        // element: WebPage.Element — the right-clicked item
                        if let link = element.link {
                            Button("Open in New Tab") { openTab(link) }
                            Button("Copy Link") { copyURL(link) }
                        }
                    }
                """)
                Text("webViewContextMenu replaces or augments the default context menu for right-clicks in the web view.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "webViewElementFullscreenBehavior(_:)") {
                snippet("""
                WebView(url: url)
                    .webViewElementFullscreenBehavior(.allowed)
                    // .allowed   — web content can enter fullscreen (default)
                    // .blocked   — block fullscreen requests
                    // .automatic — system decides
                """)
            }

            Block(title: "webViewLinkPreviews(_:)") {
                snippet("""
                WebView(url: url)
                    .webViewLinkPreviews(.enabled)   // force touch / peek
                    .webViewLinkPreviews(.disabled)  // disable previews
                """)
            }

            Block(title: "webViewMagnificationGestures(_:)") {
                snippet("""
                WebView(url: url)
                    .webViewMagnificationGestures(.enabled)    // pinch to zoom
                    .webViewMagnificationGestures(.disabled)   // no pinch zoom
                """)
            }

            Block(title: "webViewScrollInputBehavior(_:for:)") {
                snippet("""
                WebView(url: url)
                    .webViewScrollInputBehavior(.tracked, for: .all)
                    .webViewScrollInputBehavior(.none, for: .mouse)
                    // for: .all, .keyboard, .mouse, .scrollWheel, .trackpad
                    // behavior: .tracked (default), .none
                """)
                Text("Selectively disable scroll input from specific devices — e.g. disable mouse wheel but keep trackpad scroll.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "webViewScrollPosition(_:)") {
                snippet("""
                @State var scrollPos = WebPage.ScrollPosition(x: 0, y: 0)

                WebView(url: url)
                    .webViewScrollPosition($scrollPos)

                // Programmatically scroll:
                scrollPos = WebPage.ScrollPosition(x: 0, y: 500)
                """)
                Text("Bind a WebPage.ScrollPosition to drive and observe the web view's scroll position programmatically.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "webViewOnScrollGeometryChange(for:of:action:)") {
                snippet("""
                WebView(url: url)
                    .webViewOnScrollGeometryChange(
                        for: CGFloat.self,
                        of: { $0.contentOffset.y }
                    ) { old, new in
                        showStickyHeader = new > 100
                    }
                """)
                Text("Observe scroll geometry changes in a web view — similar to onScrollGeometryChange for SwiftUI ScrollViews.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "webViewTextSelection(_:)") {
                snippet("""
                WebView(url: url)
                    .webViewTextSelection(.enabled)   // allow text selection
                    .webViewTextSelection(.disabled)  // disable selection
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("safari", "SwiftUI WebView (WebKit framework) is distinct from WKWebView. The .webView* modifiers only apply to SwiftUI's native WebView type, not to a WKWebView wrapped in NSViewRepresentable.")
            noteRow("arrow.left.arrow.right", "For macOS 14 and earlier, embed WKWebView via NSViewRepresentable and configure WKWebViewConfiguration + WKPreferences directly.")
            noteRow("lock.shield", "Restrict fullscreen with .webViewElementFullscreenBehavior(.blocked) for kiosk or embedded web content that shouldn't go fullscreen.")
            noteRow("scroll", "webViewScrollPosition requires a WebPage model object from the WebKit framework — it's tied to the WebView's underlying WebPage, not a generic position.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    WebKitPage().frame(width: 1100, height: 900)
}
