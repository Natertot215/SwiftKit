---
url: https://developer.apple.com/documentation/swiftui/view/fileexporter(ispresented:documents:contenttype:oncompletion:)
framework: SwiftUI
category: Modal presentations
title: fileExporter(isPresented:documents:contentType:onCompletion:)
kind: method
captured: 2026-05-02
---

# fileExporter(isPresented:documents:contentType:onCompletion:)

Presents a system interface for exporting a collection of value type documents to files on disk.

## Declaration

```swift
nonisolated func fileExporter<C>(isPresented: Binding<Bool>, documents: C, contentType: UTType, onCompletion: @escaping (Result<[URL], any Error>) -> Void) -> some View where C : Collection, C.Element : FileDocument

```

### Discussion

In order for the interface to appear, both `isPresented` must be `true` and `documents` must not be empty. When the operation is finished, `isPresented` will be set to `false` before `onCompletion` is called. If the user cancels the operation, `isPresented` will be set to `false` and `onCompletion` will not be called.

The `contentType` provided must be included within the document type’s `writableContentTypes`, otherwise the first valid writable content type will be used instead.

## Parameters

- **isPresented**: A binding to whether the interface should be shown.
- **documents**: The collection of in-memory documents to export.
- **contentType**: The content type to use for the exported file.
- **onCompletion**: A callback that will be invoked when the operation has has succeeded or failed.

**result**: A `Result` indicating whether the operation succeeded or failed.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0



## See Also

- `fileExporter(isPresented:document:contentType:defaultFilename:onCompletion:)`
- `fileExporter(isPresented:document:contentTypes:defaultFilename:onCompletion:onCancellation:)`
- `fileExporter(isPresented:documents:contentTypes:onCompletion:onCancellation:)`
- `fileExporter(isPresented:item:contentTypes:defaultFilename:onCompletion:onCancellation:)`
- `fileExporter(isPresented:items:contentTypes:onCompletion:onCancellation:)`
- `fileExporterFilenameLabel(_:)`
