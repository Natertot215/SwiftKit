---
url: https://developer.apple.com/documentation/swiftui/view/filemover(ispresented:files:oncompletion:oncancellation:)
framework: SwiftUI
category: Modal presentations
title: fileMover(isPresented:files:onCompletion:onCancellation:)
kind: method
captured: 2026-05-02
---

# fileMover(isPresented:files:onCompletion:onCancellation:)

Presents a system dialog for allowing the user to move a collection of existing files to a new location.

## Declaration

```swift
nonisolated func fileMover<C>(isPresented: Binding<Bool>, files: C, onCompletion: @escaping (Result<[URL], any Error>) -> Void, onCancellation: @escaping () -> Void) -> some View where C : Collection, C.Element == URL

```

### Discussion

> **NOTE:** This dialog provides security-scoped URLs. Call the `startAccessingSecurityScopedResource` method to access or bookmark the URLs, and the `stopAccessingSecurityScopedResource` method to release the access.

For example, a button that allows the user to move files might look like this:

```swift
  struct MoveFilesButton: View {
      @Binding var files: [URL]
      @State private var showFileMover = false
      var onCompletion: (URL) -> Void
      var onCancellation: (() -> Void)?

      var body: some View {
          Button {
              showFileMover = true
          } label: {
              Label("Choose destination", systemImage: "folder.circle")
          }
          .fileMover(isPresented: $showFileMover, files: files) { result in
              switch result {
              case .success(let urls):
                  urls.forEach { url in
                      guard url.startAccessingSecurityScopedResource() else {
                          return
                      }
                      onCompletion(url)
                      url.stopAccessingSecurityScopedResource()
                  }
              case .failure(let error):
                  print(error)
                  // handle error
              }
          } onCancellation: {
              onCancellation?()
          }
      }
  }
```

## Parameters

- **isPresented**: A binding to whether the dialog should be shown.
- **files**: A collection of URLs for the files to be moved.
- **onCompletion**: A callback that will be invoked when the operation has succeeded or failed. The `result` indicates whether the operation succeeded or failed. To access the received URLs, call `startAccessingSecurityScopedResource`. When the access is no longer required, call `stopAccessingSecurityScopedResource`.
- **onCancellation**: A callback that will be invoked if the user cancels the operation.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0



## See Also

- `fileMover(isPresented:file:onCompletion:)`
- `fileMover(isPresented:files:onCompletion:)`
- `fileMover(isPresented:file:onCompletion:onCancellation:)`
