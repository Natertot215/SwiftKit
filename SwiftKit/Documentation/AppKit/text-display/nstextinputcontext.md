---
url: https://developer.apple.com/documentation/appkit/nstextinputcontext
framework: AppKit
category: Text display
title: NSTextInputContext
kind: class
captured: 2026-05-02
---

# NSTextInputContext

An object that represents the Cocoa text input system.

## Declaration

```swift
class NSTextInputContext
```

### Overview

The text input system communicates primarily with the client of the activated input context via the `NSTextInputClient` protocol.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.6

## Topics

### Creating an Input Context

- `init(client:)`

### Getting the Input Context and Client

- `current`
- `client`

### Configuring the Input Context

- `acceptsGlyphInfo`
- `allowedInputSourceLocales`

### Activating the Input Context

- `activate()`
- `deactivate()`

### Handling Input Sources

- `handleEvent(_:)`
- `discardMarkedText()`
- `invalidateCharacterCoordinates()`
- `keyboardInputSources`
- `selectedKeyboardInputSource`
- `localizedName(forInputSource:)`
- `NSTextInputSourceIdentifier`

### Notifications

- `keyboardSelectionDidChangeNotification`

### Instance Methods

- `textInputClientDidEndScrollingOrZooming()`
- `textInputClientWillStartScrollingOrZooming()`
- `textInputClientDidScroll()`
- `textInputClientDidUpdateSelection()`

## See Also

- `Adopting the system text cursor in custom text views`
- `NSTextInputClient`
- `NSTextAlternatives`
- `NSTextContent`
- `NSTextInsertionIndicator`
- `NSTextInsertionIndicator.DisplayMode`
- `NSTextInsertionIndicator.AutomaticModeOptions`
