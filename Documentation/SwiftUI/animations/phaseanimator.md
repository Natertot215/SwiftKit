---
url: https://developer.apple.com/documentation/swiftui/phaseanimator
framework: SwiftUI
category: Animations
title: PhaseAnimator
kind: struct
captured: 2026-05-02
---

# PhaseAnimator

A container that animates its content by automatically cycling through a collection of phases that you provide, each defining a discrete step within an animation.

## Declaration

```swift
struct PhaseAnimator<Phase, Content> where Phase : Equatable, Content : View
```

### Overview

Use one of the phase animator view modifiers like `View/phaseAnimator(_:content:animation:)` to create a phased animation in your app.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Creating a phase animator

- `init(_:content:animation:)`
- `init(_:trigger:content:animation:)`

## See Also

- `Controlling the timing and movements of your animations`
- `phaseAnimator(_:content:animation:)`
- `phaseAnimator(_:trigger:content:animation:)`
