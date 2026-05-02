---
url: https://developer.apple.com/documentation/swiftui/view/activitybackgroundtint(_:)
framework: SwiftUI
category: Technology-specific views
title: activityBackgroundTint(_:)
kind: method
captured: 2026-05-02
---

# activityBackgroundTint(_:)

Sets the tint color for the background of a Live Activity that appears on the Lock Screen.

## Declaration

```swift
@MainActor @preconcurrency func activityBackgroundTint(_ color: Color?) -> some View

```

### Discussion

When you set a custom background tint color, consider setting a custom text color for the auxiliary button people use to end a Live Activity on the Lock Screen. To set a custom text color, use the `View/activitySystemActionForegroundColor(_:)` view modifier.

## Parameters

- **color**: The background tint color to apply. To use the system’s default background material, pass `nil`.





## Availability

- iOS 16.0
- iPadOS 16.0



## See Also

- `activitySystemActionForegroundColor(_:)`
- `isActivityFullscreen`
- `activityFamily`
