---
url: https://developer.apple.com/documentation/swiftui/view/toolbar(removing:)
framework: SwiftUI
category: Toolbars
title: toolbar(removing:)
kind: method
captured: 2026-05-02
---

# toolbar(removing:)

Remove a toolbar item present by default

## Declaration

```swift
nonisolated func toolbar(removing defaultItemKind: ToolbarDefaultItemKind?) -> some View

```

### Discussion

Use this modifier to remove toolbar items other `View`s add by default. For example, to remove the sidebar toggle toolbar item provided by `NavigationSplitView`:

```swift
NavigationSplitView {
    SidebarView()
        .toolbar(removing: .sidebarToggle)
} detail: {
    DetailView()
}
```

## Parameters

- **defaultItemKind**: The kind of default item to remove





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `ToolbarDefaultItemKind`
