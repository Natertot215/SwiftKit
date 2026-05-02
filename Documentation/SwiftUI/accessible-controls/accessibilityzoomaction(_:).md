---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityzoomaction(_:)
framework: SwiftUI
category: Accessible controls
title: accessibilityZoomAction(_:)
kind: method
captured: 2026-05-02
---

# accessibilityZoomAction(_:)

Adds an accessibility zoom action to the view. Actions allow assistive technologies, such as VoiceOver, to interact with the view by invoking the action.

## Declaration

```swift
nonisolated func accessibilityZoomAction(_ handler: @escaping (AccessibilityZoomGestureAction) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

For example, this is how a zoom action is used to transform the scale of a shape which has a `MagnificationGesture`.

```swift
var body: some View {
    Circle()
        .scaleEffect(magnifyBy)
        .gesture(magnification)
        .accessibilityLabel("Circle Magnifier")
        .accessibilityZoomAction { action in
            switch action.direction {
            case .zoomIn:
                magnifyBy += 0.5
            case .zoomOut:
                 magnifyBy -= 0.5
            }
        }
}
```







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `accessibilityActivationPoint(_:)`
- `accessibilityActivationPoint(_:isEnabled:)`
- `accessibilityDragPoint(_:description:)`
- `accessibilityDragPoint(_:description:isEnabled:)`
- `accessibilityDropPoint(_:description:)`
- `accessibilityDropPoint(_:description:isEnabled:)`
- `accessibilityDirectTouch(_:options:)`
- `AccessibilityDirectTouchOptions`
- `AccessibilityZoomGestureAction`
