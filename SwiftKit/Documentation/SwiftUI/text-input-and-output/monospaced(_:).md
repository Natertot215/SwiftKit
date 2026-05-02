---
url: https://developer.apple.com/documentation/swiftui/view/monospaced(_:)
framework: SwiftUI
category: Text input and output
title: monospaced(_:)
kind: method
captured: 2026-05-02
---

# monospaced(_:)

Modifies the fonts of all child views to use the fixed-width variant of the current font, if possible.

## Declaration

```swift
nonisolated func monospaced(_ isActive: Bool = true) -> some View

```

### Return Value

A view whose child views’ fonts use fixed-width characters, while leaving other characters proportionally spaced.

### Discussion

If a child view’s base font doesn’t support fixed-width, the font remains unchanged.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `bold(_:)`
- `italic(_:)`
- `underline(_:pattern:color:)`
- `strikethrough(_:pattern:color:)`
- `textCase(_:)`
- `textCase`
- `monospacedDigit()`
- `AttributedTextFormattingDefinition`
- `AttributedTextValueConstraint`
- `AttributedTextFormatting`
