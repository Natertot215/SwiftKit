---
url: https://developer.apple.com/documentation/swiftui/scene/defaultsize(_:)
framework: SwiftUI
category: Windows
title: defaultSize(_:)
kind: method
captured: 2026-05-02
---

# defaultSize(_:)

Sets a default size for a window.

## Declaration

```swift
nonisolated func defaultSize(_ size: CGSize) -> some Scene

```

### Return Value

A scene that uses a default size for new windows.

### Discussion

Use this scene modifier to indicate a default initial size for a new window that the system creates from a `Scene` declaration. For example, you can request that new windows that a `WindowGroup` generates occupy 600 points in the x-dimension and 400 points in the y-dimension:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(CGSize(width: 600, height: 400))
    }
}
```

The size that you specify acts only as a default for when the window first appears. People can later resize the window using interface controls that the system provides. Also, during state restoration, the system restores windows to their most recent size rather than the default size.

If you specify a default size that’s outside the range of the window’s inherent resizability in one or both dimensions, the system clamps the affected dimension to keep it in range. You can configure the resizability of a scene using the `Scene/windowResizability(_:)` modifier.

The default size modifier affects any scene type that creates windows in macOS, namely:

- `WindowGroup`
- `Window`
- `DocumentGroup`
- `Settings`

If you want to specify the input directly in terms of width and height, use `Scene/defaultSize(width:height:)` instead.

## Parameters

- **size**: The default size for new windows created from a scene.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 13.0
- visionOS 1.0



## See Also

- `Positioning and sizing windows`
- `defaultSize(width:height:)`
- `defaultSize(width:height:depth:)`
- `defaultSize(_:in:)`
- `defaultSize(width:height:depth:in:)`
- `windowResizability(_:)`
- `WindowResizability`
- `windowIdealSize(_:)`
- `WindowIdealSize`
