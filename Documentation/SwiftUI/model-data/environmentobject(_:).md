---
url: https://developer.apple.com/documentation/swiftui/scene/environmentobject(_:)
framework: SwiftUI
category: Model data
title: environmentObject(_:)
kind: method
captured: 2026-05-02
---

# environmentObject(_:)

Supplies an `ObservableObject` to a view subhierarchy.

## Declaration

```swift
nonisolated func environmentObject<T>(_ object: T) -> some Scene where T : ObservableObject

```

### Discussion

The object can be read by any child by using `EnvironmentObject`:

```swift
final class Profile: ObservableObject { ... }

@main
struct MyApp: App {
    var body: some View {
        WindowGroup {
            ContentView()
        }
        .environment(ProfileService.currentProfile)
    }
}
```

You then read the object inside `ContentView` or one of its descendants using the `EnvironmentObject` property wrapper:

```swift
struct ContentView: View {
    @EnvironmentObject private var currentAccount: Account

    var body: some View { ... }
}
```

## Parameters

- **object**: The object to store and make available to the scene’s subhierarchy.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `environmentObject(_:)`
- `EnvironmentObject`
