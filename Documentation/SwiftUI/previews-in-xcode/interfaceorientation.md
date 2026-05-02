---
url: https://developer.apple.com/documentation/swiftui/interfaceorientation
framework: SwiftUI
category: Previews in Xcode
title: InterfaceOrientation
kind: struct
captured: 2026-05-02
---

# InterfaceOrientation

The orientation of the interface from the user’s perspective.

## Declaration

```swift
struct InterfaceOrientation
```

### Overview

By default, device previews appear right side up, using orientation `InterfaceOrientation/portrait`. You can change the orientation with a call to the `View/previewInterfaceOrientation(_:)` modifier:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
```





## Relationships

**Conforms To**: `CaseIterable`, `Equatable`, `Identifiable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting an orientation

- `portrait`
- `portraitUpsideDown`
- `landscapeLeft`
- `landscapeRight`

## See Also

- `previewDevice(_:)`
- `PreviewDevice`
- `previewLayout(_:)`
- `previewInterfaceOrientation(_:)`
