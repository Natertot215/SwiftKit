---
url: https://developer.apple.com/documentation/swiftui/scene
framework: SwiftUI
category: Scenes
title: Scene
kind: protocol
captured: 2026-05-01
---

# Scene Protocol

## Declaration

```swift
@MainActor @preconcurrency protocol Scene
```

## Abstract

A part of an app's user interface with a life cycle managed by the system.

## Overview

You create an `App` by combining one or more instances that conform to the `Scene` protocol in the app's `body`. You can use the built-in scenes that SwiftUI provides, like `WindowGroup`, along with custom scenes that you compose from other scenes. To create a custom scene, declare a type that conforms to the `Scene` protocol. Implement the required `body` computed property and provide the content for your custom scene:

```swift
struct MyScene: Scene {
    var body: some Scene {
        WindowGroup {
            MyRootView()
        }
    }
}
```

A scene acts as a container for a view hierarchy that you want to display to the user. The system decides when and how to present the view hierarchy in the user interface in a way that's platform-appropriate and dependent on the current state of the app. For example, for the window group shown above, the system lets the user create or remove windows that contain `MyRootView` on platforms like macOS and iPadOS. On other platforms, the same view hierarchy might consume the entire display when active.

### Observing Scene State

Read the `scenePhase` environment value from within a scene or one of its views to check whether a scene is active or in some other state. You can create a property that contains the scene phase, which is one of the values in the `ScenePhase` enumeration, using the `Environment` attribute:

```swift
struct MyScene: Scene {
    @Environment(\.scenePhase) private var scenePhase

    // ...
}
```

### Using Scene Modifiers

The `Scene` protocol provides scene modifiers, defined as protocol methods with default implementations, that you use to configure a scene. For example, you can use the `onChange(of:perform:)` modifier to trigger an action when a value changes. The following code empties a cache when all of the scenes in the window group have moved to the background:

```swift
struct MyScene: Scene {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var cache = DataCache()

    var body: some Scene {
        WindowGroup {
            MyRootView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            if newScenePhase == .background {
                cache.empty()
            }
        }
    }
}
```

### Main Actor Isolation

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type's base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it's not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```

## Availability

- iOS 14.0+
- iPadOS 14.0+
- Mac Catalyst 14.0+
- macOS 11.0+
- tvOS 14.0+
- visionOS 1.0+
- watchOS 7.0+

## See Also

- `SceneBuilder` - A result builder for composing a collection of scenes into a single composite scene.
