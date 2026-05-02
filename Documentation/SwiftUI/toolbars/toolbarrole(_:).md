---
url: https://developer.apple.com/documentation/swiftui/view/toolbarrole(_:)
framework: SwiftUI
category: Toolbars
title: toolbarRole(_:)
kind: method
captured: 2026-05-02
---

# toolbarRole(_:)

Configures the semantic role for the content populating the toolbar.

## Declaration

```swift
nonisolated func toolbarRole(_ role: ToolbarRole) -> some View

```

### Discussion

Use this modifier to configure the semantic role for content populating your app’s toolbar. SwiftUI uses this role when rendering the content of your app’s toolbar.

```swift
ContentView()
    .navigationTitle("Browser")
    .toolbarRole(.browser)
    .toolbar {
        ToolbarItem(placement: .primaryAction) {
            AddButton()
        }
     }
```

## Parameters

- **role**: The role of the toolbar.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `ToolbarRole`
