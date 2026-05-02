---
url: https://developer.apple.com/documentation/swiftui/groupbox
framework: SwiftUI
category: View groupings
title: GroupBox
kind: struct
captured: 2026-05-02
---

# GroupBox

A stylized view, with an optional label, that visually collects a logical grouping of content.

## Declaration

```swift
struct GroupBox<Label, Content> where Label : View, Content : View
```

### Overview

Use a group box when you want to visually distinguish a portion of your user interface with an optional title for the boxed content.

The following example sets up a `GroupBox` with the label “End-User Agreement”, and a long `agreementText` string in a `Text` view wrapped by a `ScrollView`. The box also contains a `Toggle` for the user to interact with after reading the text.

```swift
var body: some View {
    GroupBox(label:
        Label("End-User Agreement", systemImage: "building.columns")
    ) {
        ScrollView(.vertical, showsIndicators: true) {
            Text(agreementText)
                .font(.footnote)
        }
        .frame(height: 100)
        Toggle(isOn: $userAgreed) {
            Text("I agree to the above terms")
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
- macOS 10.15
- visionOS 1.0

## Topics

### Creating a group box

- `init(content:)`
- `init(content:label:)`
- `init(_:content:)`

### Creating a group box from a configuration

- `init(_:)`

### Deprecated initializers

- `init(label:content:)`

## See Also

- `groupBoxStyle(_:)`
