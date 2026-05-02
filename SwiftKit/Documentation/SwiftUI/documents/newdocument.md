---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/newdocument
framework: SwiftUI
category: Documents
title: newDocument
kind: property
captured: 2026-05-02
---

# newDocument

An action in the environment that presents a new document.

## Declaration

```swift
var newDocument: NewDocumentAction { get }
```

### Discussion

Use the `newDocument` environment value to get the instance of the `NewDocumentAction` structure for a given `Environment`. Then call the instance to present a new document. You call the instance directly because it defines a `NewDocumentAction/callAsFunction(_:)` method that Swift calls when you call the instance.

For example, you can define a button that creates a new document from the selected text:

```swift
struct NewDocumentFromSelection: View {
    @FocusedBinding(\.selectedText) private var selectedText: String?
    @Environment(\.newDocument) private var newDocument

    var body: some View {
        Button("New Document With Selection") {
            newDocument(TextDocument(text: selectedText))
        }
        .disabled(selectedText?.isEmpty != false)
    }
}
```

The above example assumes that you define a `TextDocument` that conforms to the `FileDocument` or `ReferenceFileDocument` protocol, and a `DocumentGroup` that handles the associated file type.







## Availability

- macOS 13.0



## See Also

- `NewDocumentAction`
- `openDocument`
- `OpenDocumentAction`
