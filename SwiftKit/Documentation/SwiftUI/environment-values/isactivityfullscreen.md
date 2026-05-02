---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/isactivityfullscreen
framework: SwiftUI
category: Environment values
title: isActivityFullscreen
kind: property
captured: 2026-05-02
---

# isActivityFullscreen

A Boolean value that indicates whether the Live Activity appears in a full-screen presentation.

## Declaration

```swift
@backDeployed(before: iOS 17.0)
var isActivityFullscreen: Bool { get }
```

### Discussion

When a Live Activity fills the entire screen, the system extends the background tint color you set with the `View/activityBackgroundTint(_:)` modifier to fill the screen.

Note that this environment variable is always `false` in iOS 16.







## Availability

- iOS 16.1
- iPadOS 16.1



## See Also

- `activitySystemActionForegroundColor(_:)`
- `activityBackgroundTint(_:)`
- `activityFamily`
