---
url: https://developer.apple.com/documentation/swiftui/menubutton
framework: SwiftUI
category: Menus and commands
title: MenuButton
kind: struct
captured: 2026-05-02
---

# MenuButton

A button that displays a menu containing a list of choices when pressed.

## Declaration

```swift
struct MenuButton<Label, Content> where Label : View, Content : View
```







## Relationships

**Conforms To**: `View`

## Availability

- macOS 10.15 (deprecated 26.5)

## Topics

### Creating a menu button

- `init(_:content:)`
- `init(label:content:)`

### Styling a menu button

- `menuButtonStyle(_:)`
- `MenuButtonStyle`

## See Also

- `PullDownButton`
- `ContextMenu`
