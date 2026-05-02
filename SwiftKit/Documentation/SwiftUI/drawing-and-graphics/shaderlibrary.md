---
url: https://developer.apple.com/documentation/swiftui/shaderlibrary
framework: SwiftUI
category: Drawing and graphics
title: ShaderLibrary
kind: struct
captured: 2026-05-02
---

# ShaderLibrary

A Metal shader library.

## Declaration

```swift
@dynamicMemberLookup struct ShaderLibrary
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

### Getting the default shader library

- `default`
- `bundle(_:)`

### Creating a shader library

- `init(url:)`
- `init(data:)`

### Access shader functions

- `subscript(dynamicMember:)`

### Subscripts

- `subscript(dynamicMember:)`

## See Also

- `colorEffect(_:isEnabled:)`
- `distortionEffect(_:maxSampleOffset:isEnabled:)`
- `layerEffect(_:maxSampleOffset:isEnabled:)`
- `Shader`
- `ShaderFunction`
