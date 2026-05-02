---
url: https://developer.apple.com/documentation/swiftui/toolbarrole
framework: SwiftUI
category: Toolbars
title: ToolbarRole
kind: struct
captured: 2026-05-02
---

# ToolbarRole

The purpose of content that populates the toolbar.

## Declaration

```swift
struct ToolbarRole
```

### Overview

A toolbar role provides a description of the purpose of content that populates the toolbar. The purpose of the content influences how a toolbar renders its content. For example, a `ToolbarRole/browser` will automatically leading align the title of a toolbar in iPadOS.

Provide this type to the `View/toolbarRole(_:)` modifier:

```swift
ContentView()
    .navigationTitle("Browser")
    .toolbarRole(.browser)
    .toolbar {
        ToolbarItem(placement: .primaryAction) {
            AddButton()
        }
     }
```





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Behavior-specific roles

- `browser`
- `editor`
- `navigationStack`

### Automatic roles

- `automatic`

## See Also

- `toolbarRole(_:)`
