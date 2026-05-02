---
url: https://developer.apple.com/documentation/swiftui/view/quicklookpreview(_:)
framework: SwiftUI
category: Technology-specific views
title: quickLookPreview(_:)
kind: method
captured: 2026-05-02
---

# quickLookPreview(_:)

Presents a Quick Look preview of the contents of a single URL.

## Declaration

```swift
nonisolated func quickLookPreview(_ item: Binding<URL?>) -> some View

```

### Return Value

A view that presents the preview of the contents of the URL.

### Discussion

The Quick Look preview appears when you set the binding to a non-`nil` item. When you set the item back to `nil`, Quick Look dismisses the preview.

Upon dismissal by the user, Quick Look automatically sets the item binding to `nil`. Quick Look displays the preview when a non-`nil` item is set. Set `item` to `nil` to dismiss the preview.

## Parameters

- **item**: A `Binding` to a URL that should be previewed.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0



## See Also

- `quickLookPreview(_:in:)`
