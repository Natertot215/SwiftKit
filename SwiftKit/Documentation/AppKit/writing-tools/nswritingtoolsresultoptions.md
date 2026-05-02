---
url: https://developer.apple.com/documentation/appkit/nswritingtoolsresultoptions
framework: AppKit
category: Writing Tools
title: NSWritingToolsResultOptions
kind: struct
captured: 2026-05-02
---

# NSWritingToolsResultOptions

Constants to specify what type of content to allow in Writing Tools suggestions or rewrites.

## Declaration

```swift
struct NSWritingToolsResultOptions
```

### Overview

When configuring a text view, specify what type of text input you want Writing Tools to deliver to your view. You can ask it to return plain text without any attributes, or you can ask it to apply relevant formatting attributes to the text. You can even encourage it to return items in a list or format them in a table.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `ExpressibleByArrayLiteral`, `OptionSet`, `RawRepresentable`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- macOS 15.0

## Topics

### Getting the output options

- `plainText`
- `richText`
- `list`
- `table`

### Initializers

- `init(rawValue:)`

### Type Properties

- `presentationIntent`

## See Also

- `NSCursor.FrameResizePosition`
- `NSHorizontalDirection`
- `NSSharingCollaborationMode`
- `NSImage.DynamicRange`
- `NSTextCursorAccessoryPlacement`
- `NSVerticalDirection`
- `NSWritingToolsBehavior`
