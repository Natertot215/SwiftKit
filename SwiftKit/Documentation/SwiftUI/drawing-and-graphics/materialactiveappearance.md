---
url: https://developer.apple.com/documentation/swiftui/materialactiveappearance
framework: SwiftUI
category: Drawing and graphics
title: MaterialActiveAppearance
kind: struct
captured: 2026-05-02
---

# MaterialActiveAppearance

The behavior for how materials appear active and inactive.

## Declaration

```swift
struct MaterialActiveAppearance
```

### Overview

On macOS, materials have active and inactive appearances that can reinforce the active appearance of the window they are in:

- Materials used as a `window` container background and `bar` materials will appear inactive when their containing window is inactive.
- All other materials will always appear active by default.

An explicit active appearance can be set to override a material’s default behavior. For example, materials used as the `window` container background can be made to always appear active by setting the active appearance behavior to be always active:

```swift
Text("Hello, World!")
    .containerBackground(
        Material.regular.materialActiveAppearance(.active),
        for: .window)
```





## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Type Properties

- `active`
- `automatic`
- `inactive`
- `matchWindow`

## See Also

- `brightness(_:)`
- `contrast(_:)`
- `colorInvert()`
- `colorMultiply(_:)`
- `saturation(_:)`
- `grayscale(_:)`
- `hueRotation(_:)`
- `luminanceToAlpha()`
- `materialActiveAppearance(_:)`
- `materialActiveAppearance`
