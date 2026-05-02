---
url: https://developer.apple.com/documentation/swiftui/navigationview
framework: SwiftUI
category: Navigation
title: NavigationView
kind: struct
captured: 2026-05-02
---

# NavigationView

A view for presenting a stack of views that represents a visible path in a navigation hierarchy.

## Declaration

```swift
struct NavigationView<Content> where Content : View
```

### Overview

Use a `NavigationView` to create a navigation-based app in which the user can traverse a collection of views. Users navigate to a destination view by selecting a `NavigationLink` that you provide. On iPadOS and macOS, the destination content appears in the next column. Other platforms push a new view onto the stack, and enable removing items from the stack with platform-specific controls, like a Back button or a swipe gesture.

Use the `NavigationView/init(content:)` initializer to create a navigation view that directly associates navigation links and their destination views:

```swift
NavigationView {
    List(model.notes) { note in
        NavigationLink(note.title, destination: NoteEditor(id: note.id))
    }
    Text("Select a Note")
}
```

Style a navigation view by modifying it with the `View/navigationViewStyle(_:)` view modifier. Use other modifiers, like `View/navigationTitle(_:)-avgj`, on views presented by the navigation view to customize the navigation interface for the presented view.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 13.0 (deprecated 26.5)
- iPadOS 13.0 (deprecated 26.5)
- Mac Catalyst 13.0 (deprecated 26.5)
- macOS 10.15 (deprecated 26.5)
- tvOS 13.0 (deprecated 26.5)
- visionOS 1.0 (deprecated 26.5)
- watchOS 7.0 (deprecated 26.5)

## Topics

### Creating a navigation view

- `init(content:)`

### Styling navigation views

- `navigationViewStyle(_:)`
- `NavigationViewStyle`

## See Also

- `tabItem(_:)`
