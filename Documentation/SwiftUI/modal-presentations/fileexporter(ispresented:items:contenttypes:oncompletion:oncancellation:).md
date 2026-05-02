---
url: https://developer.apple.com/documentation/swiftui/view/fileexporter(ispresented:items:contenttypes:oncompletion:oncancellation:)
framework: SwiftUI
category: Modal presentations
title: fileExporter(isPresented:items:contentTypes:onCompletion:onCancellation:)
kind: method
captured: 2026-05-02
---

# fileExporter(isPresented:items:contentTypes:onCompletion:onCancellation:)

Presents a system interface allowing the user to export a collection of items to files on disk.

## Declaration

```swift
nonisolated func fileExporter<C, T>(isPresented: Binding<Bool>, items: C, contentTypes: [UTType] = [], onCompletion: @escaping (Result<[URL], any Error>) -> Void, onCancellation: @escaping () -> Void = { }) -> some View where C : Collection, T : Transferable, T == C.Element

```

### Discussion

In order for the interface to appear `isPresented` must be set to `true`. When the operation is finished, `isPresented` will be set to `false` before `onCompletion` is called. If the user cancels the operation, `isPresented` will be set to `false` and `onCompletion` will not be called.

## Parameters

- **isPresented**: A binding to whether the interface should be shown.
- **items**: Collection of values to be saved on disk.
- **contentTypes**: The content types to use for the exported file. If empty, SwiftUI uses the content types from the `transferRepresentation` property provided for `Transferable` conformance.
- **onCompletion**: A callback that will be invoked when the operation has has succeeded or failed.
- **onCancellation**: A callback that will be invoked if the operation was cancelled.





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
- `fileExporter(isPresented:documents:contentTypes:onCompletion:onCancellation:)`
- `fileExporter(isPresented:item:contentTypes:defaultFilename:onCompletion:onCancellation:)`
- `fileExporterFilenameLabel(_:)`
