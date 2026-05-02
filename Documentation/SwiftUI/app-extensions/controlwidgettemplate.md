---
url: https://developer.apple.com/documentation/swiftui/controlwidgettemplate
framework: SwiftUI
category: App extensions
title: ControlWidgetTemplate
kind: protocol
captured: 2026-05-02
---

# ControlWidgetTemplate

A type that describes a control widget’s content.

## Declaration

```swift
@MainActor @preconcurrency protocol ControlWidgetTemplate
```

### Overview

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





## Relationships

**Conforming Types**: `EmptyControlWidgetTemplate`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 26.0
- watchOS 26.0

## Topics

### Associated Types

- `Body`

### Instance Properties

- `body`

### Instance Methods

- `disabled(_:)`
- `privacySensitive(_:)`
- `tint(_:)`

## See Also

- `ControlWidget`
- `ControlWidgetConfiguration`
- `EmptyControlWidgetConfiguration`
- `ControlWidgetConfigurationBuilder`
- `EmptyControlWidgetTemplate`
- `ControlWidgetTemplateBuilder`
- `controlWidgetActionHint(_:)`
- `controlWidgetStatus(_:)`
