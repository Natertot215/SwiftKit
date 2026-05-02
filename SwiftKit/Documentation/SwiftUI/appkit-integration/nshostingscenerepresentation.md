---
url: https://developer.apple.com/documentation/swiftui/nshostingscenerepresentation
framework: SwiftUI
category: AppKit integration
title: NSHostingSceneRepresentation
kind: class
captured: 2026-05-02
---

# NSHostingSceneRepresentation

An AppKit type that hosts and can present SwiftUI scenes

## Declaration

```swift
@MainActor class NSHostingSceneRepresentation<Content> where Content : Scene
```

### Overview

Use instances of this type with `NSApplication.addSceneRepresentation(_:)` to include SwiftUI scene functionality in an app which uses the AppKit app lifecycle.

For example, you can add a `Settings` scene to your app and present it when the corresponding menu item is selected:

```swift
import AppKit
import SwiftUI

@main
class ApplicationDelegate: NSApplicationDelegate {
    let settingsScene = NSHostingSceneRepresentation {
        Settings {
            SettingsView()
        }
    }

    func applicationWillFinishLaunching(_ notification: Notification) {
        NSApplication.shared.addSceneRepresentation(settingsScene)
    }

    @IBAction func showAppSettings(_ sender: NSMenuItem) {
        settingsScene.environment.openSettings()
    }
}
```







## Availability

- macOS 26.0

## Topics

### Initializers

- `init(rootScene:)`

### Instance Properties

- `environment`

## See Also

- `Unifying your app’s animations`
- `NSHostingController`
- `NSHostingView`
- `NSHostingMenu`
- `NSHostingSizingOptions`
- `NSHostingSceneBridgingOptions`
