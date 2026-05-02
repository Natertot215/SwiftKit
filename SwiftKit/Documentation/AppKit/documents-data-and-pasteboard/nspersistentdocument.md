---
url: https://developer.apple.com/documentation/appkit/nspersistentdocument
framework: AppKit
category: Documents, data, and pasteboard
title: NSPersistentDocument
kind: class
captured: 2026-05-02
---

# NSPersistentDocument

A document object that can integrate with Core Data.

## Declaration

```swift
class NSPersistentDocument
```

### Overview

The `NSPersistentDocument` class is a subclass of `NSDocument` that is designed to easily integrate into the Core Data framework. It provides methods to access a document-wide `NSManagedObjectContext` object, and provides default implementations of methods to read and write files using the persistence framework. In a persistent document, the undo manager functionality is taken over by managed object context.

Standard document behavior is implemented as follows:

- Opening a document invokes `NSPersistentDocument/configurePersistentStoreCoordinator(for:ofType:modelConfiguration:storeOptions:)` with the new URL, and adds a store of the default type (XML). Objects are loaded from the persistent store on demand through the document’s context.
- Saving a new document adds a store of the default type with the chosen URL and invokes save: on the context. For an existing document, a save just invokes `NSManagedObjectContext/save()` on the context.
- Save As for a new document simply invokes save. For an opened document, it migrates the persistent store to the new URL and invokes `NSManagedObjectContext/save()` on the context.
- Revert resets the document’s managed object context. Objects are subsequently loaded from the persistent store on demand, as with opening a new document.

By default an `NSPersistentDocument` instance creates its own ready-to-use persistence stack including managed object context, persistent object store coordinator and persistent store. There is a one-to-one mapping between the document and the backing object store.

You can customize the architecture of the persistence stack by overriding the `NSPersistentDocument/managedObjectModel` property and `NSPersistentDocument/configurePersistentStoreCoordinator(for:ofType:modelConfiguration:storeOptions:)` method. You might wish to do this, for example, to specify a particular managed object model.

> **IMPORTANT:**  `NSPersistentDocument` does not support some document behaviors:

- File wrappers.
- `NSDocument/SaveOperationType/saveToOperation` operation type.

Core Data does not support saving changes to a new document while maintaining the unsaved state in the current document.

- Asynchronous saving.

`NSPersistentDocument` does not support the asynchronous saving API of `NSDocument` because that API requires accessing the document’s state on multiple threads and that violates the requirements of the `NSManagedObjectContext` class. Do not override `NSDocument/canAsynchronouslyWrite(to:ofType:for:)`.

#### Undo Support

The persistent document uses the managed object context’s undo manager.

> **IMPORTANT:** Do not override the following properties, their getters, or their setters:

- `NSDocument/hasUndoManager`
- `NSDocument/undoManager`

The `NSDocument/isDocumentEdited` method returns `true` if the persistent document’s managed object context, or editors registered with the context, have uncommitted changes, otherwise it returns `false`.





## Relationships

**Inherits From**: `NSDocument`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSEditorRegistration`, `NSFilePresenter`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSUserActivityRestoring`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Managing the Persistence Objects

- `managedObjectContext`
- `managedObjectModel`
- `configurePersistentStoreCoordinator(for:ofType:modelConfiguration:storeOptions:)`
- `persistentStoreType(forFileType:)`

### Document Content Management

- `read(from:ofType:)`
- `revert(toContentsOf:ofType:)`
- `write(to:ofType:for:originalContentsURL:)`

## See Also

- `Developing a Document-Based App`
- `NSDocument`
- `NSDocumentController`
