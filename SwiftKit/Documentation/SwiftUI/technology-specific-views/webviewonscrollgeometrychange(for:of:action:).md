---
url: https://developer.apple.com/documentation/swiftui/view/webviewonscrollgeometrychange(for:of:action:)
framework: SwiftUI
category: Technology-specific views
title: webViewOnScrollGeometryChange(for:of:action:)
kind: method
captured: 2026-05-02
---

# webViewOnScrollGeometryChange(for:of:action:)

Adds an action to be performed when a value, created from a scroll geometry, changes.

## Declaration

```swift
nonisolated func webViewOnScrollGeometryChange<T>(for type: T.Type, of transform: @escaping (ScrollGeometry) -> T, action: @escaping (T, T) -> Void) -> some View where T : Hashable

```

### Return Value

A view that invokes the action when the relevant part of a web view’s scroll geometry changes.

### Discussion

> **NOTE:** The content size of web content may exceed the current size of the view’s frame, however it will never be smaller than it.

## Parameters

- **type**: The type of value transformed from a `ScrollGeometry`.
- **transform**: A closure that transforms a `ScrollGeometry` to your type.
- **action**: A closure to run when the transformed data changes.





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
- `webViewScrollInputBehavior(_:for:)`
- `webViewScrollPosition(_:)`
- `webViewTextSelection(_:)`
