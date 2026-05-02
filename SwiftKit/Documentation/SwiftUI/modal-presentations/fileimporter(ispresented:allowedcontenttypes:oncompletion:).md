---
url: https://developer.apple.com/documentation/swiftui/view/fileimporter(ispresented:allowedcontenttypes:oncompletion:)
framework: SwiftUI
category: Modal presentations
title: fileImporter(isPresented:allowedContentTypes:onCompletion:)
kind: method
captured: 2026-05-02
---

# fileImporter(isPresented:allowedContentTypes:onCompletion:)

Presents a system interface for importing a single file.

## Declaration
```swift
nonisolated func fileImporter(
    isPresented: Binding<Bool>,
    allowedContentTypes: [UTType],
    onCompletion: @escaping (Result<URL, any Error>) -> Void
) -> some View
```

## Parameters
- **isPresented**: A binding to a Boolean that controls whether the file importer interface is shown
- **allowedContentTypes**: An array of `UTType` values specifying which file types can be imported
- **onCompletion**: A callback closure that receives a `Result<URL, Error>` when the operation succeeds or fails

## Availability
- iOS 14.0+
- iPadOS 14.0+
- Mac Catalyst 14.0+
- macOS 11.0+
- visionOS 1.0+

## Key Behaviors
- When `isPresented` is `true`, the file picker interface appears
- `isPresented` is set to `false` before `onCompletion` is called
- If the user cancels, `isPresented` becomes `false` but `onCompletion` is NOT called
- The returned URLs are **security-scoped resources** — you must call `startAccessingSecurityScopedResource()` to access them and `stopAccessingSecurityScopedResource()` when done

## Example
```swift
struct PickTemplatesDirectoryButton: View {
    @State private var showFileImporter = false
    var onTemplatesDirectoryPicked: (URL) -> Void

    var body: some View {
        Button {
            showFileImporter = true
        } label: {
            Label("Choose templates directory", systemImage: "folder.circle")
        }
        .fileImporter(
            isPresented: $showFileImporter,
            allowedContentTypes: [.directory]
        ) { result in
            switch result {
            case .success(let directory):
                let gotAccess = directory.startAccessingSecurityScopedResource()
                if !gotAccess { return }
                onTemplatesDirectoryPicked(directory)
                directory.stopAccessingSecurityScopedResource()
            case .failure(let error):
                print(error)
            }
        }
    }
}
```

## See Also
- `fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:)`
- `fileExporter(isPresented:document:contentType:defaultFilename:onCompletion:)`
- `fileMover(isPresented:file:onCompletion:)`
