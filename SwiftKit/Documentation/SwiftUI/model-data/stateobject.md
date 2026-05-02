---
url: https://developer.apple.com/documentation/swiftui/stateobject
framework: SwiftUI
category: Model data
title: StateObject
kind: struct
captured: 2026-05-01
---

# StateObject

## Declaration

```swift
@MainActor @frozen @propertyWrapper @preconcurrency
struct StateObject<ObjectType> where ObjectType : ObservableObject
```

## Abstract

A property wrapper type that instantiates an observable object.

## Overview

Use a state object as the single source of truth for a reference type that you store in a view hierarchy. Create a state object in an `App`, `Scene`, or `View` by applying the `@StateObject` attribute to a property declaration and providing an initial value that conforms to the `ObservableObject` protocol. Declare state objects as private to prevent setting them from a memberwise initializer, which can conflict with the storage management that SwiftUI provides:

```swift
class DataModel: ObservableObject {
    @Published var name = "Some Name"
    @Published var isEnabled = false
}

struct MyView: View {
    @StateObject private var model = DataModel() // Create the state object.

    var body: some View {
        Text(model.name) // Updates when the data model changes.
        MySubView()
            .environmentObject(model)
    }
}
```

SwiftUI creates a new instance of the model object only once during the lifetime of the container that declares the state object. For example, SwiftUI doesn't create a new instance if a view's inputs change, but does create a new instance if the identity of a view changes. When published properties of the observable object change, SwiftUI updates any view that depends on those properties, like the `Text` view in the above example.

> **Note:** If you need to store a value type, like a structure, string, or integer, use the `State` property wrapper instead. Also use `State` if you need to store a reference type that conforms to the `Observable` protocol.

### Share state objects with subviews

You can pass a state object into a subview through a property that has the `ObservedObject` attribute. Alternatively, add the object to the environment of a view hierarchy by applying the `environmentObject(_:)` modifier to a view, like `MySubView` in the above code. You can then read the object inside `MySubView` or any of its descendants using the `EnvironmentObject` attribute:

```swift
struct MySubView: View {
    @EnvironmentObject var model: DataModel

    var body: some View {
        Toggle("Enabled", isOn: $model.isEnabled)
    }
}
```

Get a `Binding` to the state object's properties using the dollar sign (`$`) operator. Use a binding when you want to create a two-way connection. In the above code, the `Toggle` controls the model's `isEnabled` value through a binding.

### Initialize state objects using external data

When a state object's initial state depends on data that comes from outside its container, you can call the object's initializer explicitly from within its container's initializer. For example, suppose the data model from the previous example takes a `name` input during initialization and you want to use a value for that name that comes from outside the view. You can do this with a call to the state object's initializer inside an explicit initializer that you create for the view:

```swift
struct MyInitializableView: View {
    @StateObject private var model: DataModel

    init(name: String) {
        // SwiftUI ensures that the following initialization uses the
        // closure only once during the lifetime of the view, so
        // later changes to the view's name input have no effect.
        _model = StateObject(wrappedValue: DataModel(name: name))
    }

    var body: some View {
        VStack {
            Text("Name: \(model.name)")
        }
    }
}
```

> **Important:** Even for a configurable state object, you still declare it as private. This ensures that you can't accidentally set the parameter through a memberwise initializer of the view, because doing so can conflict with the framework's storage management and produce unexpected results.

### Force reinitialization by changing view identity

If you want SwiftUI to reinitialize a state object when a view input changes, make sure that the view's identity changes at the same time. One way to do this is to bind the view's identity to the value that changes using the `id(_:)` modifier. For example, you can ensure that the identity of an instance of `MyInitializableView` changes when its `name` input changes:

```swift
MyInitializableView(name: name)
    .id(name) // Binds the identity of the view to the name property.
```

If you need the view to reinitialize state based on changes in more than one value, you can combine the values into a single identifier using a `Hasher`. For example, if you want to update the data model in `MyInitializableView` when the values of either `name` or `isEnabled` change, you can combine both variables into a single hash:

```swift
var hash: Int {
    var hasher = Hasher()
    hasher.combine(name)
    hasher.combine(isEnabled)
    return hasher.finalize()
}
```

Then apply the combined hash to the view as an identifier:

```swift
MyInitializableView(name: name, isEnabled: isEnabled)
    .id(hash)
```

## Availability

- **iOS** 14.0+
- **iPadOS** 14.0+
- **Mac Catalyst** 14.0+
- **macOS** 11.0+
- **tvOS** 14.0+
- **visionOS** 1.0+
- **watchOS** 7.0+

## See Also

- `ObservedObject`
- `EnvironmentObject`
- `State`
- `Binding`
- [Managing model data in your app](https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app)
- [Monitoring data changes in your app](https://developer.apple.com/documentation/swiftui/monitoring-model-data-changes-in-your-app)
