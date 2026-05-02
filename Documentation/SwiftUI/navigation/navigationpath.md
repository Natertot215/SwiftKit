---
url: https://developer.apple.com/documentation/swiftui/navigationpath
framework: SwiftUI
category: Navigation
title: NavigationPath
kind: struct
captured: 2026-05-01
---

# NavigationPath

## Declaration

```swift
struct NavigationPath
```

## Abstract

A type-erased list of data representing the content of a navigation stack.

## Overview

Manage the state of a `NavigationStack` by initializing the stack with a binding to a collection of data. The stack stores data items in the collection for each view on the stack.

When a stack displays views that rely on only one kind of data, you can use a standard collection like an array. If you need to present different kinds of data in a single stack, use a navigation path. The path uses type erasure so you can manage a collection of heterogeneous elements.

## Topics

### Creating a Navigation Path

- `init()` — Creates a new, empty navigation path.
- `init(_:)` — Creates a new navigation path from a serializable version.

### Managing Path Contents

- `isEmpty`
- `count`
- `append(_:)`
- `removeLast(_:)`

### Encoding a Path

- `codable`
- `CodableRepresentation`

## Serialize the Path

```swift
class MyModelObject: ObservableObject {
    @Published var path: NavigationPath

    static func readSerializedData() -> Data? { /* ... */ return nil }
    static func writeSerializedData(_ data: Data) { /* ... */ }

    init() {
        if let data = Self.readSerializedData() {
            do {
                let representation = try JSONDecoder().decode(
                    NavigationPath.CodableRepresentation.self,
                    from: data)
                self.path = NavigationPath(representation)
            } catch {
                self.path = NavigationPath()
            }
        } else {
            self.path = NavigationPath()
        }
    }

    func save() {
        guard let representation = path.codable else { return }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(representation)
            Self.writeSerializedData(data)
        } catch {
            // Handle error.
        }
    }
}
```

```swift
@StateObject private var pathState = MyModelObject()
@Environment(\.scenePhase) private var scenePhase

var body: some View {
    NavigationStack(path: $pathState.path) {
        // Add a root view here.
    }
    .onChange(of: scenePhase) { phase in
        if phase == .background {
            pathState.save()
        }
    }
}
```

## Availability

- iOS 16.0+, iPadOS 16.0+, Mac Catalyst 16.0+, macOS 13.0+, tvOS 16.0+, visionOS 1.0+, watchOS 9.0+

## See Also

- `NavigationStack`
- `View.navigationDestination(for:destination:)`
- `View.navigationDestination(isPresented:destination:)`
- `View.navigationDestination(item:destination:)`
