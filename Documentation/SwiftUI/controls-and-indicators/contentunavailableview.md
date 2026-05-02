---
url: https://developer.apple.com/documentation/swiftui/contentunavailableview
framework: SwiftUI
category: Controls and indicators
title: ContentUnavailableView
kind: struct
captured: 2026-05-01
---

# ContentUnavailableView

## Declaration

```swift
struct ContentUnavailableView<Label, Description, Actions> where Label : View, Description : View, Actions : View
```

## Abstract

An interface, consisting of a label and additional content, that you display when the content of your app is unavailable to users.

## Overview

It is recommended to use `ContentUnavailableView` in situations where a view's content cannot be displayed. That could be caused by a network error, a list without items, a search that returns no results etc.

You create a `ContentUnavailableView` in its simplest form, by providing a label and some additional content such as a description or a call to action:

```swift
ContentUnavailableView {
    Label("No Mail", systemImage: "tray.fill")
} description: {
    Text("New mails you receive will appear here.")
}
```

The system provides default `ContentUnavailableView`s that you can use in specific situations. The example below illustrates the usage of the `search` view:

```swift
struct ContentView: View {
    @ObservedObject private var viewModel = ContactsViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.searchResults) { contact in
                    NavigationLink {
                        ContactsView(contact)
                    } label: {
                        Text(contact.name)
                    }
                }
            }
            .navigationTitle("Contacts")
            .searchable(text: $viewModel.searchText)
            .overlay {
                if searchResults.isEmpty {
                    ContentUnavailableView.search
                }
            }
        }
    }
}
```

## Availability

- **iOS**: 17.0+
- **iPadOS**: 17.0+
- **Mac Catalyst**: 17.0+
- **macOS**: 14.0+
- **tvOS**: 17.0+
- **visionOS**: 1.0+
- **watchOS**: 10.0+

## See Also

### Creating an unavailable view

- `init(label:description:actions:)` - Creates an interface with a label and additional content
- `init(_:image:description:)` - Creates an interface with a title, image, and additional content
- `init(_:systemImage:description:)` - Creates an interface with a title, system icon image, and additional content

### Getting built-in unavailable views

- `search` - Creates a `ContentUnavailableView` instance that conveys a search state
- `search(text:)` - Creates a `ContentUnavailableView` instance that conveys a search state

### Supporting types

- `SearchUnavailableContent` - A structure that represents the body of a static placeholder search view
