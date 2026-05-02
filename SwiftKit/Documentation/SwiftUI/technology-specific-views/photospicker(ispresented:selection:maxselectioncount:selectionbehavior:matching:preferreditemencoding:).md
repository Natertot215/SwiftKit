---
url: https://developer.apple.com/documentation/swiftui/view/photospicker(ispresented:selection:maxselectioncount:selectionbehavior:matching:preferreditemencoding:)
framework: SwiftUI
category: Technology-specific views
title: photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)
kind: method
captured: 2026-05-02
---

# photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)

Presents a Photos picker that selects a collection of `PhotosPickerItem`.

## Declaration

```swift
nonisolated func photosPicker(isPresented: Binding<Bool>, selection: Binding<[PhotosPickerItem]>, maxSelectionCount: Int? = nil, selectionBehavior: PhotosPickerSelectionBehavior = .default, matching filter: PHPickerFilter? = nil, preferredItemEncoding: PhotosPickerItem.EncodingDisambiguationPolicy = .automatic) -> some View

```

### Discussion

The user explicitly grants access only to items they choose, so photo library access authorization is not needed.

## Parameters

- **isPresented**: The binding to whether the Photos picker should be shown.
- **selection**: All items being shown and selected in the Photos picker.
- **maxSelectionCount**: The maximum number of items that can be selected. Default is `nil`. Setting it to `nil` means maximum supported by the system.
- **selectionBehavior**: The selection behavior of the Photos picker. Default is `.default`.
- **filter**: Types of items that can be shown. Default is `nil`. Setting it to `nil` means all supported types can be shown.
- **preferredItemEncoding**: The encoding disambiguation policy of selected items. Default is `.automatic`. Setting it to `.automatic` means the best encoding determined by the system will be used.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- watchOS 9.0



## See Also

- `PhotosPicker`
- `photosPicker(isPresented:selection:matching:preferredItemEncoding:)`
- `photosPicker(isPresented:selection:matching:preferredItemEncoding:photoLibrary:)`
- `photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)`
- `photosPickerAccessoryVisibility(_:edges:)`
- `photosPickerDisabledCapabilities(_:)`
- `photosPickerStyle(_:)`
