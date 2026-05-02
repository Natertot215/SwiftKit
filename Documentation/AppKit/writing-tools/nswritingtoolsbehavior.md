---
url: https://developer.apple.com/documentation/appkit/nswritingtoolsbehavior
framework: AppKit
category: Writing Tools
title: NSWritingToolsBehavior
kind: enum
captured: 2026-05-02
---

# NSWritingToolsBehavior

Constants that specify the Writing Tools experience for the underlying view.

## Declaration

```swift
enum NSWritingToolsBehavior
```

### Overview

Writing Tools provide proofreading and rewriting support for the content of text views. On devices that support Writing Tools features, people engage the system UI to choose how to rewrite all or part of the available text. These constants indicate whether people experience Writing Tools inline with their text, in an overlay panel, or not at all.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 15.0

## Topics

### Getting the Writing Tools behaviors

- `NSWritingToolsBehavior.none`
- `NSWritingToolsBehavior.default`
- `NSWritingToolsBehavior.complete`
- `NSWritingToolsBehavior.limited`

### Initializers

- `init(rawValue:)`

## See Also

- `NSCursor.FrameResizePosition`
- `NSHorizontalDirection`
- `NSSharingCollaborationMode`
- `NSImage.DynamicRange`
- `NSTextCursorAccessoryPlacement`
- `NSVerticalDirection`
- `NSWritingToolsResultOptions`
