---
url: https://developer.apple.com/documentation/swiftui/stepper
framework: SwiftUI
category: Controls and indicators
title: Stepper
kind: struct
captured: 2026-05-02
---

# Stepper

A control that performs increment and decrement actions.

## Declaration

```swift
struct Stepper<Label> where Label : View
```

### Overview

Use a stepper control when you want the user to have granular control while incrementing or decrementing a value. For example, you can use a stepper to:

- Change a value up or down by `1`.
- Operate strictly over a prescribed range.
- Step by specific amounts over a stepper’s range of possible values.

The example below uses an array that holds a number of `Color` values, a local state variable, `value`, to set the control’s background color, and title label. When the user clicks or taps the stepper’s increment or decrement buttons, SwiftUI executes the relevant closure that updates `value`, wrapping the `value` to prevent overflow. SwiftUI then re-renders the view, updating the text and background color to match the current index:

```swift
struct StepperView: View {
    @State private var value = 0
    let colors: [Color] = [.orange, .red, .gray, .blue,
                           .green, .purple, .pink]

    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
    }

    func decrementStep() {
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }

    var body: some View {
        Stepper {
            Text("Value: \(value) Color: \(colors[value].description)")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
        .background(colors[value])
    }
}
```

The following example shows a stepper that displays the effect of incrementing or decrementing a value with the step size of `step` with the bounds defined by `range`:

```swift
struct StepperView: View {
    @State private var value = 0
    let step = 5
    let range = 1...50

    var body: some View {
        Stepper(
            value: $value,
            in: range,
            step: step
        ) {
            Text("Current: \(value) in \(range.description) " +
                 "stepping by \(step)")
        }
        .padding(10)
    }
}
```





## Relationships

**Conforms To**: `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a stepper

- `init(value:step:label:onEditingChanged:)`
- `init(value:step:format:label:onEditingChanged:)`
- `init(_:value:step:onEditingChanged:)`
- `init(_:value:step:format:onEditingChanged:)`

### Creating a stepper over a range

- `init(value:in:step:label:onEditingChanged:)`
- `init(value:in:step:format:label:onEditingChanged:)`
- `init(_:value:in:step:onEditingChanged:)`
- `init(_:value:in:step:format:onEditingChanged:)`

### Creating a stepper with change behavior

- `init(label:onIncrement:onDecrement:onEditingChanged:)`
- `init(_:onIncrement:onDecrement:onEditingChanged:)`

### Deprecated initializers

- `init(value:step:onEditingChanged:label:)`
- `init(value:in:step:onEditingChanged:label:)`
- `init(onIncrement:onDecrement:onEditingChanged:label:)`

## See Also

- `Slider`
- `Toggle`
- `toggleStyle(_:)`
