---
url: https://developer.apple.com/documentation/swiftui/view/mapcontrolvisibility(_:)
framework: SwiftUI
category: Technology-specific views
title: mapControlVisibility(_:)
kind: method
captured: 2026-05-02
---

# mapControlVisibility(_:)

Configures all Map controls in the environment to have the specified visibility

## Declaration

```swift
@MainActor @preconcurrency func mapControlVisibility(_ visibility: Visibility) -> some View

```

### Discussion

MapCompass, MapScaleView, and MapPitchToggle may automatically show and hide based on the current state of the Map. That may not be appropriate for all use cases, where always showing a control may be desirable.

```swift
HStack {
    MapCompass()
    MapScaleView()
    MapPitchToggle()
}
.mapControls(.visible)
```

Other controls don’t have an automatic visibility behavior, so they will always be visible when automatic is specified. Controls may also be hidden via this modifier when conditionalizing the view is not appropriate

```swift
MapUserLocationButton()
    .mapControls(.automatic)
MapZoomStepper()
    .mapControls(.hidden)
```

## Parameters

- **visibility**: How modified map controls should show or hide





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- watchOS 10.0



## See Also

- `LocationButton`
- `Map`
- `mapStyle(_:)`
- `mapScope(_:)`
- `mapFeatureSelectionDisabled(_:)`
- `mapFeatureSelectionAccessory(_:)`
- `mapFeatureSelectionContent(content:)`
- `mapControls(_:)`
- `mapCameraKeyframeAnimator(trigger:keyframes:)`
- `lookAroundViewer(isPresented:scene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `lookAroundViewer(isPresented:initialScene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `onMapCameraChange(frequency:_:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:arrowEdge:)`
- `mapItemDetailPopover(item:displaysMap:attachmentAnchor:)`
