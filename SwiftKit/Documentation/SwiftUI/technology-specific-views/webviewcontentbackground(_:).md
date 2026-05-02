---
url: https://developer.apple.com/documentation/swiftui/view/webviewcontentbackground(_:)
framework: SwiftUI
category: Technology-specific views
title: webViewContentBackground(_:)
kind: method
captured: 2026-05-02
---

# webViewContentBackground(_:)

Specifies the visibility of the webpage’s natural background color within this view.

## Declaration

```swift
nonisolated func webViewContentBackground(_ visibility: Visibility) -> some View

```

### Return Value

A view with the specified content background visibility.

### Discussion

By default, WebViews are opaque, and use the page’s natural background color as their background color. Use this modifier if you would like to not use this behavior and instead provide a custom background using SwiftUI.

## Parameters

- **visibility**: The visibility to use for the background.





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
- `webViewContextMenu(menu:)`
- `webViewElementFullscreenBehavior(_:)`
- `webViewLinkPreviews(_:)`
- `webViewMagnificationGestures(_:)`
- `webViewOnScrollGeometryChange(for:of:action:)`
- `webViewScrollInputBehavior(_:for:)`
- `webViewScrollPosition(_:)`
- `webViewTextSelection(_:)`
