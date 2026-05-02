---
url: https://developer.apple.com/documentation/swiftui/view/navigationsubtitle(_:)
framework: SwiftUI
category: Navigation
title: navigationSubtitle(_:)
kind: method
captured: 2026-05-02
---

# navigationSubtitle(_:)

Configures the view’s subtitle for purposes of navigation.

## Declaration

```swift
nonisolated func navigationSubtitle(_ subtitle: Text) -> some View

```

### Discussion

A view’s navigation subtitle is used to provide additional contextual information alongside the navigation title. On macOS, the primary destination’s subtitle is displayed with the navigation title in the titlebar. On iOS and iPadOS, the subtitle is displayed with the navigation title in the navigation bar.

## Parameters

- **subtitle**: The subtitle to display.





## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 14.0
- macOS 11.0



## See Also

- `navigationTitle(_:)`
- `navigationDocument(_:)`
- `navigationDocument(_:preview:)`
