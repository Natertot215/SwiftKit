---
url: https://developer.apple.com/documentation/appkit/nsdocumentcontroller
framework: AppKit
category: Documents, data, and pasteboard
title: NSDocumentController
kind: class
captured: 2026-05-02
---

# NSDocumentController

An object that manages an app’s documents.

## Declaration

```swift
@MainActor class NSDocumentController
```

### Overview

As the first-responder target of New and Open menu commands, `NSDocumentController` creates and opens documents and tracks them throughout a session of the app. When opening documents, a document controller runs and manages the modal Open panel. `NSDocumentController` objects also maintain and manage the mappings of document types, extensions, and `NSDocument` subclasses as specified in the `https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html#//apple_ref/doc/uid/20001431-101685` property loaded from the information property list (`Info.plist`).

You can use various `NSDocumentController` methods to get a list of the current documents, get the current document (which is the document whose window is currently key), get documents based on a given filename or window, and find out about a document’s extension, type, display name, and document class.

In some situations, it’s worthwhile to subclass `NSDocumentController` in non-`NSDocument`-based apps to get some of its features. For example, the `NSDocumentController` management of the Open Recent menu is useful in apps that don’t use subclasses of `NSDocument`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSUserInterfaceValidations`, `NSWindowRestoration`, `Sendable`

## Availability

- macOS ?

## Topics

### Obtaining the Shared Document Controller

- `shared`

### Initializing a New NSDocumentController

- `init()`
- `init(coder:)`

### Creating and Opening Documents

- `document(for:)`
- `duplicateDocument(withContentsOf:copying:displayName:)`
- `openDocument(withContentsOf:display:completionHandler:)`
- `openUntitledDocumentAndDisplay(_:)`
- `makeDocument(for:withContentsOf:ofType:)`
- `makeDocument(withContentsOf:ofType:)`
- `makeUntitledDocument(ofType:)`
- `reopenDocument(for:withContentsOf:display:completionHandler:)`

### Managing Documents

- `documents`
- `addDocument(_:)`
- `currentDocument`
- `document(for:)`
- `hasEditedDocuments`
- `removeDocument(_:)`

### Managing Document Types

- `documentClassNames`
- `defaultType`
- `documentClass(forType:)`
- `displayName(forType:)`
- `typeForContents(of:)`

### Autosaving

- `autosavingDelay`

### Closing Documents

- `closeAllDocuments(withDelegate:didCloseAllSelector:contextInfo:)`
- `reviewUnsavedDocuments(withAlertTitle:cancellable:delegate:didReviewAllSelector:contextInfo:)`

### Responding to Action Messages

- `newDocument(_:)`
- `openDocument(_:)`
- `saveAllDocuments(_:)`

### Managing the Open Dialog

- `beginOpenPanel(completionHandler:)`
- `beginOpenPanel(_:forTypes:completionHandler:)`
- `runModalOpenPanel(_:forTypes:)`
- `currentDirectory`
- `urlsFromRunningOpenPanel()`

### Managing the Open Recent Menu

- `maximumRecentDocumentCount`
- `clearRecentDocuments(_:)`
- `noteNewRecentDocumentURL(_:)`
- `noteNewRecentDocument(_:)`
- `recentDocumentURLs`

### Validating User Interface Items

- `validateUserInterfaceItem(_:)`

### Sharing

- `allowsAutomaticShareMenu`
- `standardShareMenuItem()`

### Handling Errors

- `presentError(_:)`
- `presentError(_:modalFor:delegate:didPresent:contextInfo:)`
- `willPresentError(_:)`

## See Also

- `Developing a Document-Based App`
- `NSDocument`
- `NSPersistentDocument`
