---
url: https://developer.apple.com/documentation/swiftui/scene/windowidealsize(_:)
framework: SwiftUI
category: Windows
title: windowIdealSize(_:)
kind: method
captured: 2026-05-02
---

# windowIdealSize(_:)

Specifies how windows derived form this scene should determine their size when zooming.

## Declaration

```swift
nonisolated func windowIdealSize(_ idealSize: WindowIdealSize) -> some Scene

```

### Discussion

The default behavior will size the window to its maximum size, or the bounds of the display, whichever is smaller. By overriding this behavior, you can provide a size that is appropriate for the contents of your window.

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

## Parameters

- **idealSize**: A value which determines how windows derived from this scene should size themselves when zooming.





## Availability

- macOS 15.0



## See Also

- `Positioning and sizing windows`
- `defaultSize(_:)`
- `defaultSize(width:height:)`
- `defaultSize(width:height:depth:)`
- `defaultSize(_:in:)`
- `defaultSize(width:height:depth:in:)`
- `windowResizability(_:)`
- `WindowResizability`
- `WindowIdealSize`
