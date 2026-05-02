---
url: https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro
framework: SwiftUI
category: Model data
title: Migrating from the Observable Object Protocol to the Observable Macro
kind: article
captured: 2026-05-01
---

# Migrating from the Observable Object Protocol to the Observable Macro

## Abstract
Update your existing app to leverage the benefits of Observation in Swift.

## Overview

Starting with iOS 17, iPadOS 17, macOS 14, tvOS 17, and watchOS 10, SwiftUI provides support for **Observation**, a Swift-specific implementation of the observer design pattern. Adopting Observation provides your app with the following benefits:

- **Tracking optionals and collections of objects**, which isn't possible when using `ObservableObject`
- **Using existing data flow primitives** like `State` and `Environment` instead of object-based equivalents such as `StateObject` and `EnvironmentObject`
- **Improving performance** by updating views based only on changes to observable properties that a view's `body` reads, rather than any property changes to an observable object

---

## Use the Observable Macro

To adopt Observation in an existing app, replace `ObservableObject` in your data model type with the `@Observable` macro:

**Before:**
```swift
import SwiftUI

class Library: ObservableObject {
    // ...
}
```

**After:**
```swift
import SwiftUI

@Observable class Library {
    // ...
}
```

Then remove the `@Published` property wrapper from observable properties. Observation doesn't require a property wrapper to make a property observable—instead, the accessibility of the property in relationship to an observer determines whether a property is observable.

**Before:**
```swift
@Observable class Library {
    @Published var books: [Book] = [Book(), Book(), Book()]
}
```

**After:**
```swift
@Observable class Library {
    var books: [Book] = [Book(), Book(), Book()]
}
```

If you have properties that you don't want to track, apply the `@ObservationIgnored` macro to the property.

---

## Migrate Incrementally

You don't need to make a wholesale replacement throughout your app. You can make changes incrementally—start by changing one data model type to use the `@Observable` macro. Your app can mix data model types that use different observation systems.

**Note:** SwiftUI tracks changes differently based on the observation system used. With `Observable`, SwiftUI updates a view only when an observable property changes and the view's `body` reads the property directly. With `ObservableObject`, a view updates when any published property changes, even if the view doesn't read that property.

---

## Migrate Other Source Code

Once you've applied `@Observable` to your data model, update the code that manages instances of that model.

### Replace StateObject with State

Replace `@StateObject` with `@State` and update the environment modifier:

**Before:**
```swift
@main
struct BookReaderApp: App {
    @StateObject private var library = Library()

    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environmentObject(library)
        }
    }
}
```

**After:**
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

### Replace EnvironmentObject with Environment

Update views to use the `@Environment` property wrapper instead of `@EnvironmentObject`:

**Before:**
```swift
struct LibraryView: View {
    @EnvironmentObject var library: Library

    var body: some View {
        List(library.books) { book in
            BookView(book: book)
        }
    }
}
```

**After:**
```swift
struct LibraryView: View {
    @Environment(Library.self) private var library
    
    var body: some View {
        List(library.books) { book in
            BookView(book: book)
        }
    }
}
```

---

## Remove the ObservedObject Property Wrapper

Update your data model types to use `@Observable`:

**Before:**
```swift
class Book: ObservableObject, Identifiable {
    @Published var title = "Sample Book Title"
    
    let id = UUID()
}
```

**After:**
```swift
@Observable class Book: Identifiable {
    var title = "Sample Book Title"
    
    let id = UUID()
}
```

Remove `@ObservedObject` from views. When adopting Observation, SwiftUI automatically tracks any observable properties that a view's `body` reads directly:

**Before:**
```swift
struct BookView: View {
    @ObservedObject var book: Book
    @State private var isEditorPresented = false
    
    var body: some View {
        HStack {
            Text(book.title)
            Spacer()
            Button("Edit") {
                isEditorPresented = true
            }
        }
        .sheet(isPresented: $isEditorPresented) {
            BookEditView(book: book)
        }
    }
}
```

**After:**
```swift
struct BookView: View {
    var book: Book
    @State private var isEditorPresented = false
    
    var body: some View {
        HStack {
            Text(book.title)
            Spacer()
            Button("Edit") {
                isEditorPresented = true
            }
        }
        .sheet(isPresented: $isEditorPresented) {
            BookEditView(book: book)
        }
    }
}
```

### Using Bindable for Two-Way Binding

If a view needs a binding to an observable type, replace `@ObservedObject` with `@Bindable`:

**Before:**
```swift
struct BookEditView: View {
    @ObservedObject var book: Book
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack() {
            TextField("Title", text: $book.title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    dismiss()
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

**After:**
```swift
struct BookEditView: View {
    @Bindable var book: Book
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack() {
            TextField("Title", text: $book.title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    dismiss()
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

---

## See Also

- [Managing model data in your app](doc://com.apple.SwiftUI/documentation/SwiftUI/Managing-model-data-in-your-app)
- [Observable()](doc://com.apple.documentation/documentation/Observation/Observable())
- [Monitoring model data changes in your app](doc://com.apple.SwiftUI/documentation/SwiftUI/Monitoring-model-data-changes-in-your-app)
- [StateObject](doc://com.apple.SwiftUI/documentation/SwiftUI/StateObject)
- [ObservedObject](doc://com.apple.SwiftUI/documentation/SwiftUI/ObservedObject)
- [ObservableObject](doc://com.apple.documentation/documentation/Combine/ObservableObject)
