---
url: https://developer.apple.com/documentation/swiftui/datepickerstyle
framework: SwiftUI
category: View styles
title: DatePickerStyle
kind: protocol
captured: 2026-05-02
---

# DatePickerStyle

A type that specifies the appearance and interaction of all date pickers within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol DatePickerStyle
```

### Overview

To configure the current date picker style for a view hierarchy, use the `View/datePickerStyle(_:)` modifier.

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

**Conforming Types**: `CompactDatePickerStyle`, `DefaultDatePickerStyle`, `FieldDatePickerStyle`, `GraphicalDatePickerStyle`, `StepperFieldDatePickerStyle`, `WheelDatePickerStyle`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting built-in date picker styles

- `automatic`
- `compact`
- `field`
- `graphical`
- `stepperField`
- `wheel`

### Creating custom date picker styles

- `makeBody(configuration:)`
- `DatePickerStyleConfiguration`
- `DatePickerStyle.Configuration`
- `Body`

### Supporting types

- `DefaultDatePickerStyle`
- `CompactDatePickerStyle`
- `FieldDatePickerStyle`
- `GraphicalDatePickerStyle`
- `StepperFieldDatePickerStyle`
- `WheelDatePickerStyle`

## See Also

- `pickerStyle(_:)`
- `PickerStyle`
- `datePickerStyle(_:)`
