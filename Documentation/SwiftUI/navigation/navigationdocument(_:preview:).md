---
url: https://developer.apple.com/documentation/swiftui/view/navigationdocument(_:preview:)
framework: SwiftUI
category: Navigation
title: navigationDocument(_:preview:)
kind: method
captured: 2026-05-02
---

# navigationDocument(_:preview:)

Configures the view’s document for purposes of navigation.

## Declaration

```swift
nonisolated func navigationDocument<D, I1, I2>(_ document: D, preview: SharePreview<I1, I2>) -> some View where D : Transferable, I1 : Transferable, I2 : Transferable

```

### Discussion

In iOS, iPadOS, this populates the title menu with a header previewing the document. In macOS, this populates a proxy icon.

Refer to the `Configure-Your-Apps-Navigation-Titles` article for more information on navigation document modifiers.

## Parameters

- **document**: The transferable content associated to the navigation title.
- **preview**: The preview of the document to use when sharing.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `navigationTitle(_:)`
- `navigationSubtitle(_:)`
- `navigationDocument(_:)`
