---
url: https://developer.apple.com/documentation/swiftui/previewprovider
framework: SwiftUI
category: Previews in Xcode
title: PreviewProvider
kind: protocol
captured: 2026-05-01
---

# PreviewProvider

## Declaration

```swift
@MainActor
@preconcurrency
protocol PreviewProvider : _PreviewProvider
```

## Abstract

A type that produces view previews in Xcode.

## Overview

> **Important**: You can use this protocol to define a preview manually, but you typically use a preview macro like [`Preview(_:body:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/Preview(_:body:)) instead.

You can create an Xcode preview by declaring a structure that conforms to the `PreviewProvider` protocol. Implement the required [`previews`](doc://com.apple.SwiftUI/documentation/SwiftUI/PreviewProvider/previews-swift.type.property) computed property, and return the view to display:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
```

Xcode statically discovers preview providers in your project and generates previews for any providers currently open in the source editor. Xcode generates the preview using the current run destination as a hint for which device to display.

### Customizing Previews

Customize the preview's appearance by adding view modifiers:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
```

Xcode creates different previews for each view in your preview, so you can see variations side by side:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
        CircleImage()
            .preferredColorScheme(.dark)
    }
}
```

Use a [`Group`](doc://com.apple.SwiftUI/documentation/SwiftUI/Group) when you want to maintain different previews, but apply a single modifier to all of them:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleImage()
            CircleImage()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
```

## Required Members

- [`previews`](doc://com.apple.SwiftUI/documentation/SwiftUI/PreviewProvider/previews-swift.type.property) - A collection of views to preview.
- [`Previews`](doc://com.apple.SwiftUI/documentation/SwiftUI/PreviewProvider/Previews-swift.associatedtype) - The type to preview.
- [`platform`](doc://com.apple.SwiftUI/documentation/SwiftUI/PreviewProvider/platform) - The platform on which to run the provider.

## Availability

- iOS 13.0+
- iPadOS 13.0+
- Mac Catalyst 13.0+
- macOS 10.15+
- tvOS 13.0+
- visionOS 1.0+
- watchOS 6.0+

## See Also

- [`Preview(_:body:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/Preview(_:body:)) - Creates a preview of a SwiftUI view.
- [`Previewable()`](doc://com.apple.SwiftUI/documentation/SwiftUI/Previewable()) - Tag allowing a dynamic property to appear inline in a preview.
- [`PreviewPlatform`](doc://com.apple.SwiftUI/documentation/SwiftUI/PreviewPlatform) - Platforms that can run the preview.
- [`View.previewDisplayName(_:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/View/previewDisplayName(_:)) - Sets a user visible name to show in the canvas for a preview.
- [`PreviewModifier`](doc://com.apple.SwiftUI/documentation/SwiftUI/PreviewModifier) - A type that defines an environment in which previews can appear.
- [`PreviewModifierContent`](doc://com.apple.SwiftUI/documentation/SwiftUI/PreviewModifierContent) - The type-erased content of a preview.
