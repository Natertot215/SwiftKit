---
url: https://developer.apple.com/documentation/swiftui/scenephase
framework: SwiftUI
category: Scenes
title: ScenePhase
kind: enum
captured: 2026-05-01
---

# ScenePhase

## Declaration

```swift
enum ScenePhase
```

## Abstract

An indication of a scene's operational state.

## Overview

The system moves your app's `Scene` instances through phases that reflect a scene's operational state. You can trigger actions when the phase changes. Read the current phase by observing the `scenePhase` value in the `Environment`:

```swift
@Environment(\.scenePhase) private var scenePhase
```

How you interpret the value depends on where it's read from. If you read the phase from inside a `View` instance, you obtain a value that reflects the phase of the scene that contains the view. The following example uses the `onChange(of:initial:_:)` method to enable a timer whenever the enclosing scene enters the `active` phase and disable the timer when entering any other phase:

```swift
struct MyView: View {
    @ObservedObject var model: DataModel
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        TimerView()
            .onChange(of: scenePhase) {
                model.isTimerRunning = (scenePhase == .active)
            }
    }
}
```

If you read the phase from within an `App` instance, you obtain an aggregate value that reflects the phases of all the scenes in your app. The app reports a value of `active` if any scene is active, or a value of `inactive` when no scenes are active. This includes multiple scene instances created from a single scene declaration; for example, from a `WindowGroup`. When an app enters the `background` phase, expect the app to terminate soon after. You can use that opportunity to free any resources:

```swift
@main
struct MyApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            MyRootView()
        }
        .onChange(of: scenePhase) {
            if scenePhase == .background {
                // Perform cleanup when all scenes within
                // MyApp go to the background.
            }
        }
    }
}
```

## Cases

- **`active`** - The scene is in the foreground and interactive.
- **`inactive`** - The scene is in the foreground but should pause its work.
- **`background`** - The scene isn't currently visible in the UI.

## Availability

- iOS 14.0+
- iPadOS 14.0+
- Mac Catalyst 14.0+
- macOS 11.0+
- tvOS 14.0+
- visionOS 1.0+
- watchOS 7.0+

## Conforms To

- `Comparable`
- `Copyable`
- `Equatable`
- `Escapable`
- `Hashable`
- `Sendable`
- `SendableMetatype`

## See Also

- [Monitoring scene life cycle](doc://com.apple.SwiftUI/documentation/SwiftUI/EnvironmentValues/scenePhase)
