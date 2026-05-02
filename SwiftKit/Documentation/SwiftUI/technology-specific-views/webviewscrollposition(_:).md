---
url: https://developer.apple.com/documentation/swiftui/view/webviewscrollposition(_:)
framework: SwiftUI
category: Technology-specific views
title: webViewScrollPosition(_:)
kind: method
captured: 2026-05-02
---

# webViewScrollPosition(_:)

Associates a binding to a scroll position with the web view.

## Declaration

```swift
nonisolated func webViewScrollPosition(_ position: Binding<ScrollPosition>) -> some View

```

### Discussion

> **NOTE:** `WebView` does not support scrolling to a view with an identity. It only supports scrolling to a concrete offset, or to an edge.







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- visionOS 26.0



## See Also

- `WebView`
- `WebPage`
- `webViewBackForwardNavigationGestures(_:)`
- `webViewContentBackground(_:)`
- `webViewContextMenu(menu:)`
- `webViewElementFullscreenBehavior(_:)`
- `webViewLinkPreviews(_:)`
- `webViewMagnificationGestures(_:)`
- `webViewOnScrollGeometryChange(for:of:action:)`
- `webViewScrollInputBehavior(_:for:)`
- `webViewTextSelection(_:)`
