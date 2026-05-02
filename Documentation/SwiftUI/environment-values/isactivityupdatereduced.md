---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/isactivityupdatereduced
framework: SwiftUI
category: Environment values
title: isActivityUpdateReduced
kind: property
captured: 2026-05-02
---

# isActivityUpdateReduced

A Boolean value that indicates whether the Live Activity update synchronization rate is reduced.

## Declaration

```swift
var isActivityUpdateReduced: Bool { get set }
```

### Discussion

When rendering an activity on a remote device such as Apple Watch, content updates may sometimes be limited to only alerting updates, depending on system conditions. When a Live Activity is visible and the system synchronizes only alerting updates with a remote device, the value of `isActivityUpdateReduced` is `true`.

For example, `isActivityUpdateReduced` may be `true` for Live Activities on an Apple Watch that’s out of range of the paired iPhone.







## Availability

- iOS 18.0
- iPadOS 18.0
