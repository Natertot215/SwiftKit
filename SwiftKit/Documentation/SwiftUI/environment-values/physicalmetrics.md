---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/physicalmetrics
framework: SwiftUI
category: Environment values
title: physicalMetrics
kind: property
captured: 2026-05-02
---

# physicalMetrics

The physical metrics associated with a scene.

## Declaration

```swift
var physicalMetrics: PhysicalMetricsConverter { get set }
```

### Discussion

Reading this value returns a `PhysicalMetricsConverter` corresponding to the window scene associated with the environment’s reader. The converter can convert point sizes into physical measurements of length, and vice versa.

Reading this value is only supported in the body of a `View` or of a type that inherits a `View`’s environment.







## Availability

- visionOS 1.0



## See Also

- `allowedDynamicRange`
- `backgroundMaterial`
- `backgroundProminence`
- `backgroundStyle`
- `badgeProminence`
- `contentTransition`
- `contentTransitionAddsDrawingGroup`
- `defaultMinListHeaderHeight`
- `defaultMinListRowHeight`
- `headerProminence`
- `realityKitScene`
- `realityViewCameraControls`
- `redactionReasons`
- `springLoadingBehavior`
- `symbolRenderingMode`
