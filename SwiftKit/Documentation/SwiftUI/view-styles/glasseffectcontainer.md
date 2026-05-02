---
url: https://developer.apple.com/documentation/swiftui/glasseffectcontainer
framework: SwiftUI
category: View styles
title: GlassEffectContainer
kind: struct
captured: 2026-05-02
---

# GlassEffectContainer

A view that combines multiple Liquid Glass shapes into a single shape that can morph individual shapes into one another.

## Declaration

```swift
@MainActor @preconcurrency struct GlassEffectContainer<Content> where Content : View
```

### Overview

Use a container with the `View/glassEffect(_:in:)` modifier. Each view with a Liquid Glass effect contributes a shape rendered with the effect to a set of shapes. SwiftUI renders the effects together, improving rendering performance and allowing the effects to interact with and morph into one another.

Configure how shapes interact with one another by customizing the default spacing value of the container. As shapes near one another, their paths start to blend into one another. The higher the spacing, the sooner blending begins as the shapes approach each other.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`, `View`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- watchOS 26.0

## Topics

### Initializers

- `init(spacing:content:)`

## See Also

- `Applying Liquid Glass to custom views`
- `Landmarks: Building an app with Liquid Glass`
- `glassEffect(_:in:)`
- `interactive(_:)`
- `GlassEffectTransition`
- `GlassButtonStyle`
- `GlassProminentButtonStyle`
- `DefaultGlassEffectShape`
