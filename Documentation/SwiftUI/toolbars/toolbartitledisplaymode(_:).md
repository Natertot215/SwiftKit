---
url: https://developer.apple.com/documentation/swiftui/view/toolbartitledisplaymode(_:)
framework: SwiftUI
category: Toolbars
title: toolbarTitleDisplayMode(_:)
kind: method
captured: 2026-05-02
---

# toolbarTitleDisplayMode(_:)

Configures the toolbar title display mode for this view.

## Declaration

```swift
nonisolated func toolbarTitleDisplayMode(_ mode: ToolbarTitleDisplayMode) -> some View

```

### Discussion

Use this modifier to override the default toolbar title display mode.

```swift
NavigationStack {
    ContentView()
        .toolbarTitleDisplayMode(.inlineLarge)
}
```

See `ToolbarTitleDisplayMode` for more information on the different kinds of display modes. This modifier has no effect on macOS.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `ToolbarTitleDisplayMode`
