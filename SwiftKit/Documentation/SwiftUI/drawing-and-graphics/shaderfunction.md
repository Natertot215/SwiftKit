---
url: https://developer.apple.com/documentation/swiftui/shaderfunction
framework: SwiftUI
category: Drawing and graphics
title: ShaderFunction
kind: struct
captured: 2026-05-02
---

# ShaderFunction

A reference to a function in a Metal shader library.

## Declaration

```swift
@dynamicCallable struct ShaderFunction
```







## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0

## Topics

### Creating a shader function

- `init(library:name:)`

### Configuring a function

- `library`
- `name`
- `dynamicallyCall(withArguments:)`

## See Also

- `colorEffect(_:isEnabled:)`
- `distortionEffect(_:maxSampleOffset:isEnabled:)`
- `layerEffect(_:maxSampleOffset:isEnabled:)`
- `Shader`
- `ShaderLibrary`
