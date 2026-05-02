---
url: https://developer.apple.com/documentation/swiftui/pencilsqueezegesturephase
framework: SwiftUI
category: Gestures
title: PencilSqueezeGesturePhase
kind: enum
captured: 2026-05-02
---

# PencilSqueezeGesturePhase

Describes the phase and value of an Apple Pencil squeeze gesture.

## Declaration

```swift
@frozen enum PencilSqueezeGesturePhase
```

### Overview

When you use the `View/onPencilSqueeze(perform:)` view modifier, you can handle the Apple Pencil squeeze gesture’s phase in the `action` closure.





## Relationships

**Conforms To**: `Equatable`

## Availability

- iOS 17.5
- iPadOS 17.5
- Mac Catalyst 17.5
- macOS 14.5
- visionOS 26.2

## Topics

### Enumeration Cases

- `PencilSqueezeGesturePhase.active(_:)`
- `PencilSqueezeGesturePhase.ended(_:)`
- `PencilSqueezeGesturePhase.failed`

## See Also

- `onPencilDoubleTap(perform:)`
- `onPencilSqueeze(perform:)`
- `preferredPencilDoubleTapAction`
- `preferredPencilSqueezeAction`
- `PencilPreferredAction`
- `PencilDoubleTapGestureValue`
- `PencilSqueezeGestureValue`
- `PencilHoverPose`
