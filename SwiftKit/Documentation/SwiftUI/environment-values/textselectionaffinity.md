---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/textselectionaffinity
framework: SwiftUI
category: Environment values
title: textSelectionAffinity
kind: property
captured: 2026-05-02
---

# textSelectionAffinity

A representation of the direction or association of a selection or cursor relative to a text character. This concept becomes much more prominent when dealing with bidirectional text (text that contains both LTR and RTL scripts, like English and Arabic combined).

## Declaration

```swift
var textSelectionAffinity: TextSelectionAffinity { get set }
```

### Discussion

You can configure the selection affinity on a given hierarchy by using the `View/textSelectionAffinity(_:)` modifier.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `textSelection(_:)`
- `TextSelectability`
- `TextSelection`
- `textSelectionAffinity(_:)`
- `TextSelectionAffinity`
- `AttributedTextSelection`
