---
url: https://developer.apple.com/documentation/swiftui/view/importsitemproviders(_:onimport:)
framework: SwiftUI
category: System events
title: importsItemProviders(_:onImport:)
kind: method
captured: 2026-05-02
---

# importsItemProviders(_:onImport:)

Enables importing item providers from services, such as Continuity Camera on macOS.

## Declaration

```swift
nonisolated func importsItemProviders(_ contentTypes: [UTType], onImport: @escaping ([NSItemProvider]) -> Bool) -> some View

```



## Parameters

- **contentTypes**: The types of content that the view supports importing. An empty array means the view does not currently support importing.
- **onImport**: A closure that will be called with the imported service item. Return `false` to indicate that there was a failure to receive the items.





## Availability

- macOS 12.0



## See Also

- `exportsItemProviders(_:onExport:)`
- `exportsItemProviders(_:onExport:onEdit:)`
