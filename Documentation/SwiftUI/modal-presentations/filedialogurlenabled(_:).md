---
url: https://developer.apple.com/documentation/swiftui/view/filedialogurlenabled(_:)
framework: SwiftUI
category: Modal presentations
title: fileDialogURLEnabled(_:)
kind: method
captured: 2026-05-02
---

# fileDialogURLEnabled(_:)

On macOS, configures the `fileImporter` or `fileMover` to conditionally disable presented URLs.

## Declaration

```swift
nonisolated func fileDialogURLEnabled(_ predicate: Predicate<URL>) -> some View

```



## Parameters

- **predicate**: The predicate that evaluates the URLs presented to the user to conditionally disable them. The implementation is expected to have constant complexity and should not access the files contents or metadata. A common use case is inspecting the path or the file name.





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
- `fileDialogMessage(_:)`
- `FileDialogBrowserOptions`
