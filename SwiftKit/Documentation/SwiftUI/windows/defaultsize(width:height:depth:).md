---
url: https://developer.apple.com/documentation/swiftui/scene/defaultsize(width:height:depth:)
framework: SwiftUI
category: Windows
title: defaultSize(width:height:depth:)
kind: method
captured: 2026-05-02
---

# defaultSize(width:height:depth:)

Sets a default size for a volumetric window.

## Declaration

```swift
nonisolated func defaultSize(width: CGFloat, height: CGFloat, depth: CGFloat) -> some Scene

```

### Return Value

A scene that uses a default size for new windows.

### Discussion

Use this modifier to indicate the default initial size for a new 3D window created from a `Scene` using `VolumetricWindowStyle`:

```swift
WindowGroup {
    ContentView()
}
.windowStyle(.volumetric)
.defaultSize(width: 600, height: 400, depth: 600)
```

Each parameter is specified in points. The size of a volumetric scene is immutable after creation.

This modifier affects only windows that have the volumetric style in visionOS.

## Parameters

- **width**: The default width for the created window.
- **height**: The default height for the created window.
- **depth**: The default depth for the created volumetric window.





## Availability

- visionOS 1.0



## See Also

- `Positioning and sizing windows`
- `defaultSize(_:)`
- `defaultSize(width:height:)`
- `defaultSize(_:in:)`
- `defaultSize(width:height:depth:in:)`
- `windowResizability(_:)`
- `WindowResizability`
- `windowIdealSize(_:)`
- `WindowIdealSize`
