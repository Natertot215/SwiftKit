---
url: https://developer.apple.com/documentation/swiftui/list
framework: SwiftUI
category: Lists
title: List
kind: struct
captured: 2026-05-02
---

# List

A container that presents rows of data arranged in a single column, optionally providing the ability to select one or more members.

## Declaration

```swift
@MainActor @preconcurrency struct List<SelectionValue, Content> where SelectionValue : Hashable, Content : View
```

### Overview

In its simplest form, a `List` creates its contents statically, as shown in the following example:

```swift
var body: some View {
    List {
        Text("A List Item")
        Text("A Second List Item")
        Text("A Third List Item")
    }
}
```

More commonly, you create lists dynamically from an underlying collection of data. The following example shows how to create a simple list from an array of an `Ocean` type which conforms to `Identifiable`:

```swift
struct Ocean: Identifiable {
    let name: String
    let id = UUID()
}

private var oceans = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]

var body: some View {
    List(oceans) {
        Text($0.name)
    }
}
```

#### Supporting selection in lists

To make members of a list selectable, provide a binding to a selection variable. Binding to a single instance of the list data’s `Identifiable.ID` type creates a single-selection list. Binding to a `Set` with a type that matches the list data’s `Identifiable.ID` type creates a list that supports multiple selections. The following example shows how to add multiselect to the previous example:

```swift
struct Ocean: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private var oceans = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]

@State private var multiSelection = Set<UUID>()

var body: some View {
    NavigationView {
        List(oceans, selection: $multiSelection) {
            Text($0.name)
        }
        .navigationTitle("Oceans")
        .toolbar { EditButton() }
    }
    Text("\(multiSelection.count) selections")
}
```

When people make a single selection by tapping or clicking, the selected cell changes its appearance to indicate the selection. To enable multiple selections with tap gestures, put the list into edit mode by either modifying the `EnvironmentValues/editMode` value, or adding an `EditButton` to your app’s interface. When you put the list into edit mode, the list shows a circle next to each list item. The circle contains a checkmark when the user selects the associated item. The example above uses an Edit button, which changes its title to Done while in edit mode:

People can make multiple selections without needing to enter edit mode on devices that have a keyboard and mouse or trackpad, like Mac and iPad.

#### Refreshing the list content

To make the content of the list refreshable using the standard refresh control, use the `View/refreshable(action:)` modifier.

The following example shows how to add a standard refresh control to a list. When the user drags the top of the list downward, SwiftUI reveals the refresh control and executes the specified action. Use an `await` expression inside the `action` closure to refresh your data. The refresh indicator remains visible for the duration of the awaited operation.

```swift
struct Ocean: Identifiable, Hashable {
     let name: String
     let id = UUID()
     let stats: [String: String]
 }

 class OceanStore: ObservableObject {
     @Published var oceans = [Ocean]()
     func loadStats() async {}
 }

 @EnvironmentObject var store: OceanStore

 var body: some View {
     NavigationView {
         List(store.oceans) { ocean in
             HStack {
                 Text(ocean.name)
                 StatsSummary(stats: ocean.stats) // A custom view for showing statistics.
             }
         }
         .refreshable {
             await store.loadStats()
         }
         .navigationTitle("Oceans")
     }
 }
```

#### Supporting multidimensional lists

To create two-dimensional lists, group items inside `Section` instances. The following example creates sections named after the world’s oceans, each of which has `Text` views named for major seas attached to those oceans. The example also allows for selection of a single list item, identified by the `id` of the example’s `Sea` type.

```swift
struct ContentView: View {
    struct Sea: Hashable, Identifiable {
        let name: String
        let id = UUID()
    }

    struct OceanRegion: Identifiable {
        let name: String
        let seas: [Sea]
        let id = UUID()
    }

    private let oceanRegions: [OceanRegion] = [
        OceanRegion(name: "Pacific",
                    seas: [Sea(name: "Australasian Mediterranean"),
                           Sea(name: "Philippine"),
                           Sea(name: "Coral"),
                           Sea(name: "South China")]),
        OceanRegion(name: "Atlantic",
                    seas: [Sea(name: "American Mediterranean"),
                           Sea(name: "Sargasso"),
                           Sea(name: "Caribbean")]),
        OceanRegion(name: "Indian",
                    seas: [Sea(name: "Bay of Bengal")]),
        OceanRegion(name: "Southern",
                    seas: [Sea(name: "Weddell")]),
        OceanRegion(name: "Arctic",
                    seas: [Sea(name: "Greenland")])
    ]

    @State private var singleSelection: UUID?

    var body: some View {
        NavigationView {
            List(selection: $singleSelection) {
                ForEach(oceanRegions) { region in
                    Section(header: Text("Major \(region.name) Ocean Seas")) {
                        ForEach(region.seas) { sea in
                            Text(sea.name)
                        }
                    }
                }
            }
            .navigationTitle("Oceans and Seas")
        }
    }
}
```

Because this example uses single selection, people can make selections outside of edit mode on all platforms.

> **NOTE:** In iOS 15, iPadOS 15, and tvOS 15 and earlier, lists support selection only in edit mode, even for single selections.

#### Creating hierarchical lists

You can also create a hierarchical list of arbitrary depth by providing tree-structured data and a `children` parameter that provides a key path to get the child nodes at any level. The following example uses a deeply-nested collection of a custom `FileItem` type to simulate the contents of a file system. The list created from this data uses collapsing cells to allow the user to navigate the tree structure.

```swift
struct ContentView: View {
    struct FileItem: Hashable, Identifiable, CustomStringConvertible {
        var id: Self { self }
        var name: String
        var children: [FileItem]? = nil
        var description: String {
            switch children {
            case nil:
                return "📄 \(name)"
            case .some(let children):
                return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
            }
        }
    }
    let fileHierarchyData: [FileItem] = [
      FileItem(name: "users", children:
        [FileItem(name: "user1234", children:
          [FileItem(name: "Photos", children:
            [FileItem(name: "photo001.jpg"),
             FileItem(name: "photo002.jpg")]),
           FileItem(name: "Movies", children:
             [FileItem(name: "movie001.mp4")]),
              FileItem(name: "Documents", children: [])
          ]),
         FileItem(name: "newuser", children:
           [FileItem(name: "Documents", children: [])
           ])
        ]),
        FileItem(name: "private", children: nil)
    ]
    var body: some View {
        List(fileHierarchyData, children: \.children) { item in
            Text(item.description)
        }
    }
}
```

#### Styling lists

SwiftUI chooses a display style for a list based on the platform and the view type in which it appears. Use the `View/listStyle(_:)` modifier to apply a different `ListStyle` to all lists within a view. For example, adding `.listStyle(.plain)` to the example shown in the “Creating Multidimensional Lists” topic applies the `ListStyle/plain` style, the following screenshot shows:





## Relationships

**Conforms To**: `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a list from a set of views

- `init(content:)`
- `init(selection:content:)`

### Creating a list from enumerated data

- `init(_:rowContent:)`
- `init(_:selection:rowContent:)`
- `init(_:id:rowContent:)`
- `init(_:id:selection:rowContent:)`

### Creating a list from hierarchical data

- `init(_:children:rowContent:)`
- `init(_:children:selection:rowContent:)`
- `init(_:id:children:rowContent:)`
- `init(_:id:children:selection:rowContent:)`

### Creating a list from editable data

- `init(_:editActions:rowContent:)`
- `init(_:editActions:selection:rowContent:)`
- `init(_:id:editActions:rowContent:)`
- `init(_:id:editActions:selection:rowContent:)`

### Supporting types

- `body`

## See Also

- `Displaying data in lists`
- `listStyle(_:)`
