---
url: https://developer.apple.com/documentation/swiftui/view/accessibilitydragpoint(_:description:isenabled:)
framework: SwiftUI
category: Accessible controls
title: accessibilityDragPoint(_:description:isEnabled:)
kind: method
captured: 2026-05-02
---

# accessibilityDragPoint(_:description:isEnabled:)

The point an assistive technology should use to begin a drag interaction.

## Declaration

```swift
nonisolated func accessibilityDragPoint(_ point: UnitPoint, description: LocalizedStringKey, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Use this modifier when you need to provide a description to users when prompted begin a drag interaction.

```swift
struct FileView: View {
    var filename: String

    var body: some View {
        FileIcon(filename: filename)
            .accessibilityDragPoint(
                .center, description: Text("Move \(filename)"))
    }
}
```

By default, if an accessible view or its subtree has drag and/or drop interactions, they will be automatically exposed by assistive technologies. However, if there is more than one such interaction, each drag or drop should have a description to disambiguate it and give a good user experience.

> **NOTE:** An accessibility element can have multiple points for a drag, provided they have different descriptions.

## Parameters

- **point**: The point the assistive technology will begin a drag interaction.
- **description**: The description of the drag interaction.
- **isEnabled**: If true the accessibility drag point is applied; otherwise the accessibility drag point is unchanged.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 2.0



## See Also

- `accessibilityActivationPoint(_:)`
- `accessibilityActivationPoint(_:isEnabled:)`
- `accessibilityDragPoint(_:description:)`
- `accessibilityDropPoint(_:description:)`
- `accessibilityDropPoint(_:description:isEnabled:)`
- `accessibilityDirectTouch(_:options:)`
- `accessibilityZoomAction(_:)`
- `AccessibilityDirectTouchOptions`
- `AccessibilityZoomGestureAction`
