---
url: https://developer.apple.com/documentation/swiftui/view/photospickerdisabledcapabilities(_:)
framework: SwiftUI
category: Technology-specific views
title: photosPickerDisabledCapabilities(_:)
kind: method
captured: 2026-05-02
---

# photosPickerDisabledCapabilities(_:)

Disables capabilities of the Photos picker.

## Declaration

```swift
nonisolated func photosPickerDisabledCapabilities(_ disabledCapabilities: PHPickerCapabilities) -> some View

```

### Return Value

A Photos picker with specified capabilities that are disabled.

## Parameters

- **disabledCapabilities**: One or more of the available capabilities.





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
- `photosPickerAccessoryVisibility(_:edges:)`
- `photosPickerStyle(_:)`
