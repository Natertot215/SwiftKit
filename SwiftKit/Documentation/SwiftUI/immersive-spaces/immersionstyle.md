---
url: https://developer.apple.com/documentation/swiftui/immersionstyle
framework: SwiftUI
category: Immersive spaces
title: ImmersionStyle
kind: protocol
captured: 2026-05-02
---

# ImmersionStyle

The styles that an immersive space can have.

## Declaration

```swift
protocol ImmersionStyle
```

### Overview

Configure the appearance and behavior of an `ImmersiveSpace` by adding the `Scene/immersionStyle(selection:in:)` scene modifier to the space and specifying a style that conforms to this protocol, like `ImmersionStyle/mixed` or `ImmersionStyle/full`. For example, the following app defines a solar system scene that uses full immersion:

```swift
@main
struct SolarSystemApp: App {
    @State private var style: ImmersionStyle = .full

    var body: some Scene {
        ImmersiveSpace {
            SolarSystem()
        }
        .immersionStyle(selection: $style, in: .full)
    }
}
```





## Relationships

**Conforming Types**: `AutomaticImmersionStyle`, `FullImmersionStyle`, `MixedImmersionStyle`, `ProgressiveImmersionStyle`

## Availability

- macOS 26.0
- visionOS 1.0

## Topics

### Getting built-in styles

- `automatic`
- `full`
- `mixed`
- `progressive`

### Supporting types

- `AutomaticImmersionStyle`
- `FullImmersionStyle`
- `MixedImmersionStyle`
- `ProgressiveImmersionStyle`

### Type Methods

- `progressive(_:initialAmount:)`
- `progressive(_:initialAmount:aspectRatio:)`
- `progressive(aspectRatio:)`

## See Also

- `ImmersiveSpace`
- `ImmersiveSpaceContentBuilder`
- `immersionStyle(selection:in:)`
- `immersiveSpaceDisplacement`
- `ImmersiveEnvironmentBehavior`
- `ProgressiveImmersionAspectRatio`
