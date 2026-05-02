---
url: https://developer.apple.com/documentation/swiftui/window
framework: SwiftUI
category: Windows
title: Window
kind: struct
captured: 2026-05-01
---

# Window

## Declaration

```swift
struct Window<Content> where Content : View
```

## Abstract

A scene that presents its content in a single, unique window.

## Overview

Use a `Window` scene to augment the main interface of your app with a window that gives people access to supplemental functionality. For example, you can create a secondary window in a mail reader app that enables people to view the status of their account connections:

```swift
@main
struct Mail: App {
    var body: some Scene {
        WindowGroup {
            MailViewer()
        }
        Window("Connection Doctor", id: "connection-doctor") {
            ConnectionDoctor()
        }
    }
}
```

Provide a title as the first argument to the window's initializer. The system uses the title to identify the window to people using your app in the window's title bar or in the list of available singleton windows that the Windows menu displays automatically.

You can override the title in the window's title bar by adding one of the `navigationTitle(_:)` view modifiers to the window's content. This enables you to dynamically update the title bar.

> **Note:** In visionOS, Windows that you create using `Window` don't support the volumetric window style.

## Opening and Closing Windows

### Open a window programmatically

People open the window by selecting it in the Windows menu, but you can also open the window programmatically using the `openWindow` action that you read from the environment:

```swift
struct OpenConnectionDoctorButton: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Button("Connection doctor") {
            openWindow(id: "connection-doctor") // Match the window's identifier.
        }
    }
}
```

If the window is already open when you call this action, the action brings the open window to the front.

### Dismiss a window programmatically

You can close a window programmatically using the `dismiss` action from within the window's view hierarchy:

```swift
struct ConnectionDoctor: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
```

The dismiss action doesn't close the window if you call it from a modal — like a sheet or a popover — that you present from within the window. In that case, the action dismisses the modal presentation instead.

## Using a Window as the Main Scene

You can use a window as the main scene of your app when multi-window functionality isn't appropriate:

```swift
@main
struct VideoCall: App {
    var body: some Scene {
        Window("VideoCall", id: "main") {
            CameraView()
        }
    }
}
```

If your app uses a single window as its primary scene, the app quits when the window closes. This differs from an app using `WindowGroup` as its primary scene, where the app continues to run even after closing all windows.

> **Note:** In most cases it's best to use a `WindowGroup` to represent the main scene of your app. A window group provides multi-window functionality on platforms that support it, like iPadOS and macOS, and makes it easier to share code across platforms.

## Availability

- macOS 13.0+
- visionOS 26.0+

## See Also

- `WindowGroup`
- `UtilityWindow`
- `WindowStyle`
- `Scene.windowStyle(_:)`
