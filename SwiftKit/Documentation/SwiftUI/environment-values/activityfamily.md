---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/activityfamily
framework: SwiftUI
category: Environment values
title: activityFamily
kind: property
captured: 2026-05-02
---

# activityFamily

The size family of the current Live Activity.

## Declaration

```swift
var activityFamily: ActivityFamily { get set }
```

### Discussion

A Live Activity you initiate on one device can also appear on a remote device that renders the Live Activity in a different family size. As a result, it renders for a specific family, depending on both the device and the location in which it appears. For example, when rendering on the iOS or iPadOS Lock Screen, the current family is doc://com.apple.comdumentation/documentation/WidgetKit/ActivityFamily/medium.

Use `WidgetConfiguration/supplementalActivityFamilies(_:)` to opt in and allow your Live Activity to render with additional families.







## Availability

- iOS 18.0
- iPadOS 18.0



## See Also

- `activitySystemActionForegroundColor(_:)`
- `activityBackgroundTint(_:)`
- `isActivityFullscreen`
