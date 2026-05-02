---
url: https://developer.apple.com/documentation/swiftui/windowresizability
framework: SwiftUI
category: Windows
title: WindowResizability
kind: struct
captured: 2026-05-02
---

# WindowResizability

The resizability of a window.

## Declaration

```swift
struct WindowResizability
```

### Overview

Use the `Scene/windowResizability(_:)` scene modifier to apply a value of this type to a `Scene` that you define in your `App` declaration. The value that you specify indicates the strategy the system uses to place minimum and maximum size restrictions on windows that it creates from that scene.

For example, you can create a window group that people can resize to between 100 and 400 points in both dimensions by applying both a frame with those constraints to the scene’s content, and the `WindowResizability/contentSize` resizability to the scene:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(
                    minWidth: 100, maxWidth: 400,
                    minHeight: 100, maxHeight: 400)
        }
        .windowResizability(.contentSize)
    }
}
```

The default value for all scenes if you don’t apply the modifier is `WindowResizability/automatic`. With that strategy, `Settings` windows use the `WindowResizability/contentSize` strategy, while all others use `WindowResizability/contentMinSize`. Windows on visionOS with a window style of `WindowStyle/volumetric` also use the `WindowResizability/contentSize` strategy.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 13.0
- visionOS 1.0

## Topics

### Getting the resizability

- `automatic`
- `contentMinSize`
- `contentSize`

## See Also

- `Positioning and sizing windows`
- `defaultSize(_:)`
- `defaultSize(width:height:)`
- `defaultSize(width:height:depth:)`
- `defaultSize(_:in:)`
- `defaultSize(width:height:depth:in:)`
- `windowResizability(_:)`
- `windowIdealSize(_:)`
- `WindowIdealSize`
