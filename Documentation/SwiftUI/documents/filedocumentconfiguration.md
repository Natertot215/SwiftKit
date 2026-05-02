---
url: https://developer.apple.com/documentation/swiftui/filedocumentconfiguration
framework: SwiftUI
category: Documents
title: FileDocumentConfiguration
kind: struct
captured: 2026-05-02
---

# FileDocumentConfiguration

The properties of an open file document.

## Declaration

```swift
struct FileDocumentConfiguration<Document> where Document : FileDocument
```

### Overview

You receive an instance of this structure when you create a `DocumentGroup` with a value file type. Use it to access the document in your viewer or editor.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Getting and setting the document

- `document`
- `$document`

### Getting document properties

- `fileURL`
- `isEditable`

## See Also

- `FileDocument`
