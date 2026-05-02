---
url: https://developer.apple.com/documentation/swiftui/view/oncontinueuseractivity(_:perform:)
framework: SwiftUI
category: System events
title: onContinueUserActivity(_:perform:)
kind: method
captured: 2026-05-02
---

# onContinueUserActivity(_:perform:)

Registers a handler to invoke in response to a user activity that your app receives.

## Declaration

```swift
nonisolated func onContinueUserActivity(_ activityType: String, perform action: @escaping (NSUserActivity) -> ()) -> some View

```

### Return Value

A view that handles incoming user activities.

### Discussion

Use this view modifier to receive `NSUserActivity` instances in a particular scene within your app. The scene that SwiftUI routes the incoming user activity to depends on the structure of your app, what scenes are active, and other configuration. For more information, see `Scene/handlesExternalEvents(matching:)`.

UI frameworks traditionally pass Universal Links to your app using a user activity. However, SwiftUI passes a Universal Link to your app directly as a URL. To receive a Universal Link, use the `View/onOpenURL(perform:)` modifier instead.

## Parameters

- **activityType**: The type of activity that the `action` closure handles. Be sure that this string matches one of the values that you list in the `Information-Property-List/NSUserActivityTypes` array in your app’s Information Property List.
- **action**: A closure that SwiftUI calls when your app receives a user activity of the specified type. The closure takes the activity as an input parameter.





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
- `userActivity(_:isActive:_:)`
