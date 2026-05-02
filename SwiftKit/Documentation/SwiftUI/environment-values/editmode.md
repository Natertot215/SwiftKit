---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/editmode
framework: SwiftUI
category: Environment values
title: editMode
kind: property
captured: 2026-05-02
---

# editMode

An indication of whether the user can edit the contents of a view associated with this environment.

## Declaration

```swift
var editMode: Binding<EditMode>? { get set }
```

### Discussion

Read this environment value to receive a optional binding to the edit mode state. The binding contains an `EditMode` value that indicates whether edit mode is active, and that you can use to change the mode. To learn how to read an environment value, see `EnvironmentValues`.

Certain built-in views automatically alter their appearance and behavior in edit mode. For example, a `List` with a `ForEach` that’s configured with the `DynamicViewContent/onDelete(perform:)` or `DynamicViewContent/onMove(perform:)` modifier provides controls to delete or move list items while in edit mode. On devices without an attached keyboard and mouse or trackpad, people can make multiple selections in lists only when edit mode is active.

You can also customize your own views to react to edit mode. The following example replaces a read-only `Text` view with an editable `TextField`, checking for edit mode by testing the wrapped value’s `EditMode/isEditing` property:

```swift
@Environment(\.editMode) private var editMode
@State private var name = "Maria Ruiz"

var body: some View {
    Form {
        if editMode?.wrappedValue.isEditing == true {
            TextField("Name", text: $name)
        } else {
            Text(name)
        }
    }
    .animation(nil, value: editMode?.wrappedValue)
    .toolbar { // Assumes embedding this view in a NavigationView.
        EditButton()
    }
}
```

You can set the edit mode through the binding, or you can rely on an `EditButton` to do that for you, as the example above demonstrates. The button activates edit mode when the user taps the Edit button, and disables editing mode when the user taps Done.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- tvOS 13.0
- visionOS 1.0



## See Also

- `moveDisabled(_:)`
- `deleteDisabled(_:)`
- `EditMode`
- `EditActions`
- `EditableCollectionContent`
- `IndexedIdentifierCollection`
