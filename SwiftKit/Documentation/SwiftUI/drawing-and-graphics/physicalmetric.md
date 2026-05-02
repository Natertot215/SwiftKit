---
url: https://developer.apple.com/documentation/swiftui/physicalmetric
framework: SwiftUI
category: Drawing and graphics
title: PhysicalMetric
kind: struct
captured: 2026-05-02
---

# PhysicalMetric

Provides access to a value in points that corresponds to the specified physical measurement.

## Declaration

```swift
@propertyWrapper @frozen struct PhysicalMetric<Value>
```

### Overview

Use this property wrapper inside a `View` or a type that inherits a `View`’s environment, like a `ViewModifier`. Its value will be the equivalent in points of the physical measurement of length you specify.

For example, to have a variable that contains the amount of points corresponding to one meter, you can do the following:

```swift
struct MyView: View {
    @PhysicalMetric(from: .meters)
    var twoAndAHalfMeters = 2.5
    …
}
```

Using this wrapper for a property of a type not associated with a scene’s view contents, like an  `App` or a `Scene`, is unsupported.

### Compensating for World Scaling

Starting with apps built against the visionOS 2.0 SDK, the default behavior of `PhysicalMetric` is to produce values that match the distances used by `RealityView`s in the same scene, by scaling its returned values to match the world scaling of the current scene. Previously, the values were not scaled, and they were suitable for measuring distances and lengths within the user’s surroundings, outside of any scene. Unscaled values could produce unexpected behavior if used in conjunction with `RealityView`s within the scene.

To modify the behavior of `PhysicalMetric` and obtain unscaled values, use the `View/transformEnvironment(_:transform:)` modifier, transforming the `EnvironmentValues/physicalMetrics` key path, to edit the converter used by `PhysicalMetric` within the modified views to use a new `WorldScalingCompensation` mode. For example:

```swift
struct RulerView: View {
    @PhysicalMetric(from: .meters)
    var oneMeter = 1

    var body: some View {
        /* implement a size-accurate ruler */
    }
}

struct ContentView: View {
    var body: some View {
        RulerView()
            .transformEnvironment(\.physicalMetrics) { metrics in
                metrics = metrics.worldScalingCompensation(.unscaled)
            }
    }
}
```

> **NOTE:** `PhysicalMetricsConverter`

> **NOTE:** `WorldScalingCompensation`





## Relationships

**Conforms To**: `DynamicProperty`

## Availability

- visionOS 1.0

## Topics

### Creating a metric

- `init(wrappedValue:from:)`

### Getting the value

- `wrappedValue`

## See Also

- `GeometryReader`
- `GeometryReader3D`
- `GeometryProxy`
- `GeometryProxy3D`
- `coordinateSpace(_:)`
- `CoordinateSpace`
- `CoordinateSpaceProtocol`
- `PhysicalMetricsConverter`
