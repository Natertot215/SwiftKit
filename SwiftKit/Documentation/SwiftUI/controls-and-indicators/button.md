---
url: https://developer.apple.com/documentation/swiftui/button
framework: SwiftUI
category: Controls and indicators
title: Button
kind: struct
captured: 2026-05-01
---

# Button

## Declaration

```swift
struct Button<Label> where Label : View
```

## Abstract

A control that initiates an action.

## Overview

You create a button by providing an action and a label. The action is either a method or closure property that does something when a user clicks or taps the button. The label is a view that describes the button's action — for example, by showing text, an icon, or both.

### Basic Usage

The label of a button can be any kind of view, such as a `Text` view for text-only labels:

```swift
Button(action: signIn) {
    Text("Sign In")
}
```

Or a `Label` view, for buttons with both a title and an icon:

```swift
Button(action: signIn) {
    Label("Sign In", systemImage: "arrow.up")
}
```

For common cases, you can use convenience initializers:

```swift
Button("Sign In", systemImage: "arrow.up", action: signIn)
```

### Adding Buttons to Containers

Buttons automatically adapt their visual style to match containers. For example, in a `List`:

```swift
List {
    ForEach(folders) { folder in
        Text(folder.title)
    }
    
    Button(action: addItem) {
        Label("Add Folder", systemImage: "folder.badge.plus")
    }
}
```

Or in a context menu:

```swift
.contextMenu {
    Button("Cut", action: cut)
    Button("Copy", action: copy)
    Button("Paste", action: paste)
}
```

### Assigning a Role

You can optionally initialize a button with a `ButtonRole` to characterize its purpose:

```swift
Button("Delete", role: .destructive, action: delete)
```

### Styling Buttons

Customize button appearance using standard button styles:

```swift
HStack {
    Button("Sign In", action: signIn)
    Button("Register", action: register)
}
.buttonStyle(.bordered)
```

You can create custom styles by conforming to `ButtonStyle` or `PrimitiveButtonStyle`.

## Availability

| Platform | Version |
|----------|---------|
| iOS | 13.0+ |
| iPadOS | 13.0+ |
| Mac Catalyst | 13.0+ |
| macOS | 10.15+ |
| tvOS | 13.0+ |
| visionOS | 1.0+ |
| watchOS | 6.0+ |

## Conforms To

- `View`

## See Also

- `buttonStyle(_:)` - Sets the button style
- `buttonBorderShape(_:)` - Sets the border shape for buttons
- `buttonRepeatBehavior(_:)` - Controls button repeat behavior
- `ButtonRole` - Describes the purpose of a button
- `ButtonRepeatBehavior` - Options for controlling action repeatability
- `ButtonBorderShape` - A shape used to draw a button's border
- `ButtonSizing` - The sizing behavior of buttons and button-like controls
