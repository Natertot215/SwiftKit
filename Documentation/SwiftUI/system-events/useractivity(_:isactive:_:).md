---
url: https://developer.apple.com/documentation/swiftui/view/useractivity(_:isactive:_:)
framework: SwiftUI
category: System events
title: userActivity(_:isActive:_:)
kind: method
captured: 2026-05-02
---

# userActivity(_:isActive:_:)

Advertises a user activity type.

## Declaration

```swift
nonisolated func userActivity(_ activityType: String, isActive: Bool = true, _ update: @escaping (NSUserActivity) -> ()) -> some View

```

### Discussion

You can use `userActivity(_:isActive:_:)` to start, stop, or modify the advertisement of a specific type of user activity.

The scope of the activity applies only to the scene or window the view is in.

## Parameters

- **activityType**: The type of activity to advertise.
- **isActive**: When `false`, avoids advertising the activity. Defaults to `true`.
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
- `userActivity(_:element:_:)`
- `onContinueUserActivity(_:perform:)`
