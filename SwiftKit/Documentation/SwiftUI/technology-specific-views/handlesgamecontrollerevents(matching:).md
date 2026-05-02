---
url: https://developer.apple.com/documentation/swiftui/view/handlesgamecontrollerevents(matching:)
framework: SwiftUI
category: Technology-specific views
title: handlesGameControllerEvents(matching:)
kind: method
captured: 2026-05-02
---

# handlesGameControllerEvents(matching:)

Specifies the game controllers events which should be delivered through the GameController framework when the view, or one of its descendants has focus.

## Declaration

```swift
nonisolated func handlesGameControllerEvents(matching types: GCUIEventTypes) -> some View

```

### Discussion

```swift
SpriteView(scene: MyGameScene())
.handlesGameControllerEvents(matching: .gamepad)
.focused(true)
```







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- visionOS 2.0
