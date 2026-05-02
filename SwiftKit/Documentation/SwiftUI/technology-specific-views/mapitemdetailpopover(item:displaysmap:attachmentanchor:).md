---
url: https://developer.apple.com/documentation/swiftui/view/mapitemdetailpopover(item:displaysmap:attachmentanchor:)
framework: SwiftUI
category: Technology-specific views
title: mapItemDetailPopover(item:displaysMap:attachmentAnchor:)
kind: method
captured: 2026-05-02
---

# mapItemDetailPopover(item:displaysMap:attachmentAnchor:)

Presents a map item detail popover.

## Declaration

```swift
@MainActor @preconcurrency func mapItemDetailPopover(item: Binding<MKMapItem?>, displaysMap: Bool = true, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds)) -> some View

```

### Discussion

Use this modifier if you want the system to choose the best orientation of the popover’s arrow. If you want to specify a particular edge for the arrow, use `View/mapItemDetailPopover(item:displaysMap:attachmentAnchor:arrowEdge:)`.

## Parameters

- **item**: When `item` is non-`nil`, a detail popover is displayed for the map item.
- **displaysMap**: If an inline map should be displayed with the place data. A value of `true` must be specified if the application UI is not already showing the place in a map view.
- **attachmentAnchor**: The positioning anchor that defines the attachment point of the popover. The default is `bounds`.





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
