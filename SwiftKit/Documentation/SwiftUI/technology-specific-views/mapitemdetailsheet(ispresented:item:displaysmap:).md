---
url: https://developer.apple.com/documentation/swiftui/view/mapitemdetailsheet(ispresented:item:displaysmap:)
framework: SwiftUI
category: Technology-specific views
title: mapItemDetailSheet(isPresented:item:displaysMap:)
kind: method
captured: 2026-05-02
---

# mapItemDetailSheet(isPresented:item:displaysMap:)

Presents a map item detail sheet.

## Declaration

```swift
@MainActor @preconcurrency func mapItemDetailSheet(isPresented: Binding<Bool>, item: MKMapItem?, displaysMap: Bool = true) -> some View

```



## Parameters

- **isPresented**: The binding to whether the detail sheet should be shown.
- **item**: The map item to display. If nil, a “loading” view is displayed.
- **displaysMap**: If an inline map should be displayed with the place data. A value of `true` must be specified if the application UI is not already showing the place in a map view.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 2.0



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
- `mapCameraKeyframeAnimator(trigger:keyframes:)`
- `lookAroundViewer(isPresented:scene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `lookAroundViewer(isPresented:initialScene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `onMapCameraChange(frequency:_:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:arrowEdge:)`
