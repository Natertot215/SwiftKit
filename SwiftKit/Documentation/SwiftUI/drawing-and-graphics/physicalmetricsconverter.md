---
url: https://developer.apple.com/documentation/swiftui/physicalmetricsconverter
framework: SwiftUI
category: Drawing and graphics
title: PhysicalMetricsConverter
kind: struct
captured: 2026-05-02
---

# PhysicalMetricsConverter

A physical metrics converter provides conversion between point values and their extent in 3D space, in the form of physical length measurements.

## Declaration

```swift
@MainActor @preconcurrency struct PhysicalMetricsConverter
```

### Overview

Converters are available from the environment of a `View` or other type that inherits a `View`‘s environments, and are associated with the scene that contains that environment. The conversions expect (or emit) values in points in that scene’s coordinate system, and convert these to (or from) measurements of length in the user’s or scene’s reference frame.

To obtain a converter, use the `EnvironmentValues/physicalMetrics` key:

```swift
struct MyView: View {
    @Environment(\.physicalMetrics) var physicalMetrics
    …
}
```

When user action modifies a scene so that measurements have changed (e.g., by changing its scale), the view that accessed that environment key and its hierarchy will be reevaluated.

Attempting to obtain a converter inside a type not associated with a scene’s contents (for example, from an `App` or `Scene`’s environment) is not supported.

### Compensating for World Scaling

By default in apps linked against the visionOS 2.0 SDK or later, these conversions match the scene’s coordinate system, including any scale applied to it by the system. If you’re using meters as the unit, this will match the notion of meters in an unscaled `RealityView` in the same scene.

To obtain measurements that are accurate to the user’s surroundings, use the `PhysicalMetricsConverter/worldScalingCompensation(_:)` method to enable an appropriate compensation mode for the scale.





## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- visionOS 1.0

## Topics

### Converting a unit length

- `convert(_:from:)`
- `convert(_:to:)`

### Instance Properties

- `worldScalingCompensation`

### Instance Methods

- `worldScalingCompensation(_:)`

## See Also

- `GeometryReader`
- `GeometryReader3D`
- `GeometryProxy`
- `GeometryProxy3D`
- `coordinateSpace(_:)`
- `CoordinateSpace`
- `CoordinateSpaceProtocol`
- `PhysicalMetric`
