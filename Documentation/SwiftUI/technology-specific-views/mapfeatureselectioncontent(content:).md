---
url: https://developer.apple.com/documentation/swiftui/view/mapfeatureselectioncontent(content:)
framework: SwiftUI
category: Technology-specific views
title: mapFeatureSelectionContent(content:)
kind: method
captured: 2026-05-02
---

# mapFeatureSelectionContent(content:)

Specifies a custom presentation for the currently selected feature.

## Declaration

```swift
@MainActor @preconcurrency func mapFeatureSelectionContent(@MapContentBuilder content: @escaping (MapFeature) -> some MapContent) -> some View

```

### Discussion

The supported presentation options are `Annotation`, and `Marker`. Other types of map content will be ignored and handled as though no content was returned.

If empty map content is returned, the system presentation will be used.

## Parameters

- **content**: Generates the custom presentation for a given map feature.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0



## See Also

- `LocationButton`
- `Map`
- `mapStyle(_:)`
- `mapScope(_:)`
- `mapFeatureSelectionDisabled(_:)`
- `mapFeatureSelectionAccessory(_:)`
- `mapControls(_:)`
- `mapControlVisibility(_:)`
- `mapCameraKeyframeAnimator(trigger:keyframes:)`
- `lookAroundViewer(isPresented:scene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `lookAroundViewer(isPresented:initialScene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)`
- `onMapCameraChange(frequency:_:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:)`
- `mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:arrowEdge:)`
- `mapItemDetailPopover(item:displaysMap:attachmentAnchor:)`
