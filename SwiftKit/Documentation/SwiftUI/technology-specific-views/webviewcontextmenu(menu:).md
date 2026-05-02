---
url: https://developer.apple.com/documentation/swiftui/view/webviewcontextmenu(menu:)
framework: SwiftUI
category: Technology-specific views
title: webViewContextMenu(menu:)
kind: method
captured: 2026-05-02
---

# webViewContextMenu(menu:)

Adds an item-based context menu to a WebView, replacing the default set of context menu items.

## Declaration

```swift
nonisolated func webViewContextMenu(@ViewBuilder menu: @escaping @MainActor @Sendable (WebView.ActivatedElementInfo) -> some View) -> some View

```

### Return Value

A view that can display an item-based context menu.

## Parameters

- **menu**: A closure that produces the menu. The single parameter to the closure describes the type of webpage element that was acted upon.





## Availability

- macOS 26.0



## See Also

- `WebView`
- `WebPage`
- `webViewBackForwardNavigationGestures(_:)`
- `webViewContentBackground(_:)`
- `webViewElementFullscreenBehavior(_:)`
- `webViewLinkPreviews(_:)`
- `webViewMagnificationGestures(_:)`
- `webViewOnScrollGeometryChange(for:of:action:)`
- `webViewScrollInputBehavior(_:for:)`
- `webViewScrollPosition(_:)`
- `webViewTextSelection(_:)`
