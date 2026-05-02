---
url: https://developer.apple.com/documentation/swiftui/shader
framework: SwiftUI
category: Drawing and graphics
title: Shader
kind: struct
captured: 2026-05-02
---

# Shader

A reference to a function in a Metal shader library, along with its bound uniform argument values.

## Declaration

```swift
struct Shader
```

### Overview

Shader values can be used as filter effects on views, see the `View/colorEffect(_:isEnabled:)`, `View/distortionEffect(_:maxSampleOffset:isEnabled:)`, and `View/layerEffect(_:maxSampleOffset:isEnabled:)` functions.

Shaders also conform to the `ShapeStyle` protocol, letting their MSL shader function provide per-pixel color to fill any shape or text view. For a shader function to act as a fill pattern it must have a function signature matching:

```swift
[[ stitchable ]] half4 name(float2 position, args...)
```

where `position` is the user-space coordinates of the pixel applied to the shader, and `args...` should be compatible with the uniform arguments bound to `shader`. The function should return the premultiplied color value in the color space of the destination (typically extended sRGB).





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Sendable`, `SendableMetatype`, `ShapeStyle`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0

## Topics

### Creating a shader

- `init(function:arguments:)`
- `Shader.Argument`

### Getting the shader function

- `function`
- `arguments`

### Configuring the shader

- `dithersColor`

### Structures

- `Shader.UsageType`

### Instance Methods

- `compile(as:)`

## See Also

- `colorEffect(_:isEnabled:)`
- `distortionEffect(_:maxSampleOffset:isEnabled:)`
- `layerEffect(_:maxSampleOffset:isEnabled:)`
- `ShaderFunction`
- `ShaderLibrary`
