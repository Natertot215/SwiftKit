---
url: https://developer.apple.com/documentation/swiftui/view/redacted(reason:)
framework: SwiftUI
category: View configuration
title: redacted(reason:)
kind: method
captured: 2026-05-02
---

# redacted(reason:)

Adds a reason to apply a redaction to this view hierarchy.

## Declaration

```swift
nonisolated func redacted(reason: RedactionReasons) -> some View

```

### Discussion

Adding a redaction is an additive process: any redaction provided will be added to the reasons provided by the parent.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `Designing your app for the Always On state`
- `privacySensitive(_:)`
- `unredacted()`
- `redactionReasons`
- `isSceneCaptured`
- `RedactionReasons`
