---
url: https://developer.apple.com/documentation/swiftui/view/sectionactions(content:)
framework: SwiftUI
category: Navigation
title: sectionActions(content:)
kind: method
captured: 2026-05-02
---

# sectionActions(content:)

Adds custom actions to a section.

## Declaration

```swift
nonisolated func sectionActions<Content>(@ViewBuilder content: () -> Content) -> some View where Content : View

```

### Discussion

On iOS, the actions are displayed as items after the content of the section. On macOS, the actions are displayed when a user hovers over the section.

The following example adds an ‘Add’ button to the ‘Categories’ section.

```swift
List {
    Label("Home", systemImage: "house")
    Label("Alerts", systemImage: "bell")

    Section("Categories") {
        Label("Climate", systemImage: "fan")
        Label("Lights", systemImage: "lightbulb")
    }
    .sectionActions {
        Button("Add Category", systemImage: "plus") { }
    }
}
```







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 2.0



## See Also

- `TabPlacement`
- `TabContentBuilder`
- `TabContent`
- `AnyTabContent`
