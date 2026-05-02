---
url: https://developer.apple.com/documentation/appkit/nsobjectcontroller
framework: AppKit
category: Cocoa bindings
title: NSObjectController
kind: class
captured: 2026-05-02
---

# NSObjectController

A controller that can manage an object’s properties referenced by key-value paths.

## Declaration

```swift
class NSObjectController
```

### Overview

`NSObjectController` is a Cocoa bindings–compatible controller class. Properties of the content object of instances of this class can be bound to user interface elements to access and modify their values.

By default, the content of an `NSObjectController` instance is an `NSMutableDictionary` object. This allows a single `NSObjectController` instance to be used to manage many different properties referenced by key-value paths. The default content object class can be changed by calling `NSObjectController/objectClass`, which subclasses must override. Your application should use a custom data class that is key-value compliant whenever possible.

#### Object Controllers, Entity Mode, and Lazy Fetching

`NSObjectController` and its subclasses, when in entity mode, can now fetch lazily. With lazy fetching enabled using the property `NSObjectController/usesLazyFetching`, the controller will try to fetch only a small amount of data from available persistent stores. This can provide a significant improvement in memory use when a large amount of content is stored on disk but just a subset of that data is required in memory.

When set to use lazy fetching, a controller will fetch objects in batches. You can change the default batch size for your application by setting a value for the the user default “`com.apple.CocoaBindings.LazyFetchBatchSize`”. If you have table views bound to an array controller set to use lazy fetching, the size of the controller’s batch size will grow as the table views’ visible row count grows.

Add, Insert, and Remove operations on controllers that use lazy fetching behave similarly to the same operations on a regular controller. The difference is that it is faster to sort an array controller using lazy fetching if:

- All of the keys in the `sortDescriptors` array are modeled, non transient properties.
- All of the selectors in the `sortDescriptors` array are `compare:` or `caseInsensitiveCompare:`.
- There are no changes in the controller’s managed object context





## Relationships

**Inherits From**: `NSController`

**Inherited By**: `NSArrayController`, `NSTreeController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSEditorRegistration`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Initializing an object controller

- `init(content:)`

### Managing content

- `content`
- `automaticallyPreparesContent`
- `prepareContent()`

### Setting the content class

- `objectClass`

### Managing objects

- `newObject()`
- `addObject(_:)`
- `removeObject(_:)`
- `add(_:)`
- `canAdd`
- `remove(_:)`
- `canRemove`

### Managing editing

- `isEditable`

### Core Data support

- `entityName`
- `fetch(_:)`
- `usesLazyFetching`
- `defaultFetchRequest()`
- `fetchPredicate`
- `managedObjectContext`
- `fetch(with:merge:)`

### Obtaining selections

- `selectedObjects`
- `selection`

### Validating user interface items

- `validateUserInterfaceItem(_:)`

### Initializers

- `init(coder:)`

## See Also

- `NSController`
