---
url: https://developer.apple.com/documentation/swiftui/referencefiledocument
framework: SwiftUI
category: Documents
title: ReferenceFileDocument
kind: protocol
captured: 2026-05-02
---

# ReferenceFileDocument

A type that you use to serialize reference type documents to and from file.

## Declaration

```swift
@preconcurrency protocol ReferenceFileDocument : ObservableObject, Sendable
```

### Overview

To store a document as a reference type — like a class — create a type that conforms to the `ReferenceFileDocument` protocol and implement the required methods and properties. Your implementation:

- Provides a list of the content types that the document can read from and write to by defining `ReferenceFileDocument/readableContentTypes`. If the list of content types that the document can write to is different from those that it reads from, you can optionally also define `ReferenceFileDocument/writableContentTypes`.
- Loads documents from file in the `ReferenceFileDocument/init(configuration:)` initializer.
- Stores documents to file by providing a snapshot of the document’s content in the `ReferenceFileDocument/snapshot(contentType:)` method, and then serializing that content in the `ReferenceFileDocument/fileWrapper(snapshot:configuration:)` method.

Ensure that types that conform to this protocol are `Sendable`. In particular, SwiftUI calls the protocol’s methods from different isolation domains. Don’t perform serialization and deserialization on `MainActor`.

```swift
final class PDFDocument: ReferenceFileDocument {
    struct Storage {
        var contents: Data
    }

    static let readableContentTypes: [UTType] = [.pdf]
    let storage: Mutex<Storage>

    required init(configuration: ReadConfiguration) throws {
       guard let data = configuration.file.regularFileContents else {
           throw CocoaError(.fileReadCorruptFile)
       }
        self.storage = .init(.init(contents: data))
    }

    func snapshot(contentType: UTType) throws -> Data {
        storage.withLock { $0.contents }
    }

    func fileWrapper(snapshot: Data, configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: snapshot)
    }
}
```

> **IMPORTANT:** If you store your document as a value type — like a structure — use `FileDocument` instead.





## Relationships

**Inherits From**: `ObservableObject`, `Sendable`, `SendableMetatype`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Reading a document

- `init(configuration:)`
- `readableContentTypes`
- `ReferenceFileDocument.ReadConfiguration`

### Getting a snapshot

- `snapshot(contentType:)`
- `Snapshot`

### Writing a document

- `fileWrapper(snapshot:configuration:)`
- `writableContentTypes`
- `ReferenceFileDocument.WriteConfiguration`

## See Also

- `ReferenceFileDocumentConfiguration`
- `undoManager`
