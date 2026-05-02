---
url: https://developer.apple.com/documentation/swiftui/view/mapcamerakeyframeanimator(trigger:keyframes:)
framework: SwiftUI
category: Technology-specific views
title: mapCameraKeyframeAnimator(trigger:keyframes:)
kind: method
captured: 2026-05-02
---

# mapCameraKeyframeAnimator(trigger:keyframes:)

Uses the given keyframes to animate the camera of a `Map` when the given trigger value changes.

## Declaration

```swift
@MainActor @preconcurrency func mapCameraKeyframeAnimator(trigger: some Equatable, @KeyframesBuilder<MapCamera> keyframes: @escaping (MapCamera) -> some Keyframes<MapCamera>) -> some View

```

### Discussion

When the trigger value changes, the map calls the `keyframes` closure to generate the keyframes that will animate the camera. The animation will continue for the duration of the keyframes that you specify.

If the user performs a gesture while the animation is in progress, the animation will be immediately removed, allowing the interaction to take control of the camera.

## Parameters

- **trigger**: A value to observe for changes.
- **keyframes**: A keyframes builder closure that is called when starting a new keyframe animation. The current map camera is provided as the only parameter.





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
- `mapControlVisibility(_:)`
- `lookAroundViewer(isPresented:scene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `lookAroundViewer(isPresented:initialScene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `onMapCameraChange(frequency:_:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:arrowEdge:)`
- `mapItemDetailPopover(item:displaysMap:attachmentAnchor:)`
