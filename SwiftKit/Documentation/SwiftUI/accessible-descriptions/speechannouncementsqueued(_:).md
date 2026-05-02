---
url: https://developer.apple.com/documentation/swiftui/view/speechannouncementsqueued(_:)
framework: SwiftUI
category: Accessible descriptions
title: speechAnnouncementsQueued(_:)
kind: method
captured: 2026-05-02
---

# speechAnnouncementsQueued(_:)

Controls whether to queue pending announcements behind existing speech rather than interrupting speech in progress.

## Declaration

```swift
nonisolated func speechAnnouncementsQueued(_ value: Bool = true) -> some View

```

### Discussion

Use this modifier when you want affect the order in which the accessibility system delivers spoken text. Announcements can occur automatically when the label or value of an accessibility element changes.

## Parameters

- **value**: A Boolean value that determines if VoiceOver speaks changes to text immediately or enqueues them behind existing speech. Defaults to `true`.





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
- `speechAlwaysIncludesPunctuation(_:)`
- `speechSpellsOutCharacters(_:)`
