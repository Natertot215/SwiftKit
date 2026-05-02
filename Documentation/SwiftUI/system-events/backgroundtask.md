---
url: https://developer.apple.com/documentation/swiftui/backgroundtask
framework: SwiftUI
category: System events
title: BackgroundTask
kind: struct
captured: 2026-05-02
---

# BackgroundTask

The kinds of background tasks that your app or extension can handle.

## Declaration

```swift
struct BackgroundTask<Request, Response>
```

### Overview

Use a value of this type with the `Scene/backgroundTask(_:action:)` scene modifier to create a handler for background tasks that the system sends to your app or extension. For example, you can use `BackgroundTask/urlSession` to define an asynchronous closure that the system calls when it launches your app or extension to handle a response from a background `URLSession`.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Refreshing the app

- `appRefresh`
- `appRefresh(_:)`

### Preparing for a snapshot

- `snapshot`

### Receiving connectivity updates

- `bluetoothAlert`
- `watchConnectivity`

### Responding to URL sessions

- `urlSession`
- `urlSession(_:)`
- `urlSession(matching:)`

### Updating intents and shortcuts

- `intentDidRun`
- `relevantShortcut`

## See Also

- `backgroundTask(_:action:)`
- `SnapshotData`
- `SnapshotResponse`
