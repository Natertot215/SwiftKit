---
url: https://developer.apple.com/documentation/swiftui/scene/defaultsize(_:in:)
framework: SwiftUI
category: Windows
title: defaultSize(_:in:)
kind: method
captured: 2026-05-02
---

# defaultSize(_:in:)

Sets a default size for a volumetric window.

## Declaration

```swift
nonisolated func defaultSize(_ size: Size3D, in unit: UnitLength) -> some Scene

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
.defaultSize(Size3D(width: 1, height: 1, depth: 0.5), in: .meters)
```

Each parameter is specified in the unit you provide. The size of a volumetric scene is immutable after creation.

This modifier affects only windows that have the volumetric style in visionOS.

## Parameters

- **unit**: The unit of length the dimensions of the window are specified in.





## Availability

- visionOS 1.0



## See Also

- `Positioning and sizing windows`
- `defaultSize(_:)`
- `defaultSize(width:height:)`
- `defaultSize(width:height:depth:)`
- `defaultSize(width:height:depth:in:)`
- `windowResizability(_:)`
- `WindowResizability`
- `windowIdealSize(_:)`
- `WindowIdealSize`
