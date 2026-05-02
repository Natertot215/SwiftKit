---
url: https://developer.apple.com/documentation/swiftui/texteditor
framework: SwiftUI
category: Text input and output
title: TextEditor
kind: struct
captured: 2026-05-02
---

# TextEditor

A view that can display and edit long-form text.

## Declaration

```swift
struct TextEditor
```

### Overview

A text editor view allows you to display and edit multiline, scrollable text in your app’s user interface. By default, the text editor view styles the text using characteristics inherited from the environment, like `View/font(_:)`, `View/foregroundColor(_:)`, and `View/multilineTextAlignment(_:)`.

You create a text editor by adding a `TextEditor` instance to the body of your view, and initialize it by passing in a `Binding` to a string variable in your app:

```swift
struct TextEditingView: View {
    @State private var fullText: String = "This is some editable text..."

    var body: some View {
        TextEditor(text: $fullText)
    }
}
```

To style the text, use the standard view modifiers to configure a system font, set a custom font, or change the color of the view’s text.

In this example, the view renders the editor’s text in gray with a custom font:

```swift
struct TextEditingView: View {
    @State private var fullText: String = "This is some editable text..."

    var body: some View {
        TextEditor(text: $fullText)
            .foregroundColor(Color.gray)
            .font(.custom("HelveticaNeue", size: 13))
    }
}
```

If you want to change the spacing or font scaling aspects of the text, you can use modifiers like `View/lineLimit(_:)`, `View/lineSpacing(_:)`, and `View/minimumScaleFactor(_:)` to configure how the view displays text depending on the space constraints. For example, here the `View/lineSpacing(_:)` modifier sets the spacing between lines to 5 points:

```swift
struct TextEditingView: View {
    @State private var fullText: String = "This is some editable text..."

    var body: some View {
        TextEditor(text: $fullText)
            .foregroundColor(Color.gray)
            .font(.custom("HelveticaNeue", size: 13))
            .lineSpacing(5)
    }
}
```





## Relationships

**Conforms To**: `View`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Creating a text editor

- `init(text:)`

### Initializers

- `init(text:selection:)`

## See Also

- `Building rich SwiftUI text experiences`
- `TextField`
- `textFieldStyle(_:)`
- `SecureField`
