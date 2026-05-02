---
url: https://developer.apple.com/documentation/swiftui/newdocumentaction
framework: SwiftUI
category: Documents
title: NewDocumentAction
kind: struct
captured: 2026-05-02
---

# NewDocumentAction

An action that presents a new document.

## Declaration

```swift
@MainActor @preconcurrency struct NewDocumentAction
```

### Overview

Use the `EnvironmentValues/newDocument` environment value to get the instance of this structure for a given `Environment`. Then call the instance to present a new document. You call the instance directly because it defines a `NewDocumentAction/callAsFunction(_:)` method that Swift calls when you call the instance.

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





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- macOS 13.0

## Topics

### Calling the action

- `callAsFunction(_:)`
- `callAsFunction(contentType:)`
- `callAsFunction(contentType:prepareDocument:)`

## See Also

- `newDocument`
- `openDocument`
- `OpenDocumentAction`
