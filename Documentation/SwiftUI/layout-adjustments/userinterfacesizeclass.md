---
url: https://developer.apple.com/documentation/swiftui/userinterfacesizeclass
framework: SwiftUI
category: Layout adjustments
title: UserInterfaceSizeClass
kind: enum
captured: 2026-05-02
---

# UserInterfaceSizeClass

A set of values that indicate the visual size available to the view.

## Declaration

```swift
enum UserInterfaceSizeClass
```

### Overview

You receive a size class value when you read either the `EnvironmentValues/horizontalSizeClass` or `EnvironmentValues/verticalSizeClass` environment value. The value tells you about the amount of space available to your views in a given direction. You can read the size class like any other of the `EnvironmentValues`, by creating a property with the `Environment` property wrapper:

```swift
@Environment(\.horizontalSizeClass) private var horizontalSizeClass
@Environment(\.verticalSizeClass) private var verticalSizeClass
```

SwiftUI sets the size class based on several factors, including:

- The current device type.
- The orientation of the device.
- The appearance of Slide Over and Split View on iPad.

Several built-in views change their behavior based on the size class. For example, a `NavigationView` presents a multicolumn view when the horizontal size class is `UserInterfaceSizeClass/regular`, but a single column otherwise. You can also adjust the appearance of custom views by reading the size class and conditioning your views. If you do, be prepared to handle size class changes while your app runs, because factors like device orientation can change at runtime.





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting size classes

- `UserInterfaceSizeClass.compact`
- `UserInterfaceSizeClass.regular`

### Creating a size class

- `init(_:)`

## See Also

- `isLuminanceReduced`
- `displayScale`
- `pixelLength`
- `horizontalSizeClass`
- `verticalSizeClass`
