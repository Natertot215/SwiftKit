---
url: https://developer.apple.com/documentation/appkit/nstreecontroller
framework: AppKit
category: Cocoa bindings
title: NSTreeController
kind: class
captured: 2026-05-02
---

# NSTreeController

A bindings-compatible controller that manages a tree of objects.

## Declaration

```swift
class NSTreeController
```

### Overview

The `NSTreeController` class provides selection and sort management. Its primary purpose is to act as the controller when binding `NSOutlineView` and `NSBrowser` instances to a hierarchical collection of objects. The root content object of the tree can be a single object, or an array of objects.

An `NSTreeController` object requires that you describe how the tree of objects is traversed by specifying the key-path for child objects specified by `NSTreeController/childrenKeyPath`. All child objects for the tree must be key-value coding compliant for the same child key path. If necessary, you should add properties to your model classes that map the child key name to the appropriate class-specific property name.

Child objects can implement a count method (specified to the tree controller using `NSTreeController/countKeyPath`) that, if provided, returns the number of child objects available. Your model objects are expected to update the value of the count key path in a key-value observing compliant method. Optionally, you can also provide a leaf key path using `NSTreeController/leafKeyPath` that specifies a key in your model object that returns `true` if the object is a leaf node, and `false` if it is not. Changes to the leaf node value of the child object should be made in a key-value observing compliant manner. Providing the leaf node key path can improve performance, because it prevents the `NSTreeController` from having to examine the child object to determine if it is a leaf node.

For more information about using NSTreeController in your app, see `navigating-hierarchical-data-using-outline-and-split-views`.





## Relationships

**Inherits From**: `NSObjectController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSEditorRegistration`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Managing Sort Descriptors

- `sortDescriptors`

### Setting the content

- `content`

### Arranging Objects

- `arrangedObjects`
- `rearrangeObjects()`

### Getting the current selection

- `setSelectionIndexPath(_:)`
- `selectionIndexPath`
- `setSelectionIndexPaths(_:)`
- `selectionIndexPaths`
- `selectedObjects`
- `selectedNodes`

### Managing Selections

- `selectsInsertedObjects`
- `addSelectionIndexPaths(_:)`
- `removeSelectionIndexPaths(_:)`
- `avoidsEmptySelection`
- `preservesSelection`
- `alwaysUsesMultipleValuesMarker`

### Adding, inserting and removing objects

- `add(_:)`
- `addChild(_:)`
- `canAddChild`
- `canInsert`
- `canInsertChild`
- `insert(_:)`
- `insertChild(_:)`
- `insert(_:atArrangedObjectIndexPath:)`
- `insert(_:atArrangedObjectIndexPaths:)`
- `remove(_:)`
- `removeObject(atArrangedObjectIndexPath:)`
- `removeObjects(atArrangedObjectIndexPaths:)`
- `move(_:to:)`
- `move(_:to:)`

### Specifying model attributes

- `childrenKeyPath`
- `childrenKeyPath(for:)`
- `countKeyPath`
- `countKeyPath(for:)`
- `leafKeyPath`
- `leafKeyPath(for:)`

## See Also

- `Navigating Hierarchical Data Using Outline and Split Views`
- `NSTreeNode`
