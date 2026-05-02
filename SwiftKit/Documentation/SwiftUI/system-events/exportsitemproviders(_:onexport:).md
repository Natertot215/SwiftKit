---
url: https://developer.apple.com/documentation/swiftui/view/exportsitemproviders(_:onexport:)
framework: SwiftUI
category: System events
title: exportsItemProviders(_:onExport:)
kind: method
captured: 2026-05-02
---

# exportsItemProviders(_:onExport:)

Exports a read-only item provider for consumption by shortcuts, quick actions, and services.

## Declaration

```swift
nonisolated func exportsItemProviders(_ contentTypes: [UTType], onExport: @escaping () -> [NSItemProvider]) -> some View

```

### Discussion

If the associated view supports selection, the exported item should reflect that selected subpart.

## Parameters

- **contentTypes**: The types of content that the view supports exporting. An empty array means the view does not currently support exporting.
- **onExport**: A closure that will be called on request of the items by the shortcut or service.





## Availability

- macOS 12.0



## See Also

- `importsItemProviders(_:onImport:)`
- `exportsItemProviders(_:onExport:onEdit:)`
