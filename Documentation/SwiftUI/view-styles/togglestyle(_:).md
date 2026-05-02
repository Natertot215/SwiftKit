---
url: https://developer.apple.com/documentation/swiftui/view/togglestyle(_:)
framework: SwiftUI
category: View styles
title: toggleStyle(_:)
kind: method
captured: 2026-05-02
---

# toggleStyle(_:)

Sets the style for toggles in a view hierarchy.

## Declaration

```swift
nonisolated func toggleStyle<S>(_ style: S) -> some View where S : ToggleStyle

```

### Return Value

A view that uses the specified toggle style for itself and its child views.

### Discussion

Use this modifier on a `Toggle` instance to set a style that defines the control’s appearance and behavior. For example, you can choose the `ToggleStyle/switch` style:

```swift
Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
    .toggleStyle(.switch)
```

Built-in styles typically have a similar appearance across platforms, tailored to the platform’s overall style:

[table — see source]

#### Styling toggles in a hierarchy

You can set a style for all toggle instances within a view hierarchy by applying the style modifier to a container view. For example, you can apply the `ToggleStyle/button` style to an `HStack`:

```swift
HStack {
    Toggle(isOn: $isFlagged) {
        Label("Flag", systemImage: "flag.fill")
    }
    Toggle(isOn: $isMuted) {
        Label("Mute", systemImage: "speaker.slash.fill")
    }
}
.toggleStyle(.button)
```

The example above has the following appearance when `isFlagged` is `true` and `isMuted` is `false`:

[table — see source]

#### Automatic styling

If you don’t set a style, SwiftUI assumes a value of `ToggleStyle/automatic`, which corresponds to a context-specific default. Specify the automatic style explicitly to override a container’s style and revert to the default:

```swift
HStack {
    Toggle(isOn: $isShuffling) {
        Label("Shuffle", systemImage: "shuffle")
    }
    Toggle(isOn: $isRepeating) {
        Label("Repeat", systemImage: "repeat")
    }

    Divider()

    Toggle("Enhance Sound", isOn: $isEnhanced)
        .toggleStyle(.automatic) // Revert to the default style.
}
.toggleStyle(.button) // Use button style for toggles in the stack.
.labelStyle(.iconOnly) // Omit the title from any labels.
```

The style that SwiftUI uses as the default depends on both the platform and the context. In macOS, the default in most contexts is a `ToggleStyle/checkbox`, while in iOS, the default toggle style is a `ToggleStyle/switch`:

[table — see source]

> **NOTE:** Like toggle style does for toggles, the `View/labelStyle(_:)` modifier sets the style for `Label` instances in the hierarchy. The example above demostrates the compact `LabelStyle/iconOnly` style, which is useful for button toggles in space-constrained contexts. Always include a descriptive title for better accessibility.

For more information about how SwiftUI chooses a default toggle style, see the `ToggleStyle/automatic` style.

## Parameters

- **style**: The toggle style to set. Use one of the built-in values, like `ToggleStyle/switch` or `ToggleStyle/button`, or a custom style that you define by creating a type that conforms to the `ToggleStyle` protocol.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `Slider`
- `Stepper`
- `Toggle`
