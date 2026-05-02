---
url: https://developer.apple.com/documentation/swiftui/view/exportsitemproviders(_:onexport:onedit:)
framework: SwiftUI
category: System events
title: exportsItemProviders(_:onExport:onEdit:)
kind: method
captured: 2026-05-02
---

# exportsItemProviders(_:onExport:onEdit:)

Exports a read-write item provider for consumption by shortcuts, quick actions, and services.

## Declaration

```swift
nonisolated func exportsItemProviders(_ contentTypes: [UTType], onExport: @escaping () -> [NSItemProvider], onEdit: @escaping ([NSItemProvider]) -> Bool) -> some View

```

### Discussion

If the associated view supports selection, the exported item should reflect that selected subpart.

## Parameters

- **contentTypes**: The types of content that the view supports exporting and importing. An empty array means the view does not currently support exporting.
- **onExport**: A closure that will be called on request of the items by the shortcut or service.
- **onEdit**: A closure that will be called after the shortcut or service completes with its output data. This should replace the selected subpart that was exported with `onExport`. Return `false` to indicate that there was a failure to receive the items.





## Availability

- macOS 12.0



## See Also

- `importsItemProviders(_:onImport:)`
- `exportsItemProviders(_:onExport:)`
