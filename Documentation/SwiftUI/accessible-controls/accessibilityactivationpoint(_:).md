---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityactivationpoint(_:)
framework: SwiftUI
category: Accessible controls
title: accessibilityActivationPoint(_:)
kind: method
captured: 2026-05-02
---

# accessibilityActivationPoint(_:)

The activation point for an element is the location assistive technologies use to initiate gestures.

## Declaration

```swift
nonisolated func accessibilityActivationPoint(_ activationPoint: CGPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Use this modifier to ensure that the activation point for a small element remains accurate even if you present a larger version of the element to VoiceOver.

If an activation point is not provided, an activation point will be derrived from one of the accessibility elements decendents or from the center of the accessibility frame.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `accessibilityActivationPoint(_:isEnabled:)`
- `accessibilityDragPoint(_:description:)`
- `accessibilityDragPoint(_:description:isEnabled:)`
- `accessibilityDropPoint(_:description:)`
- `accessibilityDropPoint(_:description:isEnabled:)`
- `accessibilityDirectTouch(_:options:)`
- `accessibilityZoomAction(_:)`
- `AccessibilityDirectTouchOptions`
- `AccessibilityZoomGestureAction`
