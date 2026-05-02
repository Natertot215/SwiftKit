---
url: https://developer.apple.com/documentation/swiftui/view/imagescale(_:)
framework: SwiftUI
category: Images
title: imageScale(_:)
kind: method
captured: 2026-05-02
---

# imageScale(_:)

Scales images within the view according to one of the relative sizes available including small, medium, and large images sizes.

## Declaration

```swift
nonisolated func imageScale(_ scale: Image.Scale) -> some View

```

### Discussion

The example below shows the relative scaling effect. The system renders the image at a relative size based on the available space and configuration options of the image it is scaling.

```swift
VStack {
    HStack {
        Image(systemName: "heart.fill")
            .imageScale(.small)
        Text("Small")
    }
    HStack {
        Image(systemName: "heart.fill")
            .imageScale(.medium)
        Text("Medium")
    }

    HStack {
        Image(systemName: "heart.fill")
            .imageScale(.large)
        Text("Large")
    }
}
```

## Parameters

- **scale**: One of the relative sizes provided by the image scale enumeration.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 11.0
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `Fitting images into available space`
- `imageScale`
- `Image.Scale`
- `Image.Orientation`
- `Image.ResizingMode`
