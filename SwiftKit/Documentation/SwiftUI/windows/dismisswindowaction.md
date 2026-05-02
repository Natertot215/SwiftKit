---
url: https://developer.apple.com/documentation/swiftui/dismisswindowaction
framework: SwiftUI
category: Windows
title: DismissWindowAction
kind: struct
captured: 2026-05-02
---

# DismissWindowAction

An action that dismisses a window associated to a particular scene.

## Declaration

```swift
@MainActor @preconcurrency struct DismissWindowAction
```

### Overview

Use the `EnvironmentValues/dismissWindow` environment value to get the instance of this structure for a given `Environment`. Then call the instance to dismiss a window. You call the instance directly because it defines a `DismissWindowAction/callAsFunction(id:)` method that Swift calls when you call the instance.

For example, you can define a button that closes an auxiliary window:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        Window("Auxiliary", id: "auxiliary") {
            AuxiliaryContentView()
        }
        #endif
    }
}

struct DismissWindowButton: View {
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        Button("Close Auxiliary Window") {
            dismissWindow(id: "auxiliary")
        }
    }
}
```

If the window was opened with `EnvironmentValues/pushWindow`, the original presenting will reappear when this action is performed.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0

## Topics

### Calling the action

- `callAsFunction()`
- `callAsFunction(id:)`
- `callAsFunction(id:value:)`
- `callAsFunction(value:)`

## See Also

- `dismissWindow`
- `dismiss`
- `DismissAction`
- `DismissBehavior`
