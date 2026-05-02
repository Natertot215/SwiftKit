---
url: https://developer.apple.com/documentation/appkit/nsuserinterfacecompressionoptions
framework: AppKit
category: Touch Bar
title: NSUserInterfaceCompressionOptions
kind: class
captured: 2026-05-02
---

# NSUserInterfaceCompressionOptions

An object that specifies how user interface elements resize themselves when space is constrained.

## Declaration

```swift
class NSUserInterfaceCompressionOptions
```

### Overview

An instance of `NSUserInterfaceCompressionOptions` contains zero or more options. Because a compression options object behaves like a set, you can use common operations like intersection, union and subtraction to interact with instances and their members.

You can access system-defined options through the class methods detailed in Creating standard options, or you can create your own custom options with the `NSUserInterfaceCompressionOptions/init(identifier:)` initializer.

To compare two different compression options objects, use the methods described in the Comparing compression options section.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.13

## Topics

### Creating a compression option

- `init()`
- `init(options:)`
- `init(identifier:)`
- `init(coder:)`

### Creating standard options

- `hideImages`
- `hideText`
- `reduceMetrics`
- `breakEqualWidths`
- `standardOptions`

### Comparing compression options

- `isEmpty`
- `contains(_:)`
- `intersects(_:)`

### Combining compression options

- `union(_:)`
- `subtracting(_:)`

### Initializers

- `init(compressionOptions:)`

## See Also

- `NSTouchBarItem`
- `NSCandidateListTouchBarItem`
- `NSColorPickerTouchBarItem`
- `NSCustomTouchBarItem`
- `NSGroupTouchBarItem`
- `NSPopoverTouchBarItem`
- `NSSharingServicePickerTouchBarItem`
- `NSSliderTouchBarItem`
- `NSStepperTouchBarItem`
- `NSButtonTouchBarItem`
- `NSPickerTouchBarItem`
- `NSPickerTouchBarItem.ControlRepresentation`
- `NSPickerTouchBarItem.SelectionMode`
