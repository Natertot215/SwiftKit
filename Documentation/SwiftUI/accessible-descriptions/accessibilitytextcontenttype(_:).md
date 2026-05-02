---
url: https://developer.apple.com/documentation/swiftui/view/accessibilitytextcontenttype(_:)
framework: SwiftUI
category: Accessible descriptions
title: accessibilityTextContentType(_:)
kind: method
captured: 2026-05-02
---

# accessibilityTextContentType(_:)

Sets an accessibility text content type.

## Declaration

```swift
nonisolated func accessibilityTextContentType(_ value: AccessibilityTextContentType) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Use this modifier to set the content type of this accessibility element. Assistive technologies can use this property to choose an appropriate way to output the text. For example, when encountering a source coding context, VoiceOver could choose to speak all punctuation.

The default content type `AccessibilityTextContentType/plain`.

## Parameters

- **value**: The accessibility content type from the available `AccessibilityTextContentType` options.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `accessibilityHeading(_:)`
- `AccessibilityHeadingLevel`
- `AccessibilityTextContentType`
