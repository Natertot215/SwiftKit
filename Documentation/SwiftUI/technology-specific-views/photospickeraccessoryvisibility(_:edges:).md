---
url: https://developer.apple.com/documentation/swiftui/view/photospickeraccessoryvisibility(_:edges:)
framework: SwiftUI
category: Technology-specific views
title: photosPickerAccessoryVisibility(_:edges:)
kind: method
captured: 2026-05-02
---

# photosPickerAccessoryVisibility(_:edges:)

Sets the accessory visibility of the Photos picker. Accessories include anything between the content and the edge, like the navigation bar or the sidebar.

## Declaration

```swift
nonisolated func photosPickerAccessoryVisibility(_ visibility: Visibility, edges: Edge.Set = .all) -> some View

```

### Return Value

A Photos picker with the specified accessory visibility.

## Parameters

- **edges**: The accessory visibility to apply.
- **edges**: One or more of the available edges.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0



## See Also

- `PhotosPicker`
- `photosPicker(isPresented:selection:matching:preferredItemEncoding:)`
- `photosPicker(isPresented:selection:matching:preferredItemEncoding:photoLibrary:)`
- `photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)`
- `photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)`
- `photosPickerDisabledCapabilities(_:)`
- `photosPickerStyle(_:)`
