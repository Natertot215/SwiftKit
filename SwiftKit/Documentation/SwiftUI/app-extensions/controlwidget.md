---
url: https://developer.apple.com/documentation/swiftui/controlwidget
framework: SwiftUI
category: App extensions
title: ControlWidget
kind: protocol
captured: 2026-05-02
---

# ControlWidget

The configuration and content of a control widget to display in system spaces such as Control Center, the Lock Screen, and the Action Button.

## Declaration

```swift
@MainActor @preconcurrency protocol ControlWidget
```

### Overview

Controls allow users to quickly read the state of your app or its accessories, and take quick actions, without having to open your app. Users can add, configure, and arrange controls to suit their individual needs. You can provide multiple types of controls, each representing a specific kind of action.

There are three key components to a control:

- A configuration that determines whether the control is configurable, identifies the control, and defines the SwiftUI template that provides the control’s content.
- A value provider that defines the value of the control when being previewed and when being actually rendered
- The template used by WidgetKit to display the control.

Controls are defined using templates in order to ensure that they control will work at all sizes and in all system spaces in which they might be displayed. These templates define images (specifically, symbol images) and text using simple SwiftUI views like `Label`, `Text`, and `Image`; and tint colors using the `ControlWidgetTemplate/tint(_:)` modifier.

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







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 26.0
- watchOS 26.0

## Topics

### Associated Types

- `Body`

### Initializers

- `init()`

### Instance Properties

- `body`

### Type Methods

- `main()`

## See Also

- `ControlWidgetConfiguration`
- `EmptyControlWidgetConfiguration`
- `ControlWidgetConfigurationBuilder`
- `ControlWidgetTemplate`
- `EmptyControlWidgetTemplate`
- `ControlWidgetTemplateBuilder`
- `controlWidgetActionHint(_:)`
- `controlWidgetStatus(_:)`
