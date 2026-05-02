---
url: https://developer.apple.com/documentation/swiftui/sectionedfetchresults
framework: SwiftUI
category: Persistent storage
title: SectionedFetchResults
kind: struct
captured: 2026-05-01
---

# SectionedFetchResults

## Declaration

```swift
@MainActor
@preconcurrency
struct SectionedFetchResults<SectionIdentifier, Result> where SectionIdentifier : Hashable, Result : NSFetchRequestResult
```

## Abstract

A collection of results retrieved from a Core Data persistent store, grouped into sections.

## Overview

Use a `SectionedFetchResults` instance to show or edit Core Data managed objects, grouped into sections, in your app's user interface. If you don't need sectioning, use `FetchedResults` instead.

You request a particular set of results by annotating the fetched results property declaration with a `SectionedFetchRequest` property wrapper. Indicate the type of the fetched entities with a `Results` type, and the type of the identifier that distinguishes the sections with a `SectionIdentifier` type. For example, you can create a request to list all `Quake` managed objects sorted by their `time` property and grouped by a string that represents the days when earthquakes occurred:

```swift
@SectionedFetchRequest<String, Quake>(
    sectionIdentifier: \.day,
    sortDescriptors: [SortDescriptor(\.time, order: .reverse)]
)
private var quakes: SectionedFetchResults<String, Quake>
```

The `quakes` property acts as a collection of `SectionedFetchResults.Section` instances, each containing a collection of `Quake` instances. The example above depends on the `Quake` model object declaring both `time` and `day` properties, either stored or computed. For best performance with large data sets, use stored properties.

The collection of sections, as well as the collection of managed objects in each section, conforms to the `RandomAccessCollection` protocol, so you can access them as you would any other collection. For example, you can create nested `ForEach` loops inside a `List` to iterate over the results:

```swift
List {
    ForEach(quakes) { section in
        Section(header: Text(section.id)) {
            ForEach(section) { quake in
                QuakeRow(quake: quake) // Displays information about a quake.
            }
        }
    }
}
```

Don't confuse the `Section` view that you use to create a hierarchical display with the `SectionedFetchResults.Section` instances that hold the fetched results.

When you need to dynamically change the request's section identifier, predicate, or sort descriptors, set the result instance's `sectionIdentifier`, `nsPredicate`, and `sortDescriptors` or `nsSortDescriptors` properties, respectively. Be sure that the sorting and sectioning work together to avoid discontinuous sections.

The fetch request and its results use the managed object context stored in the environment, which you can access using the `managedObjectContext` environment value. To support user interface activity, you typically rely on the `viewContext` property of a shared `NSPersistentContainer` instance. For example, you can set a context on your top-level content view using a container that you define as part of your model:

```swift
ContentView()
    .environment(
        \.managedObjectContext,
        QuakesProvider.shared.container.viewContext)
```

## Availability

- **iOS** 15.0+
- **iPadOS** 15.0+
- **Mac Catalyst** 15.0+
- **macOS** 12.0+
- **tvOS** 15.0+
- **visionOS** 1.0+
- **watchOS** 8.0+

## See Also

- `FetchedResults` — A collection of results retrieved from a Core Data store
- `FetchRequest` — A property wrapper type that retrieves entities from a Core Data persistent store
- `SectionedFetchRequest` — A property wrapper type that retrieves entities, grouped into sections, from a Core Data persistent store
- `EnvironmentValues.managedObjectContext` — The managed object context environment value
- Loading and displaying a large data feed (sample code)
