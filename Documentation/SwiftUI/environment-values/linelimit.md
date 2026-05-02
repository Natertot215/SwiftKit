---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/linelimit
framework: SwiftUI
category: Environment values
title: lineLimit
kind: property
captured: 2026-05-02
---

# lineLimit

The maximum number of lines that text can occupy in a view.

## Declaration

```swift
var lineLimit: Int? { get set }
```

### Discussion

The maximum number of lines is `1` if the value is less than `1`. If the value is `nil`, the text uses as many lines as required. The default is `nil`.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `lineLimit(_:)`
- `lineLimit(_:reservesSpace:)`
