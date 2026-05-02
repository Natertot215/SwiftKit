---
url: https://developer.apple.com/documentation/swiftui/view/underline(_:pattern:color:)
framework: SwiftUI
category: Text input and output
title: underline(_:pattern:color:)
kind: method
captured: 2026-05-02
---

# underline(_:pattern:color:)

Applies an underline to the text in this view.

## Declaration

```swift
nonisolated func underline(_ isActive: Bool = true, pattern: Text.LineStyle.Pattern = .solid, color: Color? = nil) -> some View

```

### Return Value

A view where text has a line running along its baseline.

## Parameters

- **isActive**: A Boolean value that indicates whether underline is added. The default value is `true`.
- **pattern**: The pattern of the line. The default value is `solid`.
- **color**: The color of the underline. If `color` is `nil`, the underline uses the default foreground color.





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
- `strikethrough(_:pattern:color:)`
- `textCase(_:)`
- `textCase`
- `monospaced(_:)`
- `monospacedDigit()`
- `AttributedTextFormattingDefinition`
- `AttributedTextValueConstraint`
- `AttributedTextFormatting`
