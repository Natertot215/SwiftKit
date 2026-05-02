---
url: https://developer.apple.com/documentation/swiftui/wknotificationscene
framework: SwiftUI
category: Scenes
title: WKNotificationScene
kind: struct
captured: 2026-05-02
---

# WKNotificationScene

A scene which appears in response to receiving the specified category of remote or local notifications.

## Declaration

```swift
struct WKNotificationScene<Content, Controller> where Content : View, Controller : WKUserNotificationHostingController<Content>
```







## Relationships

**Conforms To**: `Scene`

## Availability

- watchOS 7.0

## Topics

### Creating a notification scene

- `init(controller:category:)`
