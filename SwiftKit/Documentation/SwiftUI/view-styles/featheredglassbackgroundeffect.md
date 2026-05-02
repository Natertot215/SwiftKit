---
url: https://developer.apple.com/documentation/swiftui/featheredglassbackgroundeffect
framework: SwiftUI
category: View styles
title: FeatheredGlassBackgroundEffect
kind: struct
captured: 2026-05-02
---

# FeatheredGlassBackgroundEffect


## Declaration

```swift
struct FeatheredGlassBackgroundEffect
```

#### Overview

You can also use `GlassBackgroundEffect/feathered` to construct this effect.

The layout size of a view with feathered glass background is based on the content size instead of the glass background size. When the glass background is clipped by an outer container, such as VStack or HStack, it can be resolved by increasing content size, such as content padding, or reducing the feathered glass background size with its padding parameter.





## Relationships

**Conforms To**: `GlassBackgroundEffect`

## Availability

- visionOS 2.4

## Topics

### Initializers

- `init()`
- `init(padding:softEdgeRadius:)`

## See Also

- `glassBackgroundEffect(displayMode:)`
- `glassBackgroundEffect(in:displayMode:)`
- `GlassBackgroundDisplayMode`
- `GlassBackgroundEffect`
- `AutomaticGlassBackgroundEffect`
- `GlassBackgroundEffectConfiguration`
- `PlateGlassBackgroundEffect`
