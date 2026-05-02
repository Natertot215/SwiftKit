---
url: https://developer.apple.com/documentation/appkit/nsspeechsynthesizer
framework: AppKit
category: Sound, speech, and haptics
title: NSSpeechSynthesizer
kind: class
captured: 2026-05-02
---

# NSSpeechSynthesizer

The Cocoa interface to speech synthesis in macOS.

## Declaration

```swift
class NSSpeechSynthesizer
```

### Overview

Speech synthesis, also called text-to-speech (TTS), parses text and converts it into audible speech. It offers a concurrent feedback mode that can be used in concert with or in place of traditional visual and aural notifications. For example, your application can use a speech synthesizer object to “pronounce” the text of important alert dialogs. Synthesized speech has several advantages. It can provide urgent information to users without forcing them to shift attention from their current task. And because speech doesn’t rely on visual elements for meaning, it is a crucial technology for users with vision or attention disabilities.

In addition, synthesized speech can help save system resources. Because sound samples can take up large amounts of room on disk, using text in place of sampled sound is extremely efficient, and so a multimedia application might use an `NSSpeechSynthesizer` object to provide a narration of a QuickTime movie instead of including sampled-sound data on a movie track.

When you create an `NSSpeechSynthesizer` instance using the default initializer (`init`), the class uses the **default voice**default voice selected in System Preferences > Speech. Alternatively, you can select a specific voice for an `NSSpeechSynthesizer` instance by initializing it with `NSSpeechSynthesizer/init(voice:)`. To begin synthesis, send either `NSSpeechSynthesizer/startSpeaking(_:)` or `NSSpeechSynthesizer/startSpeaking(_:to:)` to the instance. The former generates speech through the system’s default sound output device; the latter saves the generated speech to a file. If you wish to be notified when the current speech concludes, set the `NSSpeechSynthesizer/delegate` property and implement the delegate method `NSSpeechSynthesizerDelegate/speechSynthesizer(_:didFinishSpeaking:)`.

Speech synthesis is just one of the macOS speech technologies. The speech recognizer technology allows applications to “listen to” text spoken in U.S. English; the `NSSpeechRecognizer` class is the Cocoa interface to this technology. Both technologies provide benefits for all users, and are particularly useful to those users who have difficulties seeing the screen or using the mouse and keyboard.

#### Speech Feedback Window

The speech feedback window (`/documentation/appkit/nsspeechsynthesizer#1965715`) displays the text recognized from the user’s speech and the text from which an `NSSpeechSynthesizer` object synthesizes speech. Using the feedback window makes spoken exchange more natural and helps the user understand the synthesized speech.

For example, your application may use an `NSSpeechRecognizer` object to listen for the command “Play some music.” When it recognizes this command, your application might then respond by speaking “Which artist?” using a speech synthesizer.

When `UsesFeedbackWindow` is `true`, the speech synthesizer uses the feedback window if its visible, which the user specifies in System Preferences > Speech.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.3 (deprecated 14.0)

## Topics

### Creating a Speech Synthesizer

- `init(voice:)`

### Customizing the Speech Synthesizer Behavior

- `delegate`
- `NSSpeechSynthesizerDelegate`

### Configuring Speech Synthesizers

- `usesFeedbackWindow`
- `voice()`
- `setVoice(_:)`
- `rate`
- `volume`

### Configuring Speech Attributes

- `addSpeechDictionary(_:)`
- `NSSpeechSynthesizer.DictionaryKey`
- `object(forProperty:)`
- `setObject(_:forProperty:)`
- `NSSpeechSynthesizer.SpeechPropertyKey`
- `NSSpeechSynthesizer.SpeechPropertyKey.CommandDelimiterKey`
- `NSSpeechSynthesizer.SpeechPropertyKey.ErrorKey`
- `NSSpeechSynthesizer.SpeechPropertyKey.Mode`
- `NSSpeechSynthesizer.SpeechPropertyKey.PhonemeInfoKey`
- `NSSpeechSynthesizer.SpeechPropertyKey.StatusKey`
- `NSSpeechSynthesizer.SpeechPropertyKey.SynthesizerInfoKey`
- `NSSpeechSynthesizer.VoiceGender`

### Getting Speech Synthesizer Information

- `availableVoices`
- `attributes(forVoice:)`
- `defaultVoice`
- `NSSpeechSynthesizer.VoiceName`
- `NSSpeechSynthesizer.VoiceAttributeKey`

### Getting Speech State

- `isAnyApplicationSpeaking`

### Synthesizing Speech

- `isSpeaking`
- `startSpeaking(_:)`
- `startSpeaking(_:to:)`
- `pauseSpeaking(at:)`
- `continueSpeaking()`
- `stopSpeaking()`
- `stopSpeaking(at:)`
- `NSSpeechSynthesizer.Boundary`

### Getting Phonemes

- `phonemes(from:)`

## See Also

- `NSSpeechRecognizer`
