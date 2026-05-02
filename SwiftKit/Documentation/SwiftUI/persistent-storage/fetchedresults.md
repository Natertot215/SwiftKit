---
url: https://developer.apple.com/documentation/swiftui/fetchedresults
framework: SwiftUI
category: Persistent storage
title: FetchedResults
kind: struct
captured: 2026-05-01
---

# FetchedResults

## Declaration

```swift
@MainActor
@preconcurrency
struct FetchedResults<Result> where Result : NSFetchRequestResult
```

## Abstract

A collection of results retrieved from a Core Data store.

## Overview

Use a `FetchedResults` instance to show or edit Core Data managed objects in your app's user interface. You request a particular set of results by specifying a `Result` type as the entity type, and annotating the fetched results property declaration with a `FetchRequest` property wrapper. For example, you can create a request to list all `Quake` managed objects that the [Loading and displaying a large data feed](/documentation/swiftui/loading-and-displaying-a-large-data-feed) sample code project defines to store earthquake data, sorted by their `time` property:

```swift
@FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)])
private var quakes: FetchedResults<Quake>
```

The results instance conforms to `RandomAccessCollection`, so you access it like any other collection. For example, you can create a `List` that iterates over all the results:

```swift
List(quakes) { quake in
    NavigationLink(destination: QuakeDetail(quake: quake)) {
        QuakeRow(quake: quake)
    }
}
```

When you need to dynamically change the request's predicate or sort descriptors, set the result instance's `nsPredicate` and `sortDescriptors` or `nsSortDescriptors` properties, respectively.

The fetch request and its results use the managed object context stored in the environment, which you can access using the `managedObjectContext` environment value. To support user interface activity, you typically rely on the `viewContext` property of a shared `NSPersistentContainer` instance. For example, you can set a context on your top level content view using a container that you define as part of your model:

```swift
ContentView()
    .environment(
        \.managedObjectContext,
        QuakesProvider.shared.container.viewContext)
```

## Conformance

Conforms to:
- `BidirectionalCollection`
- `Collection`
- `RandomAccessCollection`
- `Sendable`
- `SendableMetatype`
- `Sequence`

## Topics

### Configuring the associated fetch request
- `nsPredicate` — The request's predicate.
- `sortDescriptors` — The request's sort descriptors, accessed as value types.
- `nsSortDescriptors` — The request's sort descriptors, accessed as reference types.

### Getting indices
- `startIndex` — The index of the first entity in the results collection.
- `endIndex` — The index that's one greater than the last valid subscript argument.

### Getting results
- `subscript(_:)` — Gets the entity at the specified index.

## Availability

- iOS 13.0+
- iPadOS 13.0+
- Mac Catalyst 13.0+
- macOS 10.15+
- tvOS 13.0+
- visionOS 1.0+
- watchOS 6.0+

## See Also

- `FetchRequest` — A property wrapper type that retrieves entities from a Core Data persistent store.
- `SectionedFetchRequest` — A property wrapper type that retrieves entities, grouped into sections, from a Core Data persistent store.
- `SectionedFetchResults` — A collection of results retrieved from a Core Data persistent store, grouped into sections.
- `managedObjectContext` — Environment value for the Core Data managed object context.
- [Loading and displaying a large data feed](/documentation/swiftui/loading-and-displaying-a-large-data-feed) — Sample code project
