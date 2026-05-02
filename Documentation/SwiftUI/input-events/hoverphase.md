---
url: https://developer.apple.com/documentation/swiftui/hoverphase
framework: SwiftUI
category: Input events
title: HoverPhase
kind: enum
captured: 2026-05-02
---

# HoverPhase

The current hovering state and value of the pointer.

## Declaration

```swift
@frozen enum HoverPhase
```

### Overview

When you use the `View/onContinuousHover(coordinateSpace:perform:)` modifier, you can handle the hovering state using the `action` closure. SwiftUI calls the closure with a phase value to indicate the current hovering state. The following example updates `hoverLocation` and `isHovering` based on the phase provided to the closure:

```swift
@State private var hoverLocation: CGPoint = .zero
@State private var isHovering = false

var body: some View {
    VStack {
        Color.red
            .frame(width: 400, height: 400)
            .onContinuousHover { phase in
                switch phase {
                case .active(let location):
                    hoverLocation = location
                    isHovering = true
                case .ended:
                    isHovering = false
                }
            }
            .overlay {
                Rectangle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(isHovering ? .green : .blue)
                    .offset(x: hoverLocation.x, y: hoverLocation.y)
            }
    }
}
```





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0

## Topics

### Getting hover phases

- `HoverPhase.active(_:)`
- `HoverPhase.ended`

## See Also

- `onHover(perform:)`
- `onContinuousHover(coordinateSpace:perform:)`
- `hoverEffect(_:isEnabled:)`
- `hoverEffectDisabled(_:)`
- `defaultHoverEffect(_:)`
- `isHoverEffectEnabled`
- `HoverEffectPhaseOverride`
- `OrnamentHoverContentEffect`
- `OrnamentHoverEffect`
