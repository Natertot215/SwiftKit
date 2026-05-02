---
url: https://developer.apple.com/documentation/swiftui/view/webviewscrollinputbehavior(_:for:)
framework: SwiftUI
category: Technology-specific views
title: webViewScrollInputBehavior(_:for:)
kind: method
captured: 2026-05-02
---

# webViewScrollInputBehavior(_:for:)

Enables or disables scrolling in web views when using particular inputs.

## Declaration

```swift
nonisolated func webViewScrollInputBehavior(_ behavior: ScrollInputBehavior, for input: ScrollInputKind) -> some View

```

### Return Value

A view with the configured scroll input behavior for web views.

## Parameters

- **behavior**: Whether scrolling should be enabled or disabled for this input.
- **input**: The input for which to enable or disable scrolling.





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
- `webViewScrollPosition(_:)`
- `webViewTextSelection(_:)`
