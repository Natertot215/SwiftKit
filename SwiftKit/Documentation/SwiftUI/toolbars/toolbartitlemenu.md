---
url: https://developer.apple.com/documentation/swiftui/toolbartitlemenu
framework: SwiftUI
category: Toolbars
title: ToolbarTitleMenu
kind: struct
captured: 2026-05-02
---

# ToolbarTitleMenu

The title menu of a toolbar.

## Declaration

```swift
struct ToolbarTitleMenu<Content> where Content : View
```

### Overview

A title menu represents common functionality that can be done on the content represented by your app’s toolbar or navigation title. This menu may be populated from your app’s commands like `CommandGroupPlacement/saveItem` or `CommandGroupPlacement/printItem`.

```swift
ContentView()
    .toolbar {
        ToolbarTitleMenu()
    }
```

You can provide your own set of actions to override this behavior.

```swift
ContentView()
    .toolbar {
        ToolbarTitleMenu {
            DuplicateButton()
            PrintButton()
        }
    }
```

In iOS and iPadOS, this will construct a menu that can be presented by tapping the navigation title in the app’s navigation bar.





## Relationships

**Conforms To**: `CustomizableToolbarContent`, `ToolbarContent`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a toolbar title menu

- `init()`
- `init(content:)`

## See Also

- `toolbarTitleMenu(content:)`
