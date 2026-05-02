---
url: https://developer.apple.com/documentation/swiftui/view/mapfeatureselectiondisabled(_:)
framework: SwiftUI
category: Technology-specific views
title: mapFeatureSelectionDisabled(_:)
kind: method
captured: 2026-05-02
---

# mapFeatureSelectionDisabled(_:)

Specifies which map features should have selection disabled.

## Declaration

```swift
@MainActor @preconcurrency func mapFeatureSelectionDisabled(_ selectionDisabled: @escaping (MapFeature) -> Bool) -> some View

```

### Discussion

The `selectionDisabled` parameter takes a closure which maps map features, to booleans. If that closure returns true for a given map feature, that map feature will be considered unselectable.

## Parameters

- **selectionDisabled**: Determines if selection should be disabled for a given map feature.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0



## See Also

- `LocationButton`
- `Map`
- `mapStyle(_:)`
- `mapScope(_:)`
- `mapFeatureSelectionAccessory(_:)`
- `mapFeatureSelectionContent(content:)`
- `mapControls(_:)`
- `mapControlVisibility(_:)`
- `mapCameraKeyframeAnimator(trigger:keyframes:)`
- `lookAroundViewer(isPresented:scene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `lookAroundViewer(isPresented:initialScene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `onMapCameraChange(frequency:_:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:arrowEdge:)`
- `mapItemDetailPopover(item:displaysMap:attachmentAnchor:)`
