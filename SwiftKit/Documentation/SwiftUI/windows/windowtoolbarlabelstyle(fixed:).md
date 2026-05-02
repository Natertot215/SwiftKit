---
url: https://developer.apple.com/documentation/swiftui/scene/windowtoolbarlabelstyle(fixed:)
framework: SwiftUI
category: Windows
title: windowToolbarLabelStyle(fixed:)
kind: method
captured: 2026-05-02
---

# windowToolbarLabelStyle(fixed:)

Sets the label style of items in a toolbar.

## Declaration

```swift
nonisolated func windowToolbarLabelStyle(fixed: ToolbarLabelStyle) -> some Scene

```

### Discussion

Use this modifier to set a static `ToolbarLabelStyle` the toolbar should use. The style will not be configurable by the user.

```swift
    @main
    struct MyApp: App {
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .toolbar(id: "browserToolbar") {
                        ...
                    }
            }
            .windowToolbarLabelStyle(fixed: .iconOnly)
        }
    }
```

## Parameters

- **fixed**: The toolbar label style to apply.





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
- `windowToolbarLabelStyle(_:)`
- `WindowToolbarStyle`
