---
url: https://developer.apple.com/documentation/swiftui/togglestyle
framework: SwiftUI
category: View styles
title: ToggleStyle
kind: protocol
captured: 2026-05-02
---

# ToggleStyle

The appearance and behavior of a toggle.

## Declaration

```swift
@MainActor @preconcurrency protocol ToggleStyle
```

### Overview

To configure the style for a single `Toggle` or for all toggle instances in a view hierarchy, use the `View/toggleStyle(_:)` modifier. You can specify one of the built-in toggle styles, like `ToggleStyle/switch` or `ToggleStyle/button`:

```swift
Toggle(isOn: $isFlagged) {
    Label("Flag", systemImage: "flag.fill")
}
.toggleStyle(.button)
```

Alternatively, you can create and apply a custom style.

#### Custom styles

To create a custom style, declare a type that conforms to the `ToggleStyle` protocol and implement the required `ToggleStyle/makeBody(configuration:)` method. For example, you can define a checklist toggle style:

```swift
struct ChecklistToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // Return a view that has checklist appearance and behavior.
    }
}
```

Inside the method, use the `configuration` parameter, which is an instance of the `ToggleStyleConfiguration` structure, to get the label and a binding to the toggle state. To see examples of how to use these items to construct a view that has the appearance and behavior of a toggle, see `ToggleStyle/makeBody(configuration:)`.

To provide easy access to the new style, declare a corresponding static variable in an extension to `ToggleStyle`:

```swift
extension ToggleStyle where Self == ChecklistToggleStyle {
    static var checklist: ChecklistToggleStyle { .init() }
}
```

You can then use your custom style:

```swift
Toggle(activity.name, isOn: $activity.isComplete)
    .toggleStyle(.checklist)
```

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `ButtonToggleStyle`, `CheckboxToggleStyle`, `DefaultToggleStyle`, `SwitchToggleStyle`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting built-in toggle styles

- `automatic`
- `button`
- `checkbox`
- `switch`

### Creating custom toggle styles

- `makeBody(configuration:)`
- `ToggleStyleConfiguration`
- `ToggleStyle.Configuration`
- `Body`

### Supporting types

- `DefaultToggleStyle`
- `ButtonToggleStyle`
- `CheckboxToggleStyle`
- `SwitchToggleStyle`

## See Also

- `toggleStyle(_:)`
- `ToggleStyleConfiguration`
