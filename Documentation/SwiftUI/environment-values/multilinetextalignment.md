---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/multilinetextalignment
framework: SwiftUI
category: Environment values
title: multilineTextAlignment
kind: property
captured: 2026-05-02
---

# multilineTextAlignment

An environment value that indicates how a text view aligns its lines when the content wraps or contains newlines.

## Declaration

```swift
var multilineTextAlignment: TextAlignment { get set }
```

### Discussion

Set this value for a view hierarchy by applying the `View/multilineTextAlignment(_:)` view modifier. Views in the hierarchy that display text, like `Text` or `TextEditor`, read the value from the environment and adjust their text alignment accordingly.

This value has no effect on a `Text` view that contains only one line of text, because a text view has a width that exactly matches the width of its widest line. If you want to align an entire text view rather than its contents, set the aligment of its container, like a `VStack` or a frame that you create with the `View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)` modifier.

> **NOTE:** You can use this value to control the alignment of a `Text` view that you create with the `Text/init(_:style:)` initializer to display localized dates and times, including when the view uses only a single line, but only when that view appears in a widget.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `lineSpacing(_:)`
- `lineSpacing`
- `multilineTextAlignment(_:)`
