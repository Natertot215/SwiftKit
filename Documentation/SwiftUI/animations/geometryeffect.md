---
url: https://developer.apple.com/documentation/swiftui/geometryeffect
framework: SwiftUI
category: Animations
title: GeometryEffect
kind: protocol
captured: 2026-05-02
---

# GeometryEffect

An effect that changes the visual appearance of a view, largely without changing its ancestors or descendants.

## Declaration

```swift
protocol GeometryEffect : Animatable, ViewModifier, _RemoveGlobalActorIsolation where Self.Body == Never
```

### Overview

The only change the effect makes to the view’s ancestors and descendants is to change the coordinate transform to and from them.





## Relationships

**Inherits From**: `Animatable`, `ViewModifier`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Applying effects

- `effectValue(size:)`
- `ignoredByLayout()`

## See Also

- `matchedGeometryEffect(id:in:properties:anchor:isSource:)`
- `MatchedGeometryProperties`
- `Namespace`
- `geometryGroup()`
