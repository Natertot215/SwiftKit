---
url: https://developer.apple.com/documentation/swiftui/gaugestyle
framework: SwiftUI
category: View styles
title: GaugeStyle
kind: protocol
captured: 2026-05-02
---

# GaugeStyle

Defines the implementation of all gauge instances within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol GaugeStyle
```

### Overview

To configure the style for all the `Gauge` instances in a view hierarchy, use the `View/gaugeStyle(_:)` modifier. For example, you can configure a gauge to use the `GaugeStyle/circular` style:

```swift
Gauge(value: batteryLevel, in: 0...100) {
    Text("Battery Level")
}
.gaugeStyle(.circular)
```

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `AccessoryCircularCapacityGaugeStyle`, `AccessoryCircularGaugeStyle`, `AccessoryLinearCapacityGaugeStyle`, `AccessoryLinearGaugeStyle`, `CircularGaugeStyle`, `DefaultGaugeStyle`, `LinearCapacityGaugeStyle`, `LinearGaugeStyle`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Getting the automatic style

- `automatic`

### Getting circular gauge styles

- `circular`
- `accessoryCircular`
- `accessoryCircularCapacity`

### Getting linear gauge styles

- `linear`
- `linearCapacity`
- `accessoryLinear`
- `accessoryLinearCapacity`

### Creating custom gauge styles

- `makeBody(configuration:)`
- `GaugeStyle.Configuration`
- `Body`

### Supporting types

- `DefaultGaugeStyle`
- `CircularGaugeStyle`
- `AccessoryCircularGaugeStyle`
- `AccessoryCircularCapacityGaugeStyle`
- `LinearGaugeStyle`
- `LinearCapacityGaugeStyle`
- `AccessoryLinearGaugeStyle`
- `AccessoryLinearCapacityGaugeStyle`

## See Also

- `gaugeStyle(_:)`
- `GaugeStyleConfiguration`
- `progressViewStyle(_:)`
- `ProgressViewStyle`
- `ProgressViewStyleConfiguration`
