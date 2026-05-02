---
url: https://developer.apple.com/documentation/swiftui/view/ornament(visibility:attachmentanchor:contentalignment:ornament:)
framework: SwiftUI
category: Toolbars
title: ornament(visibility:attachmentAnchor:contentAlignment:ornament:)
kind: method
captured: 2026-05-02
---

# ornament(visibility:attachmentAnchor:contentAlignment:ornament:)

Presents an ornament.

## Declaration

```swift
nonisolated func ornament<Content>(visibility: Visibility = .automatic, attachmentAnchor: OrnamentAttachmentAnchor, contentAlignment: Alignment3D = .back, @ViewBuilder ornament: () -> Content) -> some View where Content : View

```

### Discussion

Use this method to show an ornament at the specified position. The example below displays an ornament below the window:

```swift
Text("A view with an ornament")
    .ornament(attachmentAnchor: .scene(.bottom)) {
        OrnamentContent()
    }
```

## Parameters

- **visibility**: The visibility of the ornament.
- **attachmentAnchor**: The positioning anchor that defines the attachment point of the ornament.
- **contentAlignment**: The alignment of the ornament with its attachment anchor.





## Availability

- visionOS 1.0



## See Also

- `OrnamentAttachmentAnchor`
