---
url: https://developer.apple.com/documentation/swiftui/view/accessibilitydragpoint(_:description:)
framework: SwiftUI
category: Accessible controls
title: accessibilityDragPoint(_:description:)
kind: method
captured: 2026-05-02
---

# accessibilityDragPoint(_:description:)

The point an assistive technology should use to begin a drag interaction.

## Declaration

```swift
nonisolated func accessibilityDragPoint(_ point: UnitPoint, description: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Use this modifier when you need to provide a description to users when prompted begin a drag interaction.

```swift
struct FileView: View {
    var filename: String

    var body: some View {
        FileIcon(filename: filename)
            .accessibilityDragPoint(.center, description: "Move \(filename)")
    }
}
```

By default, if an accessible view or its subtree has drag and/or drop interactions, they will be automatically exposed by assistive technologies. However, if there is more than one such interaction, each drag or drop should have a description to disambiguate it and give a good user experience.

> **NOTE:** An accessibility element can have multiple points for a drag, provided they have different descriptions.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0



## See Also

- `accessibilityActivationPoint(_:)`
- `accessibilityActivationPoint(_:isEnabled:)`
- `accessibilityDragPoint(_:description:isEnabled:)`
- `accessibilityDropPoint(_:description:)`
- `accessibilityDropPoint(_:description:isEnabled:)`
- `accessibilityDirectTouch(_:options:)`
- `accessibilityZoomAction(_:)`
- `AccessibilityDirectTouchOptions`
- `AccessibilityZoomGestureAction`
