---
url: https://developer.apple.com/documentation/swiftui/view/navigationdocument(_:)
framework: SwiftUI
category: Navigation
title: navigationDocument(_:)
kind: method
captured: 2026-05-02
---

# navigationDocument(_:)

Configures the view’s document for purposes of navigation.

## Declaration

```swift
nonisolated func navigationDocument(_ url: URL) -> some View

```

### Discussion

In iOS, iPadOS, this populates the title menu with a header previewing the document. In macOS, this populates a proxy icon.

Refer to the `Configure-Your-Apps-Navigation-Titles` article for more information on navigation document modifiers.

## Parameters

- **url**: The URL content associated to the navigation title.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `navigationTitle(_:)`
- `navigationSubtitle(_:)`
- `navigationDocument(_:preview:)`
