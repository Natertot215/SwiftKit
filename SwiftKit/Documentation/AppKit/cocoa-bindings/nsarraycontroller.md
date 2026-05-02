---
url: https://developer.apple.com/documentation/appkit/nsarraycontroller
framework: AppKit
category: Cocoa bindings
title: NSArrayController
kind: class
captured: 2026-05-02
---

# NSArrayController

A bindings-compatible controller that manages a collection of objects.

## Declaration

```swift
class NSArrayController
```

### Overview

Typically the collection that an `NSArrayController` manages is an array, however, if the controller manages a relationship of a managed object (see `NSManagedObject`) the collection may be a set. `NSArrayController` provides selection management and sorting capabilities.





## Relationships

**Inherits From**: `NSObjectController`

**Inherited By**: `NSDictionaryController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSEditorRegistration`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Managing Sort Descriptors

- `sortDescriptors`

### Arranging Objects

- `arrange(_:)`
- `arrangedObjects`
- `rearrangeObjects()`

### Managing Content

- `add(_:)`

### Selection Attributes

- `avoidsEmptySelection`
- `preservesSelection`
- `alwaysUsesMultipleValuesMarker`

### Managing selections

- `selectionIndex`
- `setSelectionIndex(_:)`
- `selectsInsertedObjects`
- `setSelectionIndexes(_:)`
- `selectionIndexes`
- `addSelectionIndexes(_:)`
- `removeSelectionIndexes(_:)`
- `setSelectedObjects(_:)`
- `selectedObjects`
- `addSelectedObjects(_:)`
- `removeSelectedObjects(_:)`
- `selectNext(_:)`
- `canSelectNext`
- `selectPrevious(_:)`
- `canSelectPrevious`

### Inserting

- `canInsert`
- `insert(_:)`

### Adding and Removing Objects

- `addObject(_:)`
- `add(contentsOf:)`
- `insert(_:atArrangedObjectIndex:)`
- `insert(contentsOf:atArrangedObjectIndexes:)`
- `remove(atArrangedObjectIndex:)`
- `remove(atArrangedObjectIndexes:)`
- `remove(_:)`
- `removeObject(_:)`
- `remove(contentsOf:)`

### Filtering Content

- `clearsFilterPredicateOnInsertion`
- `filterPredicate`

### Automatic Content Rearranging

- `automaticallyRearrangesObjects`
- `automaticRearrangementKeyPaths`
- `didChangeArrangementCriteria()`
