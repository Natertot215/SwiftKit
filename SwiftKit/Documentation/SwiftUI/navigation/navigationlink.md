---
url: https://developer.apple.com/documentation/swiftui/navigationlink
framework: SwiftUI
category: Navigation
title: NavigationLink
kind: struct
captured: 2026-05-01
---

# NavigationLink

## Declaration

```swift
struct NavigationLink<Label, Destination> where Label : View, Destination : View
```

## Abstract

A view that controls a navigation presentation.

## Overview

People click or tap a navigation link to present a view inside a `NavigationStack` or `NavigationSplitView`. You control the visual appearance of the link by providing view content in the link's `label` closure.

## Usage Examples

### Basic Text Link

```swift
NavigationLink("Work Folder") {
    FolderDetail(id: workFolder.id)
}
```

### Link with Label and Icon

```swift
NavigationLink {
    FolderDetail(id: workFolder.id)
} label: {
    Label("Work Folder", systemImage: "folder")
}
```

### List with Destinations

```swift
NavigationStack {
    List {
        NavigationLink("Mint") { ColorDetail(color: .mint) }
        NavigationLink("Pink") { ColorDetail(color: .pink) }
        NavigationLink("Teal") { ColorDetail(color: .teal) }
    }
    .navigationTitle("Colors")
}
```

### Presentation Link with Value

```swift
NavigationStack {
    List {
        NavigationLink("Mint", value: Color.mint)
        NavigationLink("Pink", value: Color.pink)
    }
    .navigationDestination(for: Color.self) { color in
        ColorDetail(color: color)
    }
}
```

### Programmatic Navigation

```swift
@State private var colors: [Color] = []

NavigationStack(path: $colors) {
    // Navigation content
}

func showBlue() {
    colors.append(.blue)
}
```

### Coordinate with List Selection

```swift
let colors: [Color] = [.mint, .pink, .teal]
@State private var selection: Color?

var body: some View {
    NavigationSplitView {
        List(colors, id: \.self, selection: $selection) { color in
            NavigationLink(color.description, value: color)
        }
    } detail: {
        if let color = selection {
            ColorDetail(color: color)
        } else {
            Text("Pick a color")
        }
    }
}
```

## Initializers

- `init(_:destination:)`
- `init(destination:label:)`
- `init(_:value:)`
- `init(value:label:)`

## Modifiers

- `isDetailLink(_:)`

## Availability

- iOS 13.0+, iPadOS 13.0+, macOS 10.15+, Mac Catalyst 13.0+, tvOS 13.0+, watchOS 6.0+, visionOS 1.0+

## See Also

- Bringing robust navigation structure to your SwiftUI app
- Migrating to new navigation types
- Understanding the navigation stack
- `NavigationStack`
- `NavigationSplitView`
