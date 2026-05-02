---
url: https://developer.apple.com/documentation/swiftui/scaledmetric
framework: SwiftUI
category: Text input and output
title: ScaledMetric
kind: struct
captured: 2026-05-02
---

# ScaledMetric

A dynamic property that scales a numeric value.

## Declaration

```swift
@propertyWrapper struct ScaledMetric<Value> where Value : BinaryFloatingPoint
```







## Relationships

**Conforms To**: `DynamicProperty`, `Sendable`, `SendableMetatype`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating the metric

- `init(wrappedValue:)`
- `init(wrappedValue:relativeTo:)`

### Getting the metric

- `wrappedValue`

## See Also

- `textScale(_:isEnabled:)`
- `dynamicTypeSize(_:)`
- `dynamicTypeSize`
- `DynamicTypeSize`
- `TextVariantPreference`
- `FixedTextVariant`
- `SizeDependentTextVariant`
