---
url: https://developer.apple.com/documentation/swiftui/view/toolbar(_:for:)
framework: SwiftUI
category: Toolbars
title: toolbar(_:for:)
kind: method
captured: 2026-05-02
---

# toolbar(_:for:)

Specifies the visibility of a bar managed by SwiftUI.

## Declaration

```swift
nonisolated func toolbar(_ visibility: Visibility, for bars: ToolbarPlacement...) -> some View

```

### Discussion

The preferred visibility flows up to the nearest container that renders a bar. This could be a `NavigationView` or `TabView` in iOS, or the root view of a `WindowGroup` in macOS.

This examples shows a view that hides the navigation bar on iOS, or the window toolbar items on macOS.

```swift
NavigationView {
    ContentView()
        .toolbar(.hidden)
}
```

To hide the entire titlebar on macOS, use this modifier with `ToolbarPlacement/windowToolbar` placement.

```swift
NavigationView {
    ContentView()
        .toolbar(.hidden, for: .windowToolbar)
}
```

You can provide multiple `ToolbarPlacement` instances to hide multiple bars at once.

```swift
TabView {
    NavigationView {
        ContentView()
            .toolbar(
                .hidden, for: .navigationBar, .tabBar)
    }
}
```

> **NOTE:** In macOS, if you provide `ToolbarCommands` to the scene of your app, this modifier disables the toolbar visibility command while the value of the modifier is not `ToolbarPlacement/automatic`.

Depending on the specified bars, the requested visibility may not be able to be fulfilled.

## Parameters

- **visibility**: The preferred visibility of the bar.
- **bars**: The bars to update the visibility of or `ToolbarPlacement/automatic` if empty.





## Availability

- iOS 16.0 (deprecated 26.5)
- iPadOS 16.0 (deprecated 26.5)
- Mac Catalyst 16.0 (deprecated 26.5)
- macOS 13.0 (deprecated 26.5)
- tvOS 16.0 (deprecated 26.5)
- visionOS 1.0
- watchOS 9.0 (deprecated 26.5)



## See Also

- `toolbarVisibility(_:for:)`
- `toolbarBackgroundVisibility(_:for:)`
- `ToolbarPlacement`
- `ContentToolbarPlacement`
