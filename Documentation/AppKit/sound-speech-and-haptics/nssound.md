---
url: https://developer.apple.com/documentation/appkit/nssound
framework: AppKit
category: Sound, speech, and haptics
title: NSSound
kind: class
captured: 2026-05-02
---

# NSSound

A simple interface for loading and playing audio files.

## Declaration

```swift
class NSSound
```

### Overview

You create a sound object with an audio file or data, which can be in any format that Core Audio supports. Customize the sound by configuring its properties, such as setting its playback volume and looping behavior. Call the sound’s `NSSound/play()` method to begin playback. The system executes this call asynchronously so that it doesn’t interrupt the functioning of your app.

If you want to play the system beep sound, use the `NSSound/beep()` (Swift) or `NSBeep` (Objective-C) function.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSPasteboardReading`, `NSPasteboardWriting`, `NSSecureCoding`, `Sendable`, `SendableMetatype`, `Transferable`

## Availability

- macOS ?

## Topics

### Detecting When a Sound Finishes Playing

- `delegate`
- `NSSoundDelegate`

### Creating Sounds

- `canInit(with:)`
- `init(contentsOfFile:byReference:)`
- `init(contentsOf:byReference:)`
- `init(data:)`
- `init(pasteboard:)`

### Configuring Sounds

- `name`
- `NSSound.Name`
- `setName(_:)`
- `volume`
- `currentTime`
- `loops`
- `playbackDeviceIdentifier`
- `NSSound.PlaybackDeviceIdentifier`

### Getting Sound Information

- `soundUnfilteredTypes`
- `init(named:)`
- `duration`

### Playing Sounds

- `beep()`
- `isPlaying`
- `pause()`
- `play()`
- `resume()`
- `stop()`

### Writing Sounds

- `write(to:)`

### Constants

- `NSPasteboard Type for Sound Data`

### Initializers

- `init(coder:)`
- `init(contentsOfURL:byReference:)`
- `init(pasteboardPropertyList:ofType:)`
