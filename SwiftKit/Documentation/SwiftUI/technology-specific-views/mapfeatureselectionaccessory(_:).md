---
url: https://developer.apple.com/documentation/swiftui/view/mapfeatureselectionaccessory(_:)
framework: SwiftUI
category: Technology-specific views
title: mapFeatureSelectionAccessory(_:)
kind: method
captured: 2026-05-02
---

# mapFeatureSelectionAccessory(_:)

Specifies the selection accessory to display for a `MapFeature`

## Declaration

```swift
@MainActor @preconcurrency func mapFeatureSelectionAccessory(_ style: MapItemDetailSelectionAccessoryStyle? = .automatic) -> some View

```



## Parameters

- **style**: The map item detail selection accessory style. If `nil`, no selection accessory will be displayed.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- visionOS 2.0



## See Also

- `LocationButton`
- `Map`
- `mapStyle(_:)`
- `mapScope(_:)`
- `mapFeatureSelectionDisabled(_:)`
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
