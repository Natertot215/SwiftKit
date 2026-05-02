---
url: https://developer.apple.com/documentation/swiftui/uihostingornament
framework: SwiftUI
category: UIKit integration
title: UIHostingOrnament
kind: class
captured: 2026-05-02
---

# UIHostingOrnament

A model that represents an ornament suitable for being hosted in UIKit.

## Declaration

```swift
class UIHostingOrnament<Content> where Content : View
```

### Overview

Use a `UIHostingOrnament` when you want to add ornaments to a UIKit view controller. For example, the following adds a single bottom ornament to the current view controller:

```swift
self.ornaments = [
    UIHostingOrnament(sceneAnchor: .bottom) {
        OrnamentContent()
    }
]
```





## Relationships

**Inherits From**: `UIOrnament`

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- visionOS 1.0

## Topics

### Creating a hosting ornament

- `init(sceneAnchor:contentAlignment:content:)`
- `rootView`

### Setting the alignment

- `contentAlignment`
- `sceneAnchor`

### Instance Properties

- `contentAlignment3D`

## See Also

- `UIOrnament`
