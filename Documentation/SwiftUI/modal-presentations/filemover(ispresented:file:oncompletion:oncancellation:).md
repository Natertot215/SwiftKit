---
url: https://developer.apple.com/documentation/swiftui/view/filemover(ispresented:file:oncompletion:oncancellation:)
framework: SwiftUI
category: Modal presentations
title: fileMover(isPresented:file:onCompletion:onCancellation:)
kind: method
captured: 2026-05-02
---

# fileMover(isPresented:file:onCompletion:onCancellation:)

Presents a system dialog for allowing the user to move an existing file to a new location.

## Declaration

```swift
nonisolated func fileMover(isPresented: Binding<Bool>, file: URL?, onCompletion: @escaping (Result<URL, any Error>) -> Void, onCancellation: @escaping () -> Void) -> some View

```

### Discussion

> **NOTE:** This dialog provides security-scoped URLs. Call the `startAccessingSecurityScopedResource` method to access or bookmark the URLs, and the `stopAccessingSecurityScopedResource` method to release the access.

For example, a button that allows the user to move a file might look like this:

```swift
  struct MoveFileButton: View {
      @State private var showFileMover = false
      var file: URL
      var onCompletion: (URL) -> Void
      var onCancellation: (() -> Void)?

      var body: some View {
          Button {
              showFileMover = true
          } label: {
              Label("Choose destination", systemImage: "folder.circle")
          }
          .fileMover(isPresented: $showFileMover, file: file) { result in
              switch result {
              case .success(let url):
                  guard url.startAccessingSecurityScopedResource() else {
                      return
                  }
                  onCompletion(url)
                  url.stopAccessingSecurityScopedResource()
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
- **file**: The URL of the file to be moved.
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
- `fileMover(isPresented:files:onCompletion:onCancellation:)`
