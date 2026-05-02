---
url: https://developer.apple.com/documentation/swiftui/view/previewinterfaceorientation(_:)
framework: SwiftUI
category: Previews in Xcode
title: previewInterfaceOrientation(_:)
kind: method
captured: 2026-05-02
---

# previewInterfaceOrientation(_:)

Overrides the orientation of the preview.

## Declaration

```swift
nonisolated func previewInterfaceOrientation(_ value: InterfaceOrientation) -> some View

```

### Return Value

A preview that uses the given orientation.

### Discussion

By default, device previews appear right side up, using orientation `InterfaceOrientation/portrait`. You can change the orientation of a preview using one of the values in the `InterfaceOrientation` structure:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
```

## Parameters

- **value**: An orientation to use for preview.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `previewDevice(_:)`
- `PreviewDevice`
- `previewLayout(_:)`
- `InterfaceOrientation`
