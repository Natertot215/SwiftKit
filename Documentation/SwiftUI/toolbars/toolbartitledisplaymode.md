---
url: https://developer.apple.com/documentation/swiftui/toolbartitledisplaymode
framework: SwiftUI
category: Toolbars
title: ToolbarTitleDisplayMode
kind: struct
captured: 2026-05-02
---

# ToolbarTitleDisplayMode

A type that defines the behavior of title of a toolbar.

## Declaration

```swift
struct ToolbarTitleDisplayMode
```

### Overview

Use the `View/toolbarTitleDisplayMode(_:)` modifier to configure the title display behavior of your toolbar:

```swift
NavigationStack {
    ContentView()
        .toolbarTitleDisplayMode(.inlineLarge)
}
```







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting display modes

- `automatic`
- `inline`
- `inlineLarge`
- `large`

## See Also

- `toolbarTitleDisplayMode(_:)`
