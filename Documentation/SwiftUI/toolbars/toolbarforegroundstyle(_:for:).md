---
url: https://developer.apple.com/documentation/swiftui/view/toolbarforegroundstyle(_:for:)
framework: SwiftUI
category: Toolbars
title: toolbarForegroundStyle(_:for:)
kind: method
captured: 2026-05-02
---

# toolbarForegroundStyle(_:for:)

Specifies the preferred foreground style of bars managed by SwiftUI.

## Declaration

```swift
nonisolated func toolbarForegroundStyle<S>(_ style: S, for bars: ToolbarPlacement...) -> some View where S : ShapeStyle

```

### Discussion

This examples shows a view that renders the navigation bar with a blue foreground color.

```swift
NavigationStack {
    ContentView()
        .navigationTitle("Blue")
        .toolbarForegroundStyle(
            .blue, for: .navigationBar)
}
```







## Availability

- watchOS 9.0



## See Also

- `toolbarBackground(_:for:)`
- `toolbarColorScheme(_:for:)`
- `windowToolbarStyle(_:)`
- `WindowToolbarStyle`
- `toolbarLabelStyle`
- `ToolbarLabelStyle`
- `SpacerSizing`
