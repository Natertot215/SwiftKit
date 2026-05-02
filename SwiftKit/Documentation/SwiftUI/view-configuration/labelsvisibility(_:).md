---
url: https://developer.apple.com/documentation/swiftui/view/labelsvisibility(_:)
framework: SwiftUI
category: View configuration
title: labelsVisibility(_:)
kind: method
captured: 2026-05-02
---

# labelsVisibility(_:)

Controls the visibility of labels of any controls contained within this view.

## Declaration

```swift
nonisolated func labelsVisibility(_ visibility: Visibility) -> some View

```

### Discussion

Use this modifier when you want to omit a label from one or more labeled content in your user interface. For example, the first `Toggle` in the following example hides its label:

```swift
VStack {
    Toggle(isOn: $toggle1) {
        Text("Toggle 1")
    }
    .labelsVisibility(.hidden)

    Toggle(isOn: $toggle2) {
        Text("Toggle 2")
    }
}
```

The `VStack` in the example above centers the first toggle’s control element in the available space, while it centers the second toggle’s combined label and control element:

Always provide a label for controls, even when you hide the label, because SwiftUI uses labels for other purposes, including accessibility.

On iOS, a `Picker` within a `Menu` hides its label by default. You can use this modifier to explicitly show the label in that context:

```swift
Menu {
    Picker("Flavor", selection: $selectedFlavor) {
        Text("Chocolate").tag(Flavor.chocolate)
        Text("Vanilla").tag(Flavor.vanilla)
        Text("Strawberry").tag(Flavor.strawberry)
    }
    .labelsVisibility(.visible)
}
```

> **NOTE:** This modifier doesn’t work for all labels. It applies to `LabeledContent` elements, including controls like `Picker` and `Toggle`, but not to controls like a bordered button where the label is inside the button’s border.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `labelsHidden()`
- `labelsVisibility`
- `menuIndicator(_:)`
- `statusBarHidden(_:)`
- `persistentSystemOverlays(_:)`
- `Visibility`
