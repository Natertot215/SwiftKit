---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/minimumscalefactor
framework: SwiftUI
category: Environment values
title: minimumScaleFactor
kind: property
captured: 2026-05-02
---

# minimumScaleFactor

The minimum permissible proportion to shrink the font size to fit the text into the available space.

## Declaration

```swift
var minimumScaleFactor: CGFloat { get set }
```

### Discussion

In the example below, a label with a `minimumScaleFactor` of `0.5` draws its text in a font size as small as half of the actual font if needed to fit into the space next to the text input field:

```swift
HStack {
    Text("This is a very long label:")
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    TextField("My Long Text Field", text: $myTextField)
        .frame(width: 250, height: 50, alignment: .center)
}
```

You can set the minimum scale factor to any value greater than `0` and less than or equal to `1`. The default value is `1`.

SwiftUI uses this value to shrink text that doesn’t fit in a view when it’s okay to shrink the text. For example, a label with a `minimumScaleFactor` of `0.5` draws its text in a font size as small as half the actual font if needed.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `truncationMode(_:)`
- `truncationMode`
- `allowsTightening(_:)`
- `allowsTightening`
- `minimumScaleFactor(_:)`
- `baselineOffset(_:)`
- `kerning(_:)`
- `tracking(_:)`
- `flipsForRightToLeftLayoutDirection(_:)`
- `TextAlignment`
