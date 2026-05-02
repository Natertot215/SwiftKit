---
url: https://developer.apple.com/documentation/swiftui/editbutton
framework: SwiftUI
category: Controls and indicators
title: EditButton
kind: struct
captured: 2026-05-02
---

# EditButton

A button that toggles the edit mode environment value.

## Declaration

```swift
struct EditButton
```

### Overview

An edit button toggles the environment’s `EnvironmentValues/editMode` value for content within a container that supports edit mode. In the following example, an edit button placed inside a `NavigationView` supports editing of a `List`:

```swift
@State private var fruits = [
    "Apple",
    "Banana",
    "Papaya",
    "Mango"
]

var body: some View {
    NavigationView {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
            }
            .onDelete { fruits.remove(atOffsets: $0) }
            .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
        }
        .navigationTitle("Fruits")
        .toolbar {
            EditButton()
        }
    }
}
```

Because the `ForEach` in the above example defines behaviors for `DynamicViewContent/onDelete(perform:)` and `DynamicViewContent/onMove(perform:)`, the editable list displays the delete and move UI when the user taps Edit. Notice that the Edit button displays the title “Done” while edit mode is active:

You can also create custom views that react to changes in the edit mode state, as described in `EditMode`.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- visionOS 1.0

## Topics

### Creating an edit button

- `init()`

## See Also

- `PasteButton`
- `RenameButton`
