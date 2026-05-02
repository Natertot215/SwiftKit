---
url: https://developer.apple.com/documentation/swiftui/toggle
framework: SwiftUI
category: Controls and indicators
title: Toggle
kind: struct
captured: 2026-05-01
---

# Toggle

## Declaration

```swift
struct Toggle<Label> where Label : View
```

## Abstract

A control that toggles between on and off states.

## Overview

You create a toggle by providing an `isOn` binding and a label. Bind `isOn` to a Boolean property that determines whether the toggle is on or off. Set the label to a view that visually describes the purpose of switching between toggle states. For example:

```swift
@State private var vibrateOnRing = false

var body: some View {
    Toggle(isOn: $vibrateOnRing) {
        Text("Vibrate on Ring")
    }
}
```

For the common case of Label-based labels, you can use the convenience initializer that takes a title string (or localized string key) and the name of a system image:

```swift
@State private var vibrateOnRing = true

var body: some View {
    Toggle(
        "Vibrate on Ring",
        systemImage: "dot.radiowaves.left.and.right",
        isOn: $vibrateOnRing
    )
}
```

For text-only labels, you can use the convenience initializer that takes a title string (or localized string key) as its first parameter, instead of a trailing closure:

```swift
@State private var vibrateOnRing = true

var body: some View {
    Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
}
```

For cases where adding a subtitle to the label is desired, use a view builder that creates multiple `Text` views where the first text represents the title and the second text represents the subtitle:

```swift
@State private var vibrateOnRing = false

var body: some View {
    Toggle(isOn: $vibrateOnRing) {
        Text("Vibrate on Ring")
        Text("Enable vibration when the phone rings")
    }
}
```

> **Note:** This behavior does not apply to `ToggleStyle.button`.

### Styling Toggles

Toggles use a default style that varies based on both the platform and the context. For more information, read about the `ToggleStyle.automatic` toggle style.

You can customize the appearance and interaction of toggles by applying styles using the `toggleStyle(_:)` modifier. You can apply built-in styles, like `ToggleStyle.switch`, to either a toggle, or to a view hierarchy that contains toggles:

```swift
VStack {
    Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
    Toggle("Vibrate on Silent", isOn: $vibrateOnSilent)
}
.toggleStyle(.switch)
```

You can also define custom styles by creating a type that conforms to the `ToggleStyle` protocol.

## Availability

- iOS 13.0+
- iPadOS 13.0+
- Mac Catalyst 13.0+
- macOS 10.15+
- tvOS 13.0+
- visionOS 1.0+
- watchOS 6.0+

## See Also

- `Slider` — A control for selecting a value from a bounded linear range of values.
- `Stepper` — A control that performs increment and decrement actions.
- `View.toggleStyle(_:)` — Sets the style for toggles in a view hierarchy.
