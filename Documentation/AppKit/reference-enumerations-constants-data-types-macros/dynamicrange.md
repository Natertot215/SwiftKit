---
url: https://developer.apple.com/documentation/appkit/nsimage/dynamicrange
framework: AppKit
category: Reference (enumerations, constants, data types, macros)
title: NSImage.DynamicRange
kind: enum
captured: 2026-05-02
---

# NSImage.DynamicRange

Describes how High Dynamic Range (HDR) image content displays.

## Declaration

```swift
enum DynamicRange
```

### Overview

Use this type to enable or constrain the display of High Dynamic Range (HDR) in an `NSImageView`. Displaying HDR content in an `NSImageView` requires that the `NSImage` has HDR content in the ITU-R 2100 color space and that the output device has Extended Dynamic Range (EDR) capabilities.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 14.0

## Topics

### Setting the dynamic range

- `NSImage.DynamicRange.standard`
- `NSImage.DynamicRange.constrainedHigh`
- `NSImage.DynamicRange.high`
- `NSImage.DynamicRange.unspecified`

### Initializers

- `init(rawValue:)`

## See Also

- `NSCursor.FrameResizePosition`
- `NSHorizontalDirection`
- `NSSharingCollaborationMode`
- `NSTextCursorAccessoryPlacement`
- `NSVerticalDirection`
- `NSWritingToolsBehavior`
- `NSWritingToolsResultOptions`
