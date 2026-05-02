---
url: https://developer.apple.com/documentation/swiftui/view/filemover(ispresented:file:oncompletion:)
framework: SwiftUI
category: Modal presentations
title: fileMover(isPresented:file:onCompletion:)
kind: method
captured: 2026-05-02
---

# fileMover(isPresented:file:onCompletion:)

Presents a system interface for allowing the user to move an existing file to a new location.

## Declaration

```swift
nonisolated func fileMover(isPresented: Binding<Bool>, file: URL?, onCompletion: @escaping (Result<URL, any Error>) -> Void) -> some View

```

### Discussion

> **NOTE:** This interface provides security-scoped URLs. Call the `startAccessingSecurityScopedResource` method to access or bookmark the URLs, and the `stopAccessingSecurityScopedResource` method to release the access.

In order for the interface to appear, both `isPresented` must be `true` and `file` must not be `nil`. When the operation is finished, `isPresented` will be set to `false` before `onCompletion` is called. If the user cancels the operation, `isPresented` will be set to `false` and `onCompletion` will not be called.

## Parameters

- **isPresented**: A binding to whether the interface should be shown.
- **file**: The `URL` of the file to be moved.
- **onCompletion**: A callback that will be invoked when the operation has has succeeded or failed. To access the received URLs, call `startAccessingSecurityScopedResource`. When the access is no longer required, call `stopAccessingSecurityScopedResource`.

**result**: A `Result` indicating whether the operation succeeded or failed.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0



## See Also

- `fileMover(isPresented:files:onCompletion:)`
- `fileMover(isPresented:file:onCompletion:onCancellation:)`
- `fileMover(isPresented:files:onCompletion:onCancellation:)`
