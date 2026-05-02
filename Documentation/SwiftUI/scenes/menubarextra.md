---
url: https://developer.apple.com/documentation/swiftui/menubarextra
framework: SwiftUI
category: Scenes
title: MenuBarExtra
kind: struct
captured: 2026-05-02
---

# MenuBarExtra

**Structure** | **macOS 13.0+**

A scene that renders itself as a persistent control in the system menu bar.

## Overview

Use a `MenuBarExtra` when you want to provide access to commonly used functionality, even when your app is not active.

### Example: App with Menu Bar Extra

```swift
@main
struct AppWithMenuBarExtra: App {
    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        MenuBarExtra(
            "App Menu Bar Extra", systemImage: "star",
            isInserted: $showMenuBarExtra)
        {
            StatusMenu()
        }
    }
}
```

### Example: Utility App (Menu Bar Only)

Alternatively, create a utility app that only shows in the menu bar:

```swift
@main
struct UtilityApp: App {
    var body: some Scene {
        MenuBarExtra("Utility App", systemImage: "hammer") {
            AppMenu()
        }
    }
}
```

An app that only shows in the menu bar will be automatically terminated if the user removes the extra from the menu bar.

### Configuration for Menu Bar-Only Apps

For apps that only show in the menu bar, a common behavior is to hide the app icon from both the Dock and the application switcher. To enable this, set the `LSUIElement` flag in your app's Information Property List file to `true`.

### Window Style for Complex Menu Bar Extras

For more complex or data rich menu bar extras, use the `.window` style, which displays a popover-like window from the menu bar icon containing standard controls:

```swift
MenuBarExtra("Utility App", systemImage: "hammer") {
    ScrollView {
        LazyVGrid(...)
    }
}
.menuBarExtraStyle(.window)
```

## Declaration

```swift
struct MenuBarExtra<Label, Content> where
    Label : View,
    Content : View
```

## Creating a Menu Bar Extra

- `init(_:content:)` — Creates a menu bar extra with a localized string label that defines the primary scene of an App
- `init(content:label:)` — Creates a menu bar extra with custom label and content views that defines the primary scene of an App
- `init(_:isInserted:content:)` — Creates a menu bar extra with a localized string label, conditionally displayed based on a binding
- `init(isInserted:content:label:)` — Creates a menu bar extra with custom label and content, conditionally displayed based on a binding

## Creating a Menu Bar Extra with an Image

- `init(_:image:content:)` — Creates a menu bar extra with a custom image label
- `init(_:image:isInserted:content:)` — Creates a menu bar extra with a custom image label, conditionally displayed based on a binding
- `init(_:systemImage:content:)` — Creates a menu bar extra with a system image label
- `init(_:systemImage:isInserted:content:)` — Creates a menu bar extra with a system image label, conditionally displayed based on a binding

## Conformance

- Conforms to `Scene`

## See Also

- `Scene.menuBarExtraStyle(_:)` — Sets the style for menu bar extras created by a scene
- `MenuBarExtraStyle` — A specification for the appearance and behavior of a menu bar extra scene
