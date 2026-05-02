---
url: https://developer.apple.com/documentation/swiftui/view/filedialogbrowseroptions(_:)
framework: SwiftUI
category: Modal presentations
title: fileDialogBrowserOptions(_:)
kind: method
captured: 2026-05-02
---

# fileDialogBrowserOptions(_:)

On macOS, configures the `fileExporter`, `fileImporter`, or `fileMover` to provide a refined URL search experience: include or exclude hidden files, allow searching by tag, etc.

## Declaration

```swift
nonisolated func fileDialogBrowserOptions(_ options: FileDialogBrowserOptions) -> some View

```



## Parameters

- **options**: The search options to apply to a given file dialog.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0



## See Also

- `fileDialogConfirmationLabel(_:)`
- `fileDialogCustomizationID(_:)`
- `fileDialogDefaultDirectory(_:)`
- `fileDialogImportsUnresolvedAliases(_:)`
- `fileDialogMessage(_:)`
- `fileDialogURLEnabled(_:)`
- `FileDialogBrowserOptions`
