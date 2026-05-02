---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityheading(_:)
framework: SwiftUI
category: Accessible descriptions
title: accessibilityHeading(_:)
kind: method
captured: 2026-05-02
---

# accessibilityHeading(_:)

Sets the accessibility level of this heading.

## Declaration

```swift
nonisolated func accessibilityHeading(_ level: AccessibilityHeadingLevel) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Use this modifier to set the level of this heading in relation to other headings. The system speaks the level number of levels `AccessibilityHeadingLevel/h1` through `AccessibilityHeadingLevel/h6` alongside the text.

The default heading level if you don’t use this modifier is `AccessibilityHeadingLevel/unspecified`.

## Parameters

- **level**: The heading level to associate with this element from the available `AccessibilityHeadingLevel` levels.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `accessibilityTextContentType(_:)`
- `AccessibilityHeadingLevel`
- `AccessibilityTextContentType`
