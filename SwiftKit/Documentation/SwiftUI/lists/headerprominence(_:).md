---
url: https://developer.apple.com/documentation/swiftui/view/headerprominence(_:)
framework: SwiftUI
category: Lists
title: headerProminence(_:)
kind: method
captured: 2026-05-02
---

# headerProminence(_:)

Sets the header prominence for this view.

## Declaration

```swift
nonisolated func headerProminence(_ prominence: Prominence) -> some View

```

### Discussion

In the following example, the section header appears with increased prominence:

```swift
List {
    Section(header: Text("Header")) {
        Text("Row")
    }
    .headerProminence(.increased)
}
.listStyle(.insetGrouped)
```

## Parameters

- **prominence**: The prominence to apply.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `headerProminence`
- `Prominence`
