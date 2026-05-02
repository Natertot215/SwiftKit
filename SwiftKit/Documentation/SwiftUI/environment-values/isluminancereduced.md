---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/isluminancereduced
framework: SwiftUI
category: Environment values
title: isLuminanceReduced
kind: property
captured: 2026-05-02
---

# isLuminanceReduced

A Boolean value that indicates whether the display or environment currently requires reduced luminance.

## Declaration

```swift
var isLuminanceReduced: Bool { get set }
```

### Discussion

When you detect this condition, lower the overall brightness of your view. For example, you can change large, filled shapes to be stroked, and choose less bright colors:

```swift
@Environment(\.isLuminanceReduced) var isLuminanceReduced

var body: some View {
    if isLuminanceReduced {
        Circle()
            .stroke(Color.gray, lineWidth: 10)
    } else {
        Circle()
            .fill(Color.white)
    }
}
```

In addition to the changes that you make, the system could also dim the display to achieve a suitable brightness. By reacting to `isLuminanceReduced`, you can preserve contrast and readability while helping to satisfy the reduced brightness requirement.

> **NOTE:** On watchOS, the system typically sets this value to `true` when the user lowers their wrist, but the display remains on. Starting in watchOS 8, the system keeps your view visible on wrist down by default. If you want the system to blur the screen instead, as it did in earlier versions of watchOS, set the value for the `Information-Property-List/WKSupportsAlwaysOnDisplay` key in your app’s `Information-Property-List` file to `false`.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `displayScale`
- `pixelLength`
- `horizontalSizeClass`
- `verticalSizeClass`
- `UserInterfaceSizeClass`
