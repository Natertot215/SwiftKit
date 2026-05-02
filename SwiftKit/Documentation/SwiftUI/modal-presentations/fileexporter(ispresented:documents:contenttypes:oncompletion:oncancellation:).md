---
url: https://developer.apple.com/documentation/swiftui/view/fileexporter(ispresented:documents:contenttypes:oncompletion:oncancellation:)
framework: SwiftUI
category: Modal presentations
title: fileExporter(isPresented:documents:contentTypes:onCompletion:onCancellation:)
kind: method
captured: 2026-05-02
---

# fileExporter(isPresented:documents:contentTypes:onCompletion:onCancellation:)

Presents a system dialog for allowing the user to export a collection of documents that conform to `FileDocument` to files on disk.

## Declaration

```swift
nonisolated func fileExporter<C>(isPresented: Binding<Bool>, documents: C, contentTypes: [UTType] = [], onCompletion: @escaping (Result<[URL], any Error>) -> Void, onCancellation: @escaping () -> Void = {}) -> some View where C : Collection, C.Element : FileDocument

```

### Discussion

In order for the dialog to appear, `isPresented` must be `true`. When the operation is finished, `isPresented` will be set to `false` before `onCompletion` is called. If the user cancels the operation, `isPresented` will be set to `false` and `onCancellation` will be called.

## Parameters

- **isPresented**: A binding to whether the dialog should be shown.
- **documents**: The in-memory documents to export.
- **contentTypes**: The list of supported content types which can be exported. If not provided, `FileDocument.writableContentTypes` are used.
- **onCompletion**: A callback that will be invoked when the operation has succeeded or failed. The `result` indicates whether the operation succeeded or failed.
- **onCancellation**: A callback that will be invoked if the user cancels the operation.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0



## See Also

- `fileExporter(isPresented:document:contentType:defaultFilename:onCompletion:)`
- `fileExporter(isPresented:documents:contentType:onCompletion:)`
- `fileExporter(isPresented:document:contentTypes:defaultFilename:onCompletion:onCancellation:)`
- `fileExporter(isPresented:item:contentTypes:defaultFilename:onCompletion:onCancellation:)`
- `fileExporter(isPresented:items:contentTypes:onCompletion:onCancellation:)`
- `fileExporterFilenameLabel(_:)`
