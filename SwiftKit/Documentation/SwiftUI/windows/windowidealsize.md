---
url: https://developer.apple.com/documentation/swiftui/windowidealsize
framework: SwiftUI
category: Windows
title: WindowIdealSize
kind: struct
captured: 2026-05-02
---

# WindowIdealSize

A type which defines the size a window should use when zooming.

## Declaration

```swift
struct WindowIdealSize
```

### Overview

Use this type in conjunction with the `Scene.windowIdealSize(_:)` modifier to override the default behavior for how windows behave when performing a zoom.

For example, you can define a window group where the window has an ideal width of 800 points and an ideal height of 600 points:

```swift
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(idealWidth: 800, idealHeight: 600)
        }
        .windowIdealSize(.fitToContent)
    }
}
```





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- macOS 15.0

## Topics

### Type Properties

- `automatic`
- `fitToContent`
- `maximum`

## See Also

- `Positioning and sizing windows`
- `defaultSize(_:)`
- `defaultSize(width:height:)`
- `defaultSize(width:height:depth:)`
- `defaultSize(_:in:)`
- `defaultSize(width:height:depth:in:)`
- `windowResizability(_:)`
- `WindowResizability`
- `windowIdealSize(_:)`
