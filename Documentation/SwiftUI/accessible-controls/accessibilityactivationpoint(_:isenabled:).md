---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityactivationpoint(_:isenabled:)
framework: SwiftUI
category: Accessible controls
title: accessibilityActivationPoint(_:isEnabled:)
kind: method
captured: 2026-05-02
---

# accessibilityActivationPoint(_:isEnabled:)

The activation point for an element is the location assistive technologies use to initiate gestures.

## Declaration

```swift
nonisolated func accessibilityActivationPoint(_ activationPoint: CGPoint, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Use this modifier to ensure that the activation point for a small element remains accurate even if you present a larger version of the element to VoiceOver.

If an activation point is not provided, an activation point will be derived from one of the accessibility elements decedents or from the center of the accessibility frame.

## Parameters

- **activationPoint**: The accessibility activation point to apply.
- **isEnabled**: If true the accessibility activation point is applied; otherwise the accessibility activation point is unchanged.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `accessibilityActivationPoint(_:)`
- `accessibilityDragPoint(_:description:)`
- `accessibilityDragPoint(_:description:isEnabled:)`
- `accessibilityDropPoint(_:description:)`
- `accessibilityDropPoint(_:description:isEnabled:)`
- `accessibilityDirectTouch(_:options:)`
- `accessibilityZoomAction(_:)`
- `AccessibilityDirectTouchOptions`
- `AccessibilityZoomGestureAction`
