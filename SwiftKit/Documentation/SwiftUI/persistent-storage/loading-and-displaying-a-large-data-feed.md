---
url: https://developer.apple.com/documentation/swiftui/loading-and-displaying-a-large-data-feed
framework: SwiftUI
category: Persistent storage
title: Loading and Displaying a Large Data Feed
kind: article
captured: 2026-05-01
---

# Loading and Displaying a Large Data Feed

## Abstract
Consume data in the background, and lower memory use by batching imports and preventing duplicate records.

## Overview

This sample creates an app that shows a list of earthquakes recorded in the United States in the past 30 days by consuming a U.S. Geological Survey (USGS) real-time data feed.

To load the USGS JSON feed, perform either of the following:
- On iOS, pull to refresh the List
- On both iOS and macOS, press the refresh button (⌘R)

The app will load the requested data on the default delegate queue of URLSession, which is an operation queue that runs in the background. After the feed is downloaded and the session data task completes, the app continues working on this queue to import the large number of feed elements to the store without blocking the main queue.

---

## Import Data in the Background

To import data in the background, apps may use one or two managed object contexts. The sample uses two `NSManagedObjectContext` instances:

- **Main queue context** - Provides data to the user interface
- **Private queue context** - Performs the import on a background queue

Both contexts are connected to the same persistent store coordinator. This configuration is more efficient than using a nested context.

### Setting up the Core Data Stack

Create a main queue context using `NSPersistentContainer`:

```swift
let container = NSPersistentContainer(name: "Earthquakes")
```

Create a private queue context for background operations:

```swift
let taskContext = container.newBackgroundContext()
```

### Serializing Context Operations

When the feed download finishes, use the task context to consume the feed in the background. Every queue-based context has its own serial queue, and apps must serialize tasks that manipulate the context:

```swift
try await taskContext.perform {
    // Background import code
}
```

### Using Batch Insert for Efficiency

To efficiently handle large data sets, use `NSBatchInsertRequest` which accesses the store directly without interacting with the context or allocating managed objects:

```swift
let batchInsertRequest = self.newBatchInsertRequest(with: propertiesList)
if let fetchResult = try? taskContext.execute(batchInsertRequest),
   let batchInsertResult = fetchResult as? NSBatchInsertResult,
   let success = batchInsertResult.result as? Bool, success {
    return
}
```

---

## Merge Changes and Update the User Interface

Because `NSBatchInsertRequest` bypasses the context and doesn't trigger a `NSManagedObjectContextDidSaveNotification`, apps that need to update the UI have two options:

1. **Persistent History Tracking** - Parse the store's persistent history and merge relevant changes into the view context
2. **Re-fetch Data** - Reset the view context and fetch data again (if pinned to a query generation)

This sample uses persistent store remote change notifications and persistent history tracking because:
- The data model contains a single entity, so all changes are relevant
- `FetchRequest` fetches directly from the store
- SwiftUI only concerns itself with the view context

### Enable Remote Change Notifications

Set the `NSPersistentStoreRemoteChangeNotificationPostOptionKey` option on the store description:

```swift
description.setOption(true as NSNumber,
                      forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
```

### Enable Persistent History Tracking

Set the `NSPersistentHistoryTrackingKey` option:

```swift
description.setOption(true as NSNumber,
                      forKey: NSPersistentHistoryTrackingKey)
```

### Fetching and Merging History

Fetch persistent history transactions after a given token:

```swift
let changeRequest = NSPersistentHistoryChangeRequest.fetchHistory(after: lastToken)
let historyResult = try taskContext.execute(changeRequest) as? NSPersistentHistoryResult
if let history = historyResult?.result as? [NSPersistentHistoryTransaction] {
    return history
}
```

Merge changes back to the view context on the main queue:

```swift
let viewContext = container.viewContext
let tokens = await viewContext.perform {
    history.map { (transaction: NSPersistentHistoryTransaction) -> NSPersistentHistoryToken in
        viewContext.mergeChanges(fromContextDidSave: transaction.objectIDNotification())
        return transaction.token
    }
}
```

---

## Work in Batches to Lower Memory Footprint

When apps fetch or create objects in a context, Core Data caches them, which grows the memory footprint. `NSBatchInsertRequest` doesn't load data into memory, making it ideal for large datasets.

Disable automatic merging from the parent context:

```swift
container.viewContext.automaticallyMergesChangesFromParent = false
```

> **Note:** For systems earlier than iOS 13 or macOS 10.15, call `context.reset()` after processing each batch to manage memory.

---

## Prevent Duplicate Data in the Store

Every time the app reloads the JSON feed, it contains all earthquake records for the past month, creating duplicates. Use unique constraints to prevent duplicate records.

The `code` attribute uniquely identifies an earthquake record. Constrain the `Quake` entity on the `code` attribute in the data model editor:

1. Select the `Quake` entity in the data model editor
2. Add a new constraint by clicking the **+** button under the Constraints list
3. Enter the attribute name: `code`

When saving a new record, the store checks if a record already exists with the same constraint value. On conflict, an `NSMergeByPropertyObjectTrumpMergePolicy` applies, overwriting all fields in the existing record.

---

## See Also

### Accessing Core Data
- [EnvironmentValues.managedObjectContext](doc://com.apple.SwiftUI/documentation/SwiftUI/EnvironmentValues/managedObjectContext)
- [FetchRequest](doc://com.apple.SwiftUI/documentation/SwiftUI/FetchRequest)
- [FetchedResults](doc://com.apple.SwiftUI/documentation/SwiftUI/FetchedResults)
- [SectionedFetchRequest](doc://com.apple.SwiftUI/documentation/SwiftUI/SectionedFetchRequest)
- [SectionedFetchResults](doc://com.apple.SwiftUI/documentation/SwiftUI/SectionedFetchResults)
