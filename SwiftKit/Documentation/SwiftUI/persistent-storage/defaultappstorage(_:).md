---
url: https://developer.apple.com/documentation/swiftui/view/defaultappstorage(_:)
framework: SwiftUI
category: Persistent storage
title: defaultAppStorage(_:)
kind: method
captured: 2026-05-02
---

# defaultAppStorage(_:)

The default store used by `AppStorage` contained within the view.

## Declaration

```swift
nonisolated func defaultAppStorage(_ store: UserDefaults) -> some View

```

### Discussion

If unspecified, the default store for a view hierarchy is `UserDefaults.standard`, but can be set a to a custom one. For example, sharing defaults between an app and an extension can override the default store to one created with `UserDefaults.init(suiteName:_)`.

## Parameters

- **store**: The user defaults to use as the default store for `AppStorage`.





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
- `AppStorage`
- `SceneStorage`
