---
url: https://developer.apple.com/documentation/swiftui/view/speechadjustedpitch(_:)
framework: SwiftUI
category: Accessible descriptions
title: speechAdjustedPitch(_:)
kind: method
captured: 2026-05-02
---

# speechAdjustedPitch(_:)

Raises or lowers the pitch of spoken text.

## Declaration

```swift
nonisolated func speechAdjustedPitch(_ value: Double) -> some View

```

### Discussion

Use this modifier when you want to change the pitch of spoken text. The value indicates how much higher or lower to change the pitch.

## Parameters

- **value**: The amount to raise or lower the pitch. Values between `-1` and `0` result in a lower pitch while values between `0` and `1` result in a higher pitch. The method clamps values to the range `-1` to `1`.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `speechAlwaysIncludesPunctuation(_:)`
- `speechAnnouncementsQueued(_:)`
- `speechSpellsOutCharacters(_:)`
