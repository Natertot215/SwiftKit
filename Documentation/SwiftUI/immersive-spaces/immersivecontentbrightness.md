---
url: https://developer.apple.com/documentation/swiftui/immersivecontentbrightness
framework: SwiftUI
category: Immersive spaces
title: ImmersiveContentBrightness
kind: struct
captured: 2026-05-02
---

# ImmersiveContentBrightness

The content brightness of an immersive space.

## Declaration

```swift
struct ImmersiveContentBrightness
```

### Overview

Use a value of this type as an input to the `Scene/immersiveContentBrightness(_:)` scene modifier to indicate the ambient content brightness of an `ImmersiveSpace`.

When you do this to create an environment that’s suitable for video playback, use one of the standard brightness values like `ImmersiveContentBrightness/bright`, `ImmersiveContentBrightness/dim`, or `ImmersiveContentBrightness/dark` to provide good results for most use cases. To optimize further, you can create a custom brightness using a normalized value that expresses the linear brightness ratio between a standard dynamic range white video frame and the background that surrounds the player window.





## Relationships

**Conforms To**: `Equatable`

## Availability

- visionOS 1.0

## Topics

### Getting brightness levels

- `automatic`
- `dark`
- `dim`
- `bright`
- `custom(_:)`

## See Also

- `immersiveContentBrightness(_:)`
