---
url: https://developer.apple.com/documentation/swiftui/windowgroup
framework: SwiftUI
category: Scenes
title: WindowGroup
kind: struct
captured: 2026-05-01
---

# WindowGroup

A scene that presents a group of identically structured windows.

## Declaration

```swift
struct WindowGroup<Content> where Content : View
```

## Abstract

Use a `WindowGroup` as a container for a view hierarchy that your app presents. The hierarchy that you declare as the group's content serves as a template for each window that the app creates from that group.

## Overview

SwiftUI takes care of certain platform-specific behaviors. For example, on platforms that support it, like macOS and iPadOS, people can open more than one window from the group simultaneously. In macOS, people can gather open windows together in a tabbed interface. Also in macOS, window groups automatically provide commands for standard window management.

### Basic Example

```swift
@main
struct Mail: App {
    var body: some Scene {
        WindowGroup {
            MailViewer() // Define a view hierarchy for the window.
        }
    }
}
```

### Important Notes

- **Independent State**: Every window in the group maintains independent state. The system allocates new storage for any `State` or `StateObject` variables instantiated by the scene's view hierarchy for each window that it creates.

- **iPadOS Multi-Window Support**: To enable an iPadOS app to simultaneously display multiple windows, include the `UIApplicationSupportsMultipleScenes` key with a value of `true` in the `UIApplicationSceneManifest` dictionary of your app's Information Property List.

- **Document-Based Apps**: For document-based apps, use `DocumentGroup` to define windows instead.

## Opening Windows Programmatically

If you initialize a window group with an identifier, a presentation type, or both, you can programmatically open a window from the group:

```swift
WindowGroup(id: "mail-viewer") {
    MailViewer()
}
```

Use the `openWindow` environment action to create a new window:

```swift
struct NewViewerButton: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Button("Open new mail viewer") {
            openWindow(id: "mail-viewer")
        }
    }
}
```

## Presenting Data in a Window

Initialize a window group with a presentation type to pass data when opening a window:

```swift
@main
struct Mail: App {
    var body: some Scene {
        WindowGroup {
            MailViewer(id: "mail-viewer")
        }

        WindowGroup(for: Message.ID.self) { $messageID in
            MessageDetail(messageID: messageID)
        }
    }
}
```

Open a window with data:

```swift
struct NewMessageButton: View {
    var message: Message
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Button("Open message") {
            openWindow(value: message.id)
        }
    }
}
```

**Requirements**: The type you present must conform to both `Hashable` and `Codable` protocols. Prefer lightweight data for the presentation value—identifiers of model values work well.

### Default Values

If SwiftUI doesn't have a value to provide (e.g., when opening a window via File > New Window), it passes a binding to `nil`. Optionally specify a default value:

```swift
WindowGroup(for: Message.ID.self) { $messageID in
    MessageDetail(messageID: messageID)
} defaultValue: {
    model.makeNewMessage().id
}
```

## Titling Windows

Include a title as the first parameter to help people distinguish windows:

```swift
WindowGroup("Message", for: Message.ID.self) { $messageID in
    MessageDetail(messageID: messageID)
}
```

SwiftUI uses this title in:
- The File > New menu list
- The window's title bar
- The Window menu's list of open windows

**Customization**: Override the title using the `navigationTitle(_:)` modifier on the window's content for dynamic, per-window customization.

## Distinguishing Windows with Like Data

When using the same type (e.g., `UUID`) for multiple window groups, add the `id` parameter:

```swift
WindowGroup("Message", id: "message", for: UUID.self) { $uuid in
    MessageDetail(uuid: uuid)
}
WindowGroup("Account", id: "account-info", for: UUID.self) { $uuid in
    AccountDetail(uuid: uuid)
}
```

Open windows using both identifier and value:

```swift
struct ActionButtons: View {
    var messageID: UUID
    var accountID: UUID

    @Environment(\.openWindow) private var openWindow

    var body: some View {
        HStack {
            Button("Open message") {
                openWindow(id: "message", value: messageID)
            }
            Button("Edit account information") {
                openWindow(id: "account-info", value: accountID)
            }
        }
    }
}
```

## Dismissing Windows Programmatically

Use the `dismiss` environment action to dismiss windows:

```swift
struct AccountDetail: View {
    var uuid: UUID?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            // ...

            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
```

**Note**: The dismiss action only closes windows, not modals (sheets, popovers) presented from windows.

## Availability

| Platform | Version |
|----------|---------|
| iOS | 14.0+ |
| iPadOS | 14.0+ |
| Mac Catalyst | 14.0+ |
| macOS | 11.0+ |
| tvOS | 14.0+ |
| visionOS | 1.0+ |
| watchOS | 7.0+ |

## See Also

- `Window` – A scene that presents content in a single, unique window
- `UtilityWindow` – A specialized window for secondary utility
- `WindowStyle` – A specification for window appearance and interaction
- `DocumentGroup` – A scene for document-based apps
- `Scene.windowStyle(_:)` – Sets the style for windows created by a scene
