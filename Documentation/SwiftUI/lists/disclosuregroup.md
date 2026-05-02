---
url: https://developer.apple.com/documentation/swiftui/disclosuregroup
framework: SwiftUI
category: Lists
title: DisclosureGroup
kind: struct
captured: 2026-05-02
---

# DisclosureGroup

A view that shows or hides another content view, based on the state of a disclosure control.

## Declaration

```swift
struct DisclosureGroup<Label, Content> where Label : View, Content : View
```

### Overview

A disclosure group view consists of a label to identify the contents, and a control to show and hide the contents. Showing the contents puts the disclosure group into the “expanded” state, and hiding them makes the disclosure group “collapsed”.

In the following example, a disclosure group contains two toggles and an embedded disclosure group. The top level disclosure group exposes its expanded state with the bound property, `topLevelExpanded`. By expanding the disclosure group, the user can use the toggles to update the state of the `toggleStates` structure.

```swift
struct ToggleStates {
    var oneIsOn: Bool = false
    var twoIsOn: Bool = true
}
@State private var toggleStates = ToggleStates()
@State private var topExpanded: Bool = true

var body: some View {
    DisclosureGroup("Items", isExpanded: $topExpanded) {
        Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
        Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
        DisclosureGroup("Sub-items") {
            Text("Sub-item 1")
        }
    }
}
```





## Relationships

**Conforms To**: `View`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Creating a disclosure group

- `init(_:content:)`
- `init(content:label:)`
- `init(_:isExpanded:content:)`
- `init(isExpanded:content:label:)`

## See Also

- `OutlineGroup`
- `disclosureGroupStyle(_:)`
