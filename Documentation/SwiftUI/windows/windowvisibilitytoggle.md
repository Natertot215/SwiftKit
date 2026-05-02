---
url: https://developer.apple.com/documentation/swiftui/windowvisibilitytoggle
framework: SwiftUI
category: Windows
title: WindowVisibilityToggle
kind: struct
captured: 2026-05-02
---

# WindowVisibilityToggle

A specialized button for toggling the visibility of a window.

## Declaration

```swift
struct WindowVisibilityToggle<Label> where Label : View
```

### Overview

This is most commonly used in the main menu, where it can toggle the visibility of `Window` and `UtilityWindow` windows. The default label uses the title of the window in the format of “Show ” and “Hide ” depending on the current visibility of the window.

A keyboard shortcut can be assigned to this button.

The below example demonstrates how a main menu can be constructed with visibility buttons, replacing the default commands added by `Window` and `Utility Window`:

```swift
 struct PhotoEditor: App {
     var body: some Scene {
         WindowGroup {
             PhotoEditor()
         }
         .commands {
            CommandGroup(before: .textFormatting) {
                Section {
                    WindowVisibilityToggle(windowID: "formatting")
                        .keyboardShortcut("t", modifiers: [.command, .shift])

                    // other custom/image formatting controls
                }
            }
            CommandGroup(before: .sidebar) {
                Section {
                    WindowVisibilityToggle(windowID: "photo-library")

                    // other controls for showing/hiding UI
                }
            }
         }

         UtilityWindow("Formatting Style", id: "formatting") {
             TextAndImageFormatForm()
         }
         .commandsRemoved()

         Window("Photo Library", id: "photo-library") {
             PhotoInfoViewer()
         }
         .commandsRemoved()
     }
 }
```





## Relationships

**Conforms To**: `View`

## Availability

- macOS 15.0

## Topics

### Creating a window visibility toggle

- `init(windowID:)`

### Supporting types

- `DefaultWindowVisibilityToggleLabel`

## See Also

- `defaultLaunchBehavior(_:)`
- `restorationBehavior(_:)`
- `SceneLaunchBehavior`
- `SceneRestorationBehavior`
- `persistentSystemOverlays(_:)`
- `windowToolbarFullScreenVisibility(_:)`
- `WindowToolbarFullScreenVisibility`
