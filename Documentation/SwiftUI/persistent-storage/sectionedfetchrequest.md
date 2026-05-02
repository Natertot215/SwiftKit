---
url: https://developer.apple.com/documentation/swiftui/sectionedfetchrequest
framework: SwiftUI
category: Persistent storage
title: SectionedFetchRequest
kind: struct
captured: 2026-05-01
---

# SectionedFetchRequest

## Declaration

```swift
@MainActor
@propertyWrapper
@preconcurrency
struct SectionedFetchRequest<SectionIdentifier, Result>
where SectionIdentifier : Hashable, Result : NSFetchRequestResult
```

## Abstract

A property wrapper type that retrieves entities, grouped into sections, from a Core Data persistent store.

## Overview

Use a `SectionedFetchRequest` property wrapper to declare a `SectionedFetchResults` property that provides a grouped collection of Core Data managed objects to a SwiftUI view. If you don't need sectioning, use `FetchRequest` instead.

### Configuration

Configure a sectioned fetch request with an optional predicate and sort descriptors, and include a `sectionIdentifier` parameter to indicate how to group the fetched results. Be sure that you choose sorting and sectioning that work together to avoid discontiguous sections. For example, you can request a list of earthquakes, composed of `Quake` managed objects that the sample code project defines to store earthquake data, sorted by time and grouped by date:

```swift
@SectionedFetchRequest<String, Quake>(
    sectionIdentifier: \.day,
    sortDescriptors: [SortDescriptor(\.time, order: .reverse)]
)
private var quakes: SectionedFetchResults<String, Quake>
```

Always declare properties that have a sectioned fetch request wrapper as private. This lets the compiler help you avoid accidentally setting the property from the memberwise initializer of the enclosing view.

### Type Parameters

The request infers the entity type from the `Result` type that you specify, which is `Quake` in the example above. Indicate a `SectionIdentifier` type to declare the type found at the fetched object's `sectionIdentifier` key path. The section identifier type must conform to the `Hashable` protocol.

### Section Identifier Requirements

The example above depends on the `Quake` type having a `day` property that's either a stored or computed string. Be sure to mark any computed property with the `@objc` attribute for it to function as a section identifier. For best performance with large data sets, use stored properties.

### Managed Object Context

The sectioned fetch request and its results use the managed object context stored in the environment, which you can access using the `managedObjectContext` environment value. To support user interface activity, you typically rely on the `viewContext` property of a shared `NSPersistentContainer` instance. For example, you can set a context on your top-level content view using a shared container that you define as part of your model:

```swift
ContentView()
    .environment(
        \.managedObjectContext,
        QuakesProvider.shared.container.viewContext)
```

### Dynamic Configuration

When you need to dynamically change the section identifier, predicate, or sort descriptors, access the request's `Configuration` structure, either directly or with a binding.

## Conforms To

- `Copyable`
- `DynamicProperty`
- `Escapable`

## See Also

- `SectionedFetchResults` – A collection of results retrieved from a Core Data persistent store, grouped into sections.
- `FetchRequest` – A property wrapper type that retrieves entities from a Core Data persistent store.
- `FetchedResults` – A collection of results retrieved from a Core Data store.
- `EnvironmentValues.managedObjectContext` – The managed object context in the environment.
- Loading and Displaying a Large Data Feed – Sample code project
