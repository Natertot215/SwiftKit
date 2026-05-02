---
url: https://developer.apple.com/documentation/swiftui/view/previewlayout(_:)
framework: SwiftUI
category: Previews in Xcode
title: previewLayout(_:)
kind: method
captured: 2026-05-02
---

# previewLayout(_:)

Overrides the size of the container for the preview.

## Declaration

```swift
nonisolated func previewLayout(_ value: PreviewLayout) -> some View

```

### Return Value

A preview that uses the given layout.

### Discussion

By default, previews use the `PreviewLayout/device` layout, which places the view inside a visual representation of the chosen device. You can instead tell a preview to use a different layout by choosing one of the `PreviewLayout` values, like `PreviewLayout/sizeThatFits`:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
            .previewLayout(.sizeThatFits)
    }
}
```

## Parameters

- **value**: A layout to use for preview.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `previewDevice(_:)`
- `PreviewDevice`
- `previewInterfaceOrientation(_:)`
- `InterfaceOrientation`
