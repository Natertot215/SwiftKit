---
url: https://developer.apple.com/documentation/swiftui/view/strikethrough(_:pattern:color:)
framework: SwiftUI
category: Text input and output
title: strikethrough(_:pattern:color:)
kind: method
captured: 2026-05-02
---

# strikethrough(_:pattern:color:)

Applies a strikethrough to the text in this view.

## Declaration

```swift
nonisolated func strikethrough(_ isActive: Bool = true, pattern: Text.LineStyle.Pattern = .solid, color: Color? = nil) -> some View

```

### Return Value

A view where text has a line through its center.

## Parameters

- **isActive**: A Boolean value that indicates whether strikethrough is added. The default value is `true`.
- **pattern**: The pattern of the line. The default value is `solid`.
- **color**: The color of the strikethrough. If `color` is `nil`, the strikethrough uses the default foreground color.





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
- `textCase(_:)`
- `textCase`
- `monospaced(_:)`
- `monospacedDigit()`
- `AttributedTextFormattingDefinition`
- `AttributedTextValueConstraint`
- `AttributedTextFormatting`
