---
url: https://developer.apple.com/documentation/swiftui/scene/windowtoolbarlabelstyle(_:)
framework: SwiftUI
category: Windows
title: windowToolbarLabelStyle(_:)
kind: method
captured: 2026-05-02
---

# windowToolbarLabelStyle(_:)

Sets the label style of items in a toolbar and enables user customization.

## Declaration

```swift
nonisolated func windowToolbarLabelStyle(_ toolbarLabelStyle: Binding<ToolbarLabelStyle>) -> some Scene

```

### Discussion

Use this modifier to bind a `ToolbarLabelStyle` to `AppStorage`. The toolbar will default to the label style specified but will also be user configurable.

```swift
    @main
    struct MyApp: App {
        @AppStorage("ToolbarLabelStyle")
        private var labelStyle: ToolbarLabelStyle = .iconOnly

        var body: some Scene {
            WindowGroup {
                ContentView()
                    .toolbar(id: "browserToolbar") {
                        ...
                    }
            }
            .windowToolbarLabelStyle($labelStyle)
        }
    }
```

## Parameters

- **toolbarLabelStyle**: The label style to apply.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `windowToolbarStyle(_:)`
- `windowToolbarLabelStyle(fixed:)`
- `WindowToolbarStyle`
