---
url: https://developer.apple.com/documentation/swiftui/newdocumentbutton
framework: SwiftUI
category: Documents
title: NewDocumentButton
kind: struct
captured: 2026-05-02
---

# NewDocumentButton

A button that creates and opens new documents.

## Declaration

```swift
struct NewDocumentButton<Label> where Label : View
```

### Overview

Use a new document button to give people the option to create documents in your app. In the following example, there are two new document buttons, both support `Text` labels. When the user taps or clicks the first button, the system creates a new document in the directory currently open in the document browser. The second button presents a template picker, where a document can be prepopulated or preconfigured using a template.

```swift
@State private var isTemplatePickerPresented = false
@State private var documentCreationContinuation:
    CheckedContinuation<TextDocument?, any Error>?

var body: some Scene {
    DocumentGroupLaunchScene("My Documents") {
        NewDocumentButton(Text("Start Writing…"))
        NewDocumentButton(Text("Choose a Template"), for: TextDocument.self) {
            try await withCheckedThrowingContinuation { continuation in
                documentCreationContinuation = continuation
                isTemplatePickerPresented = true
            }
        }
        .fullScreenCover(isPresented: $isTemplatePickerPresented) {
            TemplatePicker(
                continuation: $documentCreationContinuation
            )
        }
    }

    DocumentGroup(newDocument: TextDocument()) { configuration in
        MyDocumentView(document: configuration.$document))
    }
}

struct TemplatePicker: View {
    @Binding var continuation:
        CheckedContinuation<TextDocument?, any Error>?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Choose a template")
                .font(.title)
            Button("Meeting minutes") {
                let document = makeMeetingMinutes()
                documentCreationContinuation?.resume(returning: document)
                dismiss()
            }
            Button("Letter") {
                let document = makeLetter()
                documentCreationContinuation?.resume(returning: document)
                dismiss()
            }
            Button("Cancel") {
                documentCreationContinuation?.resume(throwing: CancellationError())
                dismiss()
            }
        }
    }

    private func makeMeetingMinutes() -> TextDocument { ... }
    private func makeLetter() -> TextDocument { ... }
}

struct TextDocument: FileDocument { ... }
```

If you don’t provide a custom label, the system provides a button with the default “Create Document” label.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 2.0

## Topics

### Initializers

- `init(_:contentType:)`
- `init(_:contentType:prepareDocumentURL:)`
- `init(_:for:contentType:prepareDocument:)`

## See Also

- `DocumentGroupLaunchScene`
- `DocumentLaunchView`
- `DocumentLaunchGeometryProxy`
- `DefaultDocumentGroupLaunchActions`
- `DocumentBaseBox`
