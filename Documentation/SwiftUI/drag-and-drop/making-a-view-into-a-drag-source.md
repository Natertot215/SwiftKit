---
url: https://developer.apple.com/documentation/swiftui/making-a-view-into-a-drag-source
framework: SwiftUI
category: Drag and drop
title: Making a view into a drag source
kind: article
captured: 2026-05-01
---

# Making a View into a Drag Source

## Abstract
Adopt draggable API to provide items for drag-and-drop operations.

## Overview

When someone drags an onscreen visual representation of an item in your app, such as a photo, a Maps location, a Calendar event, or a text selection, the drag operation has some data associated with it, as well as a preview of the data that the system displays.

Add the `draggable(_:)` modifier to enable the view to function as a drag source, and provide a value that conforms to the `Transferable` protocol.

The `Transferable` protocol describes how you can serialize and deserialize your model object for sharing and data transfer. It provides a transfer representation by composing one or more of the Core Transferable framework's built-in `TransferRepresentation` types.

## Enable a View as a Drag Source

Use the `draggable(_:)` modifier to send or receive `Transferable` items within an app, among a collection of your own apps, or between your apps and other apps that support the import or export of a specified data format.

```swift
struct MyView: View {
    let name = "Mei Chen"
    
    var body: some View {
        Text(name)
            .draggable(name)
    }
}
```

Use the `draggable(_:preview:)` modifier to define a custom preview for the dragged item.

```swift
Text(name)
    .draggable(name) {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.yellow.gradient)
            Text("Drop \(name)")
                .font(.title)
                .foregroundStyle(.red)
        }
    }
```

To customize the lift preview that the system shows as it transitions to displaying your custom `preview`, apply a `contentShape(_:_:eoFill:)` modifier with a `dragPreview` kind. For example, you can change the preview's corner radius:

```swift
Text(name)
    .contentShape(.dragPreview, RoundedRectangle(cornerRadius: 7))
    .draggable(name) {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 300)
                .foregroundStyle(.yellow.gradient)
            Text("Drop \(name)")
                .font(.title)
                .foregroundStyle(.red)
        }
    }
```

## Create a Transferable Item for Drag-and-Drop Operations

To support drag operations of model objects, conform a model to the `Transferable` protocol to create a transferable item, and implement the `transferRepresentation` static property. Types like `String`, `Data`, `URL`, and `Image` already conform to `Transferable`, making them easy to use in drag-and-drop operations.

```swift
struct Profile: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var phoneNumber: String
}
```

```swift
extension Profile: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .profile)
        ProxyRepresentation(exporting: \.name)
    }
}
```

```swift
extension UTType {
    static var profile = UTType(exportedAs: "com.example.profile")
}
```

```swift
struct ContentView: View {
    @State private var profiles = [
        Profile(name: "Juan Chavez", phoneNumber: "(408) 555-4301"),
        Profile(name: "Mei Chen", phoneNumber: "(919) 555-2481")
    ]
    
    var body: some View {
        List {
            ForEach(profiles) { profile in
                Text(profile.name)
                    .draggable(profile)
            }
        }
    }
}
```

## Enable List Reordering

```swift
List {
    ForEach(profiles) { profile in
        Text(profile.name)
    }
    .onMove { indices, newOffset in
        profiles.move(fromOffsets: indices, toOffset: newOffset)
    }
}
```

To conditionally disable item reordering on a specific row, set `moveDisabled(_:)` to `true`.

## See Also

- Adopting drag and drop using SwiftUI
