---
url: https://developer.apple.com/documentation/swiftui/settingslink
framework: SwiftUI
category: Scenes
title: SettingsLink
kind: struct
captured: 2026-05-02
---

# SettingsLink

A view that opens the Settings scene defined by an app.

## Declaration

```swift
struct SettingsLink<Label> where Label : View
```

### Overview

On macOS, clicking on the link opens the window for the scene or orders it to the front if it is already open.





## Relationships

**Conforms To**: `View`

## Availability

- macOS 14.0

## Topics

### Creating a settings link

- `init()`
- `init(label:)`

### Supporting types

- `DefaultSettingsLinkLabel`

## See Also

- `Settings`
- `OpenSettingsAction`
- `openSettings`
