---
url: https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app
framework: SwiftUI
category: Model data
title: Managing Model Data in Your App
kind: article
captured: 2026-05-01
---

# Managing Model Data in Your App

## Overview

A SwiftUI app can display data that people can change using the app's user interface (UI). To manage that data, an app creates a data model, which is a custom type that represents the data. A data model provides separation between the data and the views that interact with the data. This separation promotes modularity, improves testability, and helps make it easier to reason about how the app works.

Keeping the model data (that is, an instance of a data model) in sync with what appears on the screen can be challenging, especially when the data appears in multiple views of the UI at the same time.

SwiftUI helps keep your app's UI up to date with changes made to the data thanks to **Observation**. With Observation, a view in SwiftUI can form dependencies on observable data models and update the UI when data changes.

> **Note:** Observation support in SwiftUI is available starting with iOS 17, iPadOS 17, macOS 14, tvOS 17, and watchOS 10.

---

## Make Model Data Observable

To make data changes visible to SwiftUI, apply the `@Observable` macro to your data model. This macro generates code that adds observation support to your data model at compile time, keeping your data model code focused on the properties that store data.

```swift
@Observable class Book: Identifiable {
    var title = "Sample Book Title"
    var author = Author()
    var isAvailable = true
}
```

> **Important:** The `@Observable` macro, in addition to adding observation functionality, also conforms your data model type to the `Observable` protocol, which serves as a signal to other APIs that your type supports observation. Don't apply the `Observable` protocol by itself to your data model type, since that alone doesn't add any observation functionality. Instead, always use the `Observable` macro when adding observation support to your type.

---

## Observe Model Data in a View

In SwiftUI, a view forms a dependency on an observable data model object when the view's `body` property reads a property of the object. If `body` doesn't read any properties of an observable data model object, the view doesn't track any dependencies.

When a tracked property changes, SwiftUI updates the view. If other properties change that `body` doesn't read, the view is unaffected and avoids unnecessary updates.

```swift
struct BookView: View {
    var book: Book
    
    var body: some View {
        Text(book.title)
    }
}
```

SwiftUI establishes this dependency tracking even if the view doesn't store the observable type, such as when using a global property or singleton:

```swift
var globalBook: Book = Book()

struct BookView: View {
    var body: some View {
        Text(globalBook.title)
    }
}
```

### Observation with Computed Properties

Observation also supports tracking of computed properties when the computed property makes use of an observable property:

```swift
@Observable class Library {
    var books: [Book] = [Book(), Book(), Book()]
    
    var availableBooksCount: Int {
        books.filter(\.isAvailable).count
    }
}

struct LibraryView: View {
    @Environment(Library.self) private var library
    
    var body: some View {
        NavigationStack {
            List(library.books) { book in
                // ...
            }
            .navigationTitle("Books available: \(library.availableBooksCount)")
        }
    }
}
```

### Collection Tracking

When a view forms a dependency on a collection of objects, the view tracks changes made to the collection itself. For instance, the following view forms a dependency on `books` because `body` reads it. As changes occur to `books`, such as inserting, deleting, moving, or replacing items in the collection, SwiftUI updates the view:

```swift
struct LibraryView: View {
    @State private var books = [Book(), Book(), Book()]

    var body: some View {
        List(books) { book in 
            Text(book.title)
        }
    }
}
```

However, `LibraryView` doesn't form a dependency on the property `title` because the view's `body` doesn't read it directly. Instead, each `Text` item of the list depends on `title`. Any changes to a `title` updates only the individual `Text` representing the book and not the others.

### Sharing Observable Models

You can also share an observable model data object with another view. The receiving view forms a dependency if it reads any properties of the object in its `body`:

```swift
struct LibraryView: View {
    @State private var books = [Book(), Book(), Book()]

    var body: some View {
        List(books) { book in 
            BookView(book: book)
        }
    }
}

struct BookView: View {
    var book: Book
    
    var body: some View {
        Text(book.title)
    }
}
```

### Intermediate Views

If a view doesn't have any dependencies, SwiftUI doesn't update the view when data changes. This approach allows an observable model data object to pass through multiple layers of a view hierarchy without each intermediate view forming a dependency:

```swift
// Will not update when any property of `book` changes.
struct LibraryView: View {
    @State private var books = [Book(), Book(), Book()]
    
    var body: some View {
        List(books) { book in 
            LibraryItemView(book: book)
        }
    }
}

// Will not update when any property of `book` changes.
struct LibraryItemView: View {
    var book: Book
    
    var body: some View {
        BookView(book: book)
    }
}

// Will update when `book.title` changes.
struct BookView: View {
    var book: Book
    
    var body: some View {
        Text(book.title)
    }
}
```

### Nested Observable Objects

A view can also form a dependency on an observable data model object accessed through another object:

```swift
struct LibraryItemView: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
            Text("Written by: \(book.author.name)")
                .font(.caption)
        }
    }
}
```

---

## Create the Source of Truth for Model Data

To create and store the source of truth for model data, declare a private variable and initialize it with an instance of an observable data model type. Then wrap it with a `@State` property wrapper:

```swift
struct BookView: View {
    @State private var book = Book()
    
    var body: some View {
        Text(book.title)
    }
}
```

By wrapping the book with `@State`, you're telling SwiftUI to manage the storage of the instance. Each time SwiftUI re-creates `BookView`, it connects the `book` variable to the managed instance, providing the view a single source of truth for the model data.

You can also create a state object in your top-level `App` instance or in one of your app's `Scene` instances:

```swift
@main
struct BookReaderApp: App {
    @State private var library = Library()
    
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environment(library)
        }
    }
}
```

---

## Share Model Data Throughout a View Hierarchy

If you have a data model object, like `Library`, that you want to share throughout your app, you can either:

- Pass the data model object to each view in the view hierarchy, or
- Add the data model object to the view's environment

### Using Custom Environment Keys

Before you can use the `environment(_:_:)` modifier, you need to create a custom `EnvironmentKey`. Then extend `EnvironmentValues` to include a custom environment property:

```swift
extension EnvironmentValues {
    var library: Library {
        get { self[LibraryKey.self] }
        set { self[LibraryKey.self] = newValue }
    }
}

private struct LibraryKey: EnvironmentKey {
    static let defaultValue: Library = Library()
}
```

With the custom environment key in place, add model data to the environment:

```swift
@main
struct BookReaderApp: App {
    @State private var library = Library()
    
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environment(\.library, library)
        }
    }
}
```

Retrieve the instance from the environment:

```swift
struct LibraryView: View {
    @Environment(\.library) private var library

    var body: some View {
        // ...
    }
}
```

### Using Type-Based Environment Storage

You can also store model data directly in the environment without defining a custom environment value by using the `environment(_:)` modifier:

```swift
@main
struct BookReaderApp: App {
    @State private var library = Library()
    
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environment(library)
        }
    }
}
```

Retrieve the instance using the type as the key:

```swift
struct LibraryView: View {
    @Environment(Library.self) private var library
    
    var body: some View {
        // ...
    }
}
```

By default, reading an object from the environment returns a non-optional object when using the object type as the key. If a view attempts to retrieve an object that isn't in the environment, SwiftUI throws an exception.

For cases where there is no guarantee that an object is in the environment, retrieve an optional version:

```swift
@Environment(Library.self) private var library: Library?
```

---

## Change Model Data in a View

In most apps, people can change data that the app presents. With Observation in SwiftUI, a view can support data changes without using property wrappers or bindings:

```swift
struct BookView: View {
    var book: Book
    
    var body: some View {
        List {
            Text(book.title)
            HStack {
                Text(book.isAvailable ? "Available for checkout" : "Waiting for return")
                Spacer()
                Button(book.isAvailable ? "Check out" : "Return") {
                    book.isAvailable.toggle()
                }
            }
        }
    }
}
```

### Using Bindings with @Bindable

When a view expects a binding before it can change the value of a mutable property, wrap the model data with the `@Bindable` property wrapper:

```swift
struct BookEditView: View {
    @Bindable var book: Book
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack() {
            HStack {
                Text("Title")
                TextField("Title", text: $book.title)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        dismiss()
                    }
            }
            
            Toggle(isOn: $book.isAvailable) {
                Text("Book is available")
            }
            
            Button("Close") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
```

You can use the `@Bindable` property wrapper on properties and variables to an `Observable` object, including global variables, properties that exist outside of SwiftUI types, or even local variables:

```swift
struct LibraryView: View {
    @State private var books = [Book(), Book(), Book()]

    var body: some View {
        List(books) { book in 
            @Bindable var book = book
            TextField("Title", text: $book.title)
        }
    }
}
```

---

## See Also

### Creating Model Data

- [Migrating from the Observable Object protocol to the Observable macro](https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro)
- [Observable() macro](https://developer.apple.com/documentation/Observation/Observable())
- [Monitoring data changes in your app](https://developer.apple.com/documentation/swiftui/monitoring-model-data-changes-in-your-app)
- [StateObject](https://developer.apple.com/documentation/swiftui/stateobject)
- [ObservedObject](https://developer.apple.com/documentation/swiftui/observedobject)
- [ObservableObject](https://developer.apple.com/documentation/Combine/ObservableObject)
