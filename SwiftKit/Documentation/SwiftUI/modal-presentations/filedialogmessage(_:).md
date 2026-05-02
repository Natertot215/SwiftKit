---
url: https://developer.apple.com/documentation/swiftui/view/filedialogmessage(_:)
framework: SwiftUI
category: Modal presentations
title: fileDialogMessage(_:)
kind: method
captured: 2026-05-02
---

# fileDialogMessage(_:)

On macOS, configures the `fileExporter`, `fileImporter`, or `fileMover` with a custom text that is presented to the user, similar to a title.

## Declaration

```swift
nonisolated func fileDialogMessage(_ message: Text?) -> some View

```



## Parameters

- **message**: The optional text to use as the file dialog message.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0



## See Also

- `fileDialogBrowserOptions(_:)`
- `fileDialogConfirmationLabel(_:)`
- `fileDialogCustomizationID(_:)`
- `fileDialogDefaultDirectory(_:)`
- `fileDialogImportsUnresolvedAliases(_:)`
- `fileDialogURLEnabled(_:)`
- `FileDialogBrowserOptions`
