---
url: https://developer.apple.com/documentation/swiftui/view/speechalwaysincludespunctuation(_:)
framework: SwiftUI
category: Accessible descriptions
title: speechAlwaysIncludesPunctuation(_:)
kind: method
captured: 2026-05-02
---

# speechAlwaysIncludesPunctuation(_:)

Sets whether VoiceOver should always speak all punctuation in the text view.

## Declaration

```swift
nonisolated func speechAlwaysIncludesPunctuation(_ value: Bool = true) -> some View

```

### Discussion

Use this modifier to control whether the system speaks punctuation characters in the text. You might use this for code or other text where the punctuation is relevant, or where you want VoiceOver to speak a verbatim transcription of the text you provide. For example, given the text:

```swift
Text("All the world's a stage, " +
     "And all the men and women merely players;")
     .speechAlwaysIncludesPunctuation()
```

VoiceOver would speak “All the world apostrophe s a stage comma and all the men and women merely players semicolon”.

By default, VoiceOver voices punctuation based on surrounding context.

## Parameters

- **value**: A Boolean value that you set to `true` if VoiceOver should speak all punctuation in the text. Defaults to `true`.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `speechAdjustedPitch(_:)`
- `speechAnnouncementsQueued(_:)`
- `speechSpellsOutCharacters(_:)`
