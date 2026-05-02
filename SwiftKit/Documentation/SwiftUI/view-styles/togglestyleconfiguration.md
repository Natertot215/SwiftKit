---
url: https://developer.apple.com/documentation/swiftui/togglestyleconfiguration
framework: SwiftUI
category: View styles
title: ToggleStyleConfiguration
kind: struct
captured: 2026-05-02
---

# ToggleStyleConfiguration

The properties of a toggle instance.

## Declaration

```swift
struct ToggleStyleConfiguration
```

### Overview

When you define a custom toggle style by creating a type that conforms to the `ToggleStyle` protocol, you implement the `ToggleStyle/makeBody(configuration:)` method. That method takes a `ToggleStyleConfiguration` input that has the information you need to define the behavior and appearance of a `Toggle`.

The configuration structure’s `ToggleStyleConfiguration/label-swift.property` reflects the toggle’s content, which might be the value that you supply to the `label` parameter of the `Toggle/init(isOn:label:)` initializer. Alternatively, it could be another view that SwiftUI builds from an initializer that takes a string input, like `Toggle/init(_:isOn:)`. In either case, incorporate the label into the toggle’s view to help the user understand what the toggle does. For example, the built-in `ToggleStyle/switch` style horizontally stacks the label with the control element.

The structure’s `ToggleStyleConfiguration/isOn` property provides a `Binding` to the state of the toggle. Adjust the appearance of the toggle based on this value. For example, the built-in `ToggleStyle/button` style fills the button’s background when the property is `true`, but leaves the background empty when the property is `false`. Change the value when the user performs an action that’s meant to change the toggle, like the button does when tapped or clicked by the user.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting the label view

- `label`
- `ToggleStyleConfiguration.Label`

### Managing the toggle state

- `isMixed`
- `isOn`
- `$isOn`

## See Also

- `toggleStyle(_:)`
- `ToggleStyle`
