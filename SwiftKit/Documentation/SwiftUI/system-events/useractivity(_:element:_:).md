---
url: https://developer.apple.com/documentation/swiftui/view/useractivity(_:element:_:)
framework: SwiftUI
category: System events
title: userActivity(_:element:_:)
kind: method
captured: 2026-05-02
---

# userActivity(_:element:_:)

Advertises a user activity type.

## Declaration

```swift
nonisolated func userActivity<P>(_ activityType: String, element: P?, _ update: @escaping (P, NSUserActivity) -> ()) -> some View

```

### Discussion

The scope of the activity applies only to the scene or window the view is in.

## Parameters

- **activityType**: The type of activity to advertise.
- **element**: If the element is `nil`, the handler will not be associated with the activity (and if there are no handlers, no activity is advertised). The method passes the non-`nil` element to the handler as a convenience so the handlers don’t all need to implement an early exit with `guard element = element else { return }`.
- **update**: A function that modifies the passed-in activity for advertisement.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `Restoring your app’s state with SwiftUI`
- `userActivity(_:isActive:_:)`
- `onContinueUserActivity(_:perform:)`
