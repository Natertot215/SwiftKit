---
url: https://developer.apple.com/documentation/swiftui/toolbarcontent
framework: SwiftUI
category: Toolbars
title: ToolbarContent
kind: protocol
captured: 2026-05-02
---

# ToolbarContent

Conforming types represent items that can be placed in various locations in a toolbar.

## Declaration

```swift
@MainActor @preconcurrency protocol ToolbarContent
```

### Overview

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Inherited By**: `CustomizableToolbarContent`

**Conforming Types**: `DefaultToolbarItem`, `Group`, `ToolbarItem`, `ToolbarItemGroup`, `ToolbarSpacer`, `ToolbarTitleMenu`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Implementing toolbar content

- `body`
- `Body`

### Instance Methods

- `hidden(_:)`
- `matchedTransitionSource(id:in:)`
- `sharedBackgroundVisibility(_:)`

## See Also

- `toolbar(content:)`
- `ToolbarItem`
- `ToolbarItemGroup`
- `ToolbarItemPlacement`
- `ToolbarContentBuilder`
- `ToolbarSpacer`
- `DefaultToolbarItem`
