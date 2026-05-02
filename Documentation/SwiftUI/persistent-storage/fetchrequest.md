---
url: https://developer.apple.com/documentation/swiftui/fetchrequest
framework: SwiftUI
category: Persistent storage
title: FetchRequest
kind: struct
captured: 2026-05-01
---

# FetchRequest

## Declaration

```swift
@MainActor
@propertyWrapper
@preconcurrency
struct FetchRequest<Result> where Result : NSFetchRequestResult
```

## Abstract

A property wrapper type that retrieves entities from a Core Data persistent store.

## Overview

Use a `FetchRequest` property wrapper to declare a `FetchedResults` property that provides a collection of Core Data managed objects to a SwiftUI view. The request infers the entity type from the `Result` placeholder type that you specify. Condition the request with an optional predicate and sort descriptors. For example, you can create a request to list all `Quake` managed objects that the Loading and Displaying a Large Data Feed sample code project defines to store earthquake data, sorted by their `time` property:

```swift
@FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)])
private var quakes: FetchedResults<Quake> // Define Quake in your model.
```

Alternatively, when you need more flexibility, you can initialize the request with a configured `NSFetchRequest` instance:

```swift
@FetchRequest(fetchRequest: request)
private var quakes: FetchedResults<Quake>
```

Always declare properties that have a fetch request wrapper as private. This lets the compiler help you avoid accidentally setting the property from the memberwise initializer of the enclosing view.

The fetch request and its results use the managed object context stored in the environment, which you can access using the `managedObjectContext` environment value. To support user interface activity, you typically rely on the `viewContext` property of a shared `NSPersistentContainer` instance. For example, you can set a context on your top level content view using a shared container that you define as part of your model:

```swift
ContentView()
    .environment(
        \.managedObjectContext,
        QuakesProvider.shared.container.viewContext)
```

When you need to dynamically change the predicate or sort descriptors, access the request's `Configuration` structure. To create a request that groups the fetched results according to a characteristic that they share, use `SectionedFetchRequest` instead.

## Conforms To

- `Copyable`
- `DynamicProperty`
- `Escapable`
- `Sendable`
- `SendableMetatype`

## Availability

- iOS 13.0+
- iPadOS 13.0+
- Mac Catalyst 13.0+
- macOS 10.15+
- tvOS 13.0+
- visionOS 1.0+
- watchOS 6.0+

## See Also

- `FetchedResults`
- `SectionedFetchRequest`
- `SectionedFetchResults`
- `EnvironmentValues.managedObjectContext`
- Loading and displaying a large data feed (sample code)
