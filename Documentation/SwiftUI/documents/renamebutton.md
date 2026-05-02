---
url: https://developer.apple.com/documentation/swiftui/renamebutton
framework: SwiftUI
category: Documents
title: RenameButton
kind: struct
captured: 2026-05-02
---

# RenameButton

A button that triggers a standard rename action.

## Declaration

```swift
struct RenameButton<Label> where Label : View
```

### Overview

A rename button receives its action from the environment. Use the `View/renameAction(_:)` modifier to set the action. The system disables the button if you don’t define an action.

```swift
struct RowView: View {
    @State private var text = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        TextField(text: $item.name) {
            Text("Prompt")
        }
        .focused($isFocused)
        .contextMenu {
            RenameButton()
            // ... your own custom actions
        }
        .renameAction { $isFocused = true }
}
```

When someone taps the rename button in the context menu, the rename action focuses the text field by setting the `isFocused` property to true.

You can use this button inside of a navigation title menu and the navigation title modifier automatically configures the environment with the appropriate rename action.

```swift
ContentView()
    .navigationTitle($contentTitle) {
        // ... your own custom actions
        RenameButton()
    }
```





## Relationships

**Conforms To**: `View`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating an rename button

- `init()`

## See Also

- `EditButton`
- `PasteButton`
