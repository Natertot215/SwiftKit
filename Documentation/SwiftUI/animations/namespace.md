---
url: https://developer.apple.com/documentation/swiftui/namespace
framework: SwiftUI
category: Animations
title: Namespace
kind: struct
captured: 2026-05-02
---

# Namespace

A dynamic property type that allows access to a namespace defined by the persistent identity of the object containing the property (e.g. a view).

## Declaration

```swift
@frozen @propertyWrapper struct Namespace
```







## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `DynamicProperty`, `Sendable`, `SendableMetatype`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating a namespace

- `init()`

### Getting the namespace

- `wrappedValue`
- `Namespace.ID`

## See Also

- `matchedGeometryEffect(id:in:properties:anchor:isSource:)`
- `MatchedGeometryProperties`
- `GeometryEffect`
- `geometryGroup()`
