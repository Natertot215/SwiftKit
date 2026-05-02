---
url: https://developer.apple.com/documentation/swiftui/view/frame(mindepth:idealdepth:maxdepth:alignment:)
framework: SwiftUI
category: Layout adjustments
title: frame(minDepth:idealDepth:maxDepth:alignment:)
kind: method
captured: 2026-05-02
---

# frame(minDepth:idealDepth:maxDepth:alignment:)

Positions this view within an invisible frame having the specified depth constraints.

## Declaration

```swift
nonisolated func frame(minDepth: CGFloat? = nil, idealDepth: CGFloat? = nil, maxDepth: CGFloat? = nil, alignment: DepthAlignment = .center) -> some View

```

### Return Value

A view with flexible dimensions given by the call’s non-`nil` parameters.

### Discussion

Always specify at least one size characteristic when calling this method. Pass `nil` or leave out a characteristic to indicate that the frame should adopt this view’s sizing behavior, constrained by the other non-`nil` arguments.

The size proposed to this view is the size proposed to the frame, limited by any constraints specified, and with an ideal dimension specified replacing any corresponding unspecified dimensions in the proposal.

If no minimum or maximum constraint is specified in a given dimension, the frame adopts the sizing behavior of its child in that dimension. If both constraints are specified in a dimension, the frame unconditionally adopts the size proposed for it, clamped to the constraints. Otherwise, the size of the frame in either dimension is:

- If a minimum constraint is specified and the size proposed for the frame by the parent is less than the size of this view, the proposed size, clamped to that minimum.
- If a maximum constraint is specified and the size proposed for the frame by the parent is greater than the size of this view, the proposed size, clamped to that maximum.
- Otherwise, the size of this view.

## Parameters

- **minDepth**: The minimum depth of the resulting frame.
- **idealDepth**: The ideal depth of the resulting frame.
- **maxDepth**: The maximum depth of the resulting frame.
- **alignment**: The alignment of this view inside the resulting frame. Note that most alignment values have no apparent effect when the size of the frame happens to match that of this view.





## Availability

- visionOS 1.0



## See Also

- `frame(width:height:alignment:)`
- `frame(depth:alignment:)`
- `frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)`
- `containerRelativeFrame(_:alignment:)`
- `containerRelativeFrame(_:alignment:_:)`
- `containerRelativeFrame(_:count:span:spacing:alignment:)`
- `fixedSize()`
- `fixedSize(horizontal:vertical:)`
- `layoutPriority(_:)`
