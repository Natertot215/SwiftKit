---
url: https://developer.apple.com/documentation/swiftui/controlgroup
framework: SwiftUI
category: View groupings
title: ControlGroup
kind: struct
captured: 2026-05-02
---

# ControlGroup

A container view that displays semantically-related controls in a visually-appropriate manner for the context

## Declaration

```swift
struct ControlGroup<Content> where Content : View
```

### Overview

You can provide an optional label to this view that describes its children. This view may be used in different ways depending on the surrounding context. For example, when you place the control group in a toolbar item, SwiftUI uses the label when the group is moved to the toolbar’s overflow menu.

```swift
ContentView()
    .toolbar(id: "items") {
        ToolbarItem(id: "media") {
            ControlGroup {
                MediaButton()
                ChartButton()
                GraphButton()
            } label: {
                Label("Plus", systemImage: "plus")
            }
        }
    }
```





## Relationships

**Conforms To**: `View`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 17.0
- visionOS 1.0

## Topics

### Creating a control group

- `init(content:)`
- `init(content:label:)`
- `init(_:content:)`

### Creating a control group with an image

- `init(_:image:content:)`
- `init(_:systemImage:content:)`

### Creating a configured control group

- `init(_:)`

### Supporting types

- `LabeledControlGroupContent`

## See Also

- `controlGroupStyle(_:)`
