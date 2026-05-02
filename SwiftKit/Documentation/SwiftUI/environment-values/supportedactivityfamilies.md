---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/supportedactivityfamilies
framework: SwiftUI
category: Environment values
title: supportedActivityFamilies
kind: property
captured: 2026-05-02
---

# supportedActivityFamilies

An environment value that that indicates potential rendered family for a Live Activity.

## Declaration

```swift
var supportedActivityFamilies: Set<ActivityFamily> { get set }
```

### Discussion

To detect the currently rendered activity family size, use the `EnvironmentValues/activityFamily` environment variable. The `supportedActivityFamilies` environment value might only be useful if your make you make your Live Activity views available in a Swift package.







## Availability

- iOS 18.0
- iPadOS 18.0
