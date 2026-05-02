---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/verticalsizeclass
framework: SwiftUI
category: Environment values
title: verticalSizeClass
kind: property
captured: 2026-05-02
---

# verticalSizeClass

The vertical size class of this environment.

## Declaration

```swift
@backDeployed(before: macOS 14.0, tvOS 17.0, watchOS 10.0)
var verticalSizeClass: UserInterfaceSizeClass? { get set }
```

### Discussion

You receive a `UserInterfaceSizeClass` value when you read this environment value. The value tells you about the amount of vertical space available to the view that reads it. You can read this size class like any other of the `EnvironmentValues`, by creating a property with the `Environment` property wrapper:

```swift
@Environment(\.verticalSizeClass) private var verticalSizeClass
```

SwiftUI sets this size class based on several factors, including:

- The current device type.
- The orientation of the device.

You can adjust the appearance of custom views by reading this size class and conditioning your views. If you do, be prepared to handle size class changes while your app runs, because factors like device orientation can change at runtime.

In watchOS, the vertical size class is always `UserInterfaceSizeClass/compact`. In macOS, and tvOS, it’s always `UserInterfaceSizeClass/regular`.

Writing to the vertical size class in the environment before macOS 14.0, tvOS 17.0, and watchOS 10.0 is not supported.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `isLuminanceReduced`
- `displayScale`
- `pixelLength`
- `horizontalSizeClass`
- `UserInterfaceSizeClass`
