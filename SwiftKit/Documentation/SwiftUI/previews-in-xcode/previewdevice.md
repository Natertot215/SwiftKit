---
url: https://developer.apple.com/documentation/swiftui/previewdevice
framework: SwiftUI
category: Previews in Xcode
title: PreviewDevice
kind: struct
captured: 2026-05-02
---

# PreviewDevice

A simulator device that runs a preview.

## Declaration

```swift
struct PreviewDevice
```

### Overview

Create a preview device by name, like “iPhone X”, or by model number, like “iPad8,1”. Use the device in a call to the `View/previewDevice(_:)` modifier to set a preview device that doesn’t change when you change the run destination in Xcode:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
    }
}
```

You can get a list of supported preview device names by using the `xcrun` command in the Terminal app:

```swift
% xcrun simctl list devicetypes
```

Additionally, you can use the following values for macOS platform development:

- “Mac”
- “Mac Catalyst”





## Relationships

**Conforms To**: `ExpressibleByExtendedGraphemeClusterLiteral`, `ExpressibleByStringLiteral`, `ExpressibleByUnicodeScalarLiteral`, `RawRepresentable`, `Sendable`, `SendableMetatype`

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
- `previewLayout(_:)`
- `previewInterfaceOrientation(_:)`
- `InterfaceOrientation`
