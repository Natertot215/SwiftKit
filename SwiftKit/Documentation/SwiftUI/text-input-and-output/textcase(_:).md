---
url: https://developer.apple.com/documentation/swiftui/view/textcase(_:)
framework: SwiftUI
category: Text input and output
title: textCase(_:)
kind: method
captured: 2026-05-02
---

# textCase(_:)

Sets a transform for the case of the text contained in this view when displayed.

## Declaration

```swift
nonisolated func textCase(_ textCase: Text.Case?) -> some View

```

### Return Value

A view that transforms the case of the text.

### Discussion

The default value is `nil`, displaying the text without any case changes.

## Parameters

- **textCase**: One of the `Text/Case` enumerations; the default is `nil`.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `bold(_:)`
- `italic(_:)`
- `underline(_:pattern:color:)`
- `strikethrough(_:pattern:color:)`
- `textCase`
- `monospaced(_:)`
- `monospacedDigit()`
- `AttributedTextFormattingDefinition`
- `AttributedTextValueConstraint`
- `AttributedTextFormatting`
