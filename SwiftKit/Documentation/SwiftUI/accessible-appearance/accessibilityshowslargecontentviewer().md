---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityshowslargecontentviewer()
framework: SwiftUI
category: Accessible appearance
title: accessibilityShowsLargeContentViewer()
kind: method
captured: 2026-05-02
---

# accessibilityShowsLargeContentViewer()

Adds a default large content view to be shown by the large content viewer.

## Declaration

```swift
nonisolated func accessibilityShowsLargeContentViewer() -> some View

```

### Discussion

Rely on the large content viewer only in situations where items must remain small due to unavoidable design constraints. For example, buttons in a tab bar remain small to leave more room for the main app content.

The following example shows how to add a custom large content view:

```swift
var body: some View {
    Button("New Message", action: newMessage)
        .accessibilityShowsLargeContentViewer()
}
```

Don’t use the large content viewer as a replacement for proper Dynamic Type support. For example, Dynamic Type allows items in a list to grow or shrink vertically to accommodate the user’s preferred font size. Rely on the large content viewer only in situations where items must remain small due to unavoidable design constraints.

For example, views that have their Dynamic Type size constrained with `View/dynamicTypeSize(_:)` may require a large content view.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `accessibilityShowsLargeContentViewer(_:)`
- `accessibilityLargeContentViewerEnabled`
