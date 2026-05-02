---
url: https://developer.apple.com/documentation/swiftui/scene/environment(_:)
framework: SwiftUI
category: Environment values
title: environment(_:)
kind: method
captured: 2026-05-02
---

# environment(_:)

Places an observable object in the scene’s environment.

## Declaration

```swift
nonisolated func environment<T>(_ object: T?) -> some Scene where T : AnyObject, T : Observable

```

### Return Value

A scene that has the specified object in its environment.

### Discussion

Use this modifier to place an object that you declare with the `Observable()` macro into a scene’s environment. For example, you can add an instance of a custom observable `Profile` class to the environment of a `WindowGroup` scene:

```swift
@Observable class Profile { ... }

@main
struct MyApp: App {
    var body: some View {
        WindowGroup {
            ContentView()
        }
        .environment(Profile.currentProfile)
    }
}
```

You then read the object inside `ContentView` or one of its descendants using the `Environment` property wrapper:

```swift
struct ContentView: View {
    @Environment(Profile.self) private var currentProfile: Profile

    var body: some View { ... }
}
```

This modifier affects the given scene, as well as the scene’s descendant views. It has no effect outside the view hierarchy on which you call it. The environment of a given view hierarchy holds only one observable object of a given type.

> **NOTE:** This modifier takes an object that conforms to the `Observable` protocol. To add environment objects that conform to the `ObservableObject` protocol, use `Scene/environmentObject(_:)` instead.

## Parameters

- **object**: The object to set for this object’s type in the environment, or `nil` to clear an object of this type from the environment.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `environment(_:_:)`
- `transformEnvironment(_:transform:)`
