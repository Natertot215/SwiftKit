---
url: https://developer.apple.com/documentation/swiftui/dismissimmersivespaceaction
framework: SwiftUI
category: Immersive spaces
title: DismissImmersiveSpaceAction
kind: struct
captured: 2026-05-02
---

# DismissImmersiveSpaceAction

An action that dismisses an immersive space.

## Declaration

```swift
@MainActor struct DismissImmersiveSpaceAction
```

### Overview

Use the `EnvironmentValues/dismissImmersiveSpace` environment value to get an instance of this type for a given `Environment`. Then call the instance to dismiss a space. You call the instance directly because it defines a `DismissImmersiveSpaceAction/callAsFunction()` method that Swift calls when you call the instance.

On macOS, this may be used to dismiss a remote immersive space declared with `RemoteImmersiveSpace`.

For example, you can define a button that dismisses an immersive space:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            DismissImmersiveSpaceButton()
        }
        ImmersiveSpace(id: "solarSystem") {
            SolarSystemView()
        }
    }
}

struct DismissImmersiveSpaceButton: View {
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    var body: some View {
        Button("Dismiss") {
            Task {
                await dismissImmersiveSpace()
            }
        }
    }
}
```

The asynchronous call returns after the system finishes dismissing the space. Unlike the call to `EnvironmentValues/openImmersiveSpace` that you use to open the space — which requires an identifier, a value, or both to specify which space to open — the dismiss action requires no parameters because there can be only one immersive space open at a time. The call closes the space that is currently open, if any.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- macOS 26.0
- visionOS 1.0

## Topics

### Calling the action

- `callAsFunction()`

## See Also

- `dismissImmersiveSpace`
