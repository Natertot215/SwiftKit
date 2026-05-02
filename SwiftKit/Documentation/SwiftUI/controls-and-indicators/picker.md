---
url: https://developer.apple.com/documentation/swiftui/picker
framework: SwiftUI
category: Controls and indicators
title: Picker
kind: struct
captured: 2026-05-01
---

# Picker

## Declaration

```swift
struct Picker<Label, SelectionValue, Content> where Label : View, SelectionValue : Hashable, Content : View
```

## Abstract

A control for selecting from a set of mutually exclusive values.

## Overview

You create a picker by providing a selection binding, a label, and the content for the picker to display. Set the `selection` parameter to a bound property that provides the value to display as the current selection. Set the label to a view that visually describes the purpose of selecting content in the picker, and then provide the content for the picker to display.

### Basic Example

For example, consider an enumeration of ice cream flavors and a `State` variable to hold the selected flavor:

```swift
enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

@State private var selectedFlavor: Flavor = .chocolate
```

You can create a picker to select among the values by providing a label, a binding to the current selection, and a collection of views for the picker's content. Append a tag to each of these content views using the `View/tag(_:)` view modifier so that the type of each selection matches the type of the bound state variable:

```swift
List {
    Picker("Flavor", selection: $selectedFlavor) {
        Text("Chocolate").tag(Flavor.chocolate)
        Text("Vanilla").tag(Flavor.vanilla)
        Text("Strawberry").tag(Flavor.strawberry)
    }
}
```

If you provide a string label for the picker, the picker uses it to initialize a `Text` view as a label. Alternatively, you can use the `init(selection:content:label:)` initializer to compose the label from other views.

### Custom Labels with Subtitles

For cases where adding a subtitle to the label is desired, use a view builder that creates multiple `Text` views where the first text represents the title and the second text represents the subtitle:

```swift
List {
    Picker(selection: $selectedFlavor) {
        Text("Chocolate").tag(Flavor.chocolate)
        Text("Vanilla").tag(Flavor.vanilla)
        Text("Strawberry").tag(Flavor.strawberry)
    } label: {
        Text("Flavor")
        Text("Choose your favorite flavor")
    }
}
```

### Iterating over a Picker's Options

To provide selection values for the `Picker` without explicitly listing each option, you can create the picker with a `ForEach`:

```swift
Picker("Flavor", selection: $selectedFlavor) {
    ForEach(Flavor.allCases) { flavor in
        Text(flavor.rawValue.capitalized)
    }
}
```

`ForEach` automatically assigns a tag to the selection views using each option's `id`. This is possible because `Flavor` conforms to the `Identifiable` protocol.

### Using Tags with Different Types

When the views in a picker's `ForEach` need an explicit tag modifier, such as when selecting over associated values:

```swift
enum Topping: String, CaseIterable, Identifiable {
    case nuts, cookies, blueberries
    var id: Self { self }
}

extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        }
    }
}

@State private var suggestedTopping: Topping = .nuts

List {
    Picker("Flavor", selection: $suggestedTopping) {
        ForEach(Flavor.allCases) { flavor in
            Text(flavor.rawValue.capitalized)
                .tag(flavor.suggestedTopping)
        }
    }
}
```

### Styling Pickers

You can customize the appearance and interaction of pickers using styles that conform to the `PickerStyle` protocol, like `segmented` or `menu`. To set a specific style for all picker instances within a view, use the `pickerStyle(_:)` modifier:

```swift
VStack {
    Picker("Flavor", selection: $selectedFlavor) {
        ForEach(Flavor.allCases) { flavor in
            Text(flavor.rawValue.capitalized)
        }
    }
    Picker("Topping", selection: $selectedTopping) {
        ForEach(Topping.allCases) { topping in
            Text(topping.rawValue.capitalized)
        }
    }
}
.pickerStyle(.segmented)
```

## Availability

- iOS 13.0+
- iPadOS 13.0+
- macOS 10.15+
- tvOS 13.0+
- visionOS 1.0+
- watchOS 6.0+
- Mac Catalyst 13.0+

## See Also

- `View/pickerStyle(_:)`
- `View/horizontalRadioGroupLayout()`
- `View/defaultWheelPickerItemHeight(_:)`
- `EnvironmentValues/defaultWheelPickerItemHeight`
- `View/paletteSelectionEffect(_:)`
- `PaletteSelectionEffect`
