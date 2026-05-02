---
url: https://developer.apple.com/documentation/swiftui/view/navigationtitle(_:)
framework: SwiftUI
category: Preferences
title: navigationTitle(_:)
kind: method
captured: 2026-05-02
---

# navigationTitle(_:)

Configures the view’s title for purposes of navigation, using a string binding.

## Declaration

```swift
nonisolated func navigationTitle(_ title: Binding<String>) -> some View

```

### Discussion

In iOS, iPadOS, and macOS, this allows editing the navigation title when the title is displayed in the toolbar.

Refer to the `Configure-Your-Apps-Navigation-Titles` article for more information on navigation title modifiers.

## Parameters

- **title**: The text of the title.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `navigationSubtitle(_:)`
- `navigationDocument(_:)`
- `navigationDocument(_:preview:)`
