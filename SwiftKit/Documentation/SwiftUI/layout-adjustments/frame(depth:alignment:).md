---
url: https://developer.apple.com/documentation/swiftui/view/frame(depth:alignment:)
framework: SwiftUI
category: Layout adjustments
title: frame(depth:alignment:)
kind: method
captured: 2026-05-02
---

# frame(depth:alignment:)

Positions this view within an invisible frame with the specified depth.

## Declaration

```swift
nonisolated func frame(depth: CGFloat?, alignment: DepthAlignment = .center) -> some View

```

### Return Value

A view with a fixed dimension of `depth` if non-`nil`.

### Discussion

Use this method to specify a fixed size for a view’s depth. If you don’t specify a dimension, the resulting view assumes this view’s sizing behavior in depth.

## Parameters

- **depth**: A fixed depth for the resulting view. If `depth` is `nil`, the resulting view assumes this view’s sizing behavior.
- **alignment**: The alignment of this view inside the resulting view. `alignment` applies if this view is smaller than the size given by the resulting frame.





## Availability

- visionOS 1.0



## See Also

- `frame(width:height:alignment:)`
- `frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)`
- `frame(minDepth:idealDepth:maxDepth:alignment:)`
- `containerRelativeFrame(_:alignment:)`
- `containerRelativeFrame(_:alignment:_:)`
- `containerRelativeFrame(_:count:span:spacing:alignment:)`
- `fixedSize()`
- `fixedSize(horizontal:vertical:)`
- `layoutPriority(_:)`
