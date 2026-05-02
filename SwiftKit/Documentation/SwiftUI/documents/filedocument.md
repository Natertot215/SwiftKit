---
url: https://developer.apple.com/documentation/swiftui/filedocument
framework: SwiftUI
category: Documents
title: FileDocument
kind: protocol
captured: 2026-05-02
---

# FileDocument

A type that you use to serialize documents to and from file.

## Declaration

```swift
@preconcurrency protocol FileDocument : Sendable
```

### Overview

To store a document as a value type — like a structure — create a type that conforms to the `FileDocument` protocol and implement the required methods and properties. Your implementation:

- Provides a list of the content types that the document can read from and write to by defining `FileDocument/readableContentTypes`. If the list of content types that the document can write to is different from those that it reads from, you can optionally also define `FileDocument/writableContentTypes`.
- Loads documents from file in the `FileDocument/init(configuration:)` initializer.
- Stores documents to file by serializing their content in the `FileDocument/fileWrapper(configuration:)` method.

> **IMPORTANT:** If you store your document as a reference type — like a class — use `ReferenceFileDocument` instead.

Ensure that types that conform to this protocol are `Sendable`. In particular, SwiftUI calls the protocol’s methods from different isolation domains. Don’t perform serialization and deserialization on `MainActor`.





## Relationships

**Inherits From**: `Sendable`, `SendableMetatype`

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
- `FileDocument.ReadConfiguration`

### Writing a document

- `fileWrapper(configuration:)`
- `writableContentTypes`
- `FileDocument.WriteConfiguration`

## See Also

- `FileDocumentConfiguration`
