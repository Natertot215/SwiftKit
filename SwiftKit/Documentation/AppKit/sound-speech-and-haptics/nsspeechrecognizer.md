---
url: https://developer.apple.com/documentation/appkit/nsspeechrecognizer
framework: AppKit
category: Sound, speech, and haptics
title: NSSpeechRecognizer
kind: class
captured: 2026-05-02
---

# NSSpeechRecognizer

The Cocoa interface to speech recognition in macOS.

## Declaration

```swift
class NSSpeechRecognizer
```

### Overview

`NSSpeechRecognizer` provides a “command and control” style of voice recognition system, where the command phrases must be defined prior to listening, in contrast to a dictation system where the recognized text is unconstrained. Through an `NSSpeechRecognizer` instance, Cocoa apps can use the speech recognition engine built into macOS to recognize spoken commands. With speech recognition, users can accomplish complex tasks with spoken commands—for example, “Move pawn B2 to B4” and “Take back move.”

The `NSSpeechRecognizer` class has a property that lets you specify which spoken words should be recognized as commands (`NSSpeechRecognizer/commands`) and methods that let you start and stop listening (`NSSpeechRecognizer/startListening()` and `NSSpeechRecognizer/stopListening()`). When the speech recognition facility recognizes one of the designated commands, `NSSpeechRecognizer` invokes the delegation method `NSSpeechRecognizerDelegate/speechRecognizer(_:didRecognizeCommand:)`, allowing the delegate to perform the command.

Speech recognition is just one of the macOS speech technologies. The speech synthesis technology allows applications to “pronounce” written text in U.S. English and over 25 other languages, with a number of different voices and dialects for each language  (`NSSpeechSynthesizer` is the Cocoa interface to this technology). Both speech technologies provide benefits for all users, and are particularly useful to those users who have difficulties seeing the screen or using the mouse and keyboard. By incorporating speech into your application, you can provide a concurrent mode of interaction for your users: In macOS, your software can accept input and provide output without requiring users to change their working context.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating Speech Recognizers

- `init()`

### Handling the Recognition of a Spoken Command

- `delegate`
- `NSSpeechRecognizerDelegate`

### Configuring Speech Recognizers

- `commands`
- `displayedCommandsTitle`
- `listensInForegroundOnly`
- `blocksOtherRecognizers`

### Listening

- `startListening()`
- `stopListening()`

## See Also

- `NSSpeechSynthesizer`
