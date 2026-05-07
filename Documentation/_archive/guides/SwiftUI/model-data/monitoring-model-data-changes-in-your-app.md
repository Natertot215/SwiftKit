---
url: https://developer.apple.com/documentation/swiftui/monitoring-model-data-changes-in-your-app
framework: SwiftUI
category: Model data
title: Monitoring Data Changes in Your App
kind: article
captured: 2026-05-01
---

# Monitoring Data Changes in Your App

## Abstract
Show changes to data in your app's user interface by using observable objects.

## Overview

You typically store and process data in your app using a data model that's separate from your app's user interface (UI) and other logic. The separation promotes modularity, improves testability, and makes it easier to reason about how your app works.

Traditionally, you use a view controller to move data back and forth between the model and the UI, but SwiftUI handles most of this synchronization for you. To update views when data changes, you make your data model classes observable objects, publish their properties, and declare instances of them using property wrappers. To ensure user-driven data changes flow back into the model, you bind UI controls to model properties. Working together, these features help you to maintain a single source of truth for your data.

> **Important**: This article explains how to observe model data changes in SwiftUI apps that have a minimum deployment target prior to iOS 17, iPadOS 17, macOS 14, tvOS 17, or watchOS 10. For newer OS versions, see [Migrating from the Observable Object protocol to the Observable macro](doc://com.apple.SwiftUI/documentation/SwiftUI/Migrating-from-the-observable-object-protocol-to-the-observable-macro).

---

## Make Model Data Observable

To make the data changes in your model visible to SwiftUI, adopt the `ObservableObject` protocol for model classes:

```swift
class Book: ObservableObject {
}
```

The system automatically infers the `ObjectWillChangePublisher` associated type and synthesizes the required `objectWillChange` method. To publish a property, add the `@Published` property wrapper:

```swift
class Book: ObservableObject {
    @Published var title = "Sample Book Title"
}
```

Avoid publishing properties unnecessarily. Only publish properties that both can change and matter to the UI:

```swift
class Book: ObservableObject {
    @Published var title = "Sample Book Title"

    let identifier = UUID() // A unique identifier that never changes.
}
```

---

## Monitor Changes in Observable Objects

To tell SwiftUI to monitor an observable object, add the `@ObservedObject` property wrapper:

```swift
struct BookView: View {
    @ObservedObject var book: Book
    
    var body: some View {
        Text(book.title)
    }
}
```

You can pass individual properties to child views or pass entire observable objects:

```swift
struct BookView: View {
    @ObservedObject var book: Book
    
    var body: some View {
        BookEditView(book: book)
    }
}

struct BookEditView: View {
    @ObservedObject var book: Book

    // ...
}
```

---

## Instantiate a Model Object in a View

SwiftUI might create or recreate a view at any time, so it's unsafe to create an observed object inside a view. Instead, use the `@StateObject` property wrapper:

```swift
struct LibraryView: View {
    @StateObject private var book = Book()
    
    var body: some View {
        BookView(book: book)
    }
}
```

A state object behaves like an observed object, except that SwiftUI creates and manages a single object instance for a given view instance, regardless of how many times it recreates the view.

Each view instance gets a unique object instance:

```swift
VStack {
    LibraryView()
    LibraryView()
}
```

You can also create a state object in your top-level `App` or `Scene` instance:

```swift
@main
struct BookReader: App {
    @StateObject private var library = Library()

    // ...
}
```

---

## Share an Object Throughout Your App

Use the `environmentObject(_:)` view modifier to put an object into the environment:

```swift
@main
struct BookReader: App {
    @StateObject private var library = Library()
    
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environmentObject(library)
        }
    }
}
```

Any descendant view can access the object using the `@EnvironmentObject` property wrapper:

```swift
struct LibraryView: View {
    @EnvironmentObject var library: Library
    
    // ...
}
```

Remember to add the environment object to preview providers:

```swift
struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(Library())
    }
}
```

---

## Create a Two-Way Connection Using Bindings

When you allow a person to change the data in the UI, use a binding to ensure updates flow back into the data model. Get a binding by prefixing the object name with a dollar sign (`$`):

```swift
struct BookEditView: View {
    @ObservedObject var book: Book
    
    var body: some View {
        TextField("Title", text: $book.title)
    }
}
```

---

## See Also

**Creating model data**
- [Managing model data in your app](doc://com.apple.SwiftUI/documentation/SwiftUI/Managing-model-data-in-your-app)
- [Migrating from the Observable Object protocol to the Observable macro](doc://com.apple.SwiftUI/documentation/SwiftUI/Migrating-from-the-observable-object-protocol-to-the-observable-macro)
- [Observable()](doc://com.apple.documentation/documentation/Observation/Observable())
- [StateObject](doc://com.apple.SwiftUI/documentation/SwiftUI/StateObject)
- [ObservedObject](doc://com.apple.SwiftUI/documentation/SwiftUI/ObservedObject)
- [ObservableObject](doc://com.apple.documentation/documentation/Combine/ObservableObject)
