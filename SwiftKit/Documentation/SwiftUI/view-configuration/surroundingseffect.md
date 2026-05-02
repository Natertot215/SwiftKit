---
url: https://developer.apple.com/documentation/swiftui/surroundingseffect
framework: SwiftUI
category: View configuration
title: SurroundingsEffect
kind: struct
captured: 2026-05-02
---

# SurroundingsEffect

Effects that the system can apply to passthrough video.

## Declaration

```swift
struct SurroundingsEffect
```

### Overview

Use one of these values with the `View/preferredSurroundingsEffect(_:)` view modifier to indicate what effect to apply to passthrough video when the modified view is displayed.





## Relationships

**Conforms To**: `Equatable`

## Availability

- macOS 26.0
- visionOS 1.0

## Topics

### Getting the effect

- `systemDark`

### Type Properties

- `dark`
- `semiDark`
- `ultraDark`

### Type Methods

- `colorMultiply(_:)`
- `dim(intensity:)`

## See Also

- `preferredSurroundingsEffect(_:)`
- `BreakthroughEffect`
