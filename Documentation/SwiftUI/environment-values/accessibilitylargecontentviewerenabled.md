---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilitylargecontentviewerenabled
framework: SwiftUI
category: Environment values
title: accessibilityLargeContentViewerEnabled
kind: property
captured: 2026-05-02
---

# accessibilityLargeContentViewerEnabled

Whether the Large Content Viewer is enabled.

## Declaration

```swift
var accessibilityLargeContentViewerEnabled: Bool { get }
```

### Discussion

The system can automatically provide a large content view with `View/accessibilityShowsLargeContentViewer()` or you can provide your own with `View/accessibilityShowsLargeContentViewer(_:)`.

While it is not necessary to check this value before adding a large content view, it may be helpful if you need to adjust the behavior of a gesture. For example, a button with a long press handler might increase its long press duration so the user can read the text in the large content viewer first.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `accessibilityShowsLargeContentViewer()`
- `accessibilityShowsLargeContentViewer(_:)`
