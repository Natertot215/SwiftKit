---
url: https://developer.apple.com/documentation/swiftui/referencefiledocumentconfiguration
framework: SwiftUI
category: Documents
title: ReferenceFileDocumentConfiguration
kind: struct
captured: 2026-05-02
---

# ReferenceFileDocumentConfiguration

The properties of an open reference file document.

## Declaration

```swift
@MainActor @preconcurrency struct ReferenceFileDocumentConfiguration<Document> where Document : ReferenceFileDocument
```

### Overview

You receive an instance of this structure when you create a `DocumentGroup` with a reference file type. Use it to access the document in your viewer or editor.







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

- `ReferenceFileDocument`
- `undoManager`
