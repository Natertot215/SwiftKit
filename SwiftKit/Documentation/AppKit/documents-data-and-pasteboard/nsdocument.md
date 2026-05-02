---
url: https://developer.apple.com/documentation/appkit/nsdocument
framework: AppKit
category: Documents, data, and pasteboard
title: NSDocument
kind: class
captured: 2026-05-02
---

# NSDocument

An abstract class that defines the interface for macOS documents.

## Declaration

```swift
@MainActor class NSDocument
```

### Overview

A document is an object that can internally represent data displayed in a window and that can read data from and write data to a file or file package. Documents create and manage one or more window controllers and are in turn managed by a document controller. Documents respond to first-responder action messages to save, revert, and print their data.

Conceptually, a document is a container for a body of information identified by a name under which it is stored in a disk file. In this sense, however, the document is not the same as the file but is an object in memory that owns and manages the document data. In the context of AppKit, a document is an instance of a custom `NSDocument` subclass that knows how to represent internally, in one or more formats, persistent data that is displayed in windows.

A document can read that data from a file and write it to a file. It is also the first-responder target for many menu commands related to documents, such as Save, Revert, and Print. A document manages its window’s edited status and is set up to perform undo and redo operations. When a window is closing, the document is asked before the window delegate to approve the closing.

`NSDocument` is one of the triad of AppKit classes that establish an architectural basis for document-based apps (the others being `NSDocumentController` and `NSWindowController`).

For more information about using `NSDocument` in a document-based app, see `developing-a-document-based-app`.

#### Subclassing NSDocument

The `NSDocument` class is designed to be subclassed. That is, the `NSDocument` class is abstract, and your app must create at least one `NSDocument` subclass in order to use the document architecture. To create a useful `NSDocument` subclass, you must override some methods, and you can optionally override others.

The `NSDocument` class itself knows how to handle document data as undifferentiated lumps; although it understands that these lumps are typed, it knows nothing about particular types. In their overrides of the data-based reading and writing methods, subclasses must add the knowledge of particular types and how data of the document’s native type is structured internally. Subclasses are also responsible for the creation of the window controllers that manage document windows and for the implementation of undo and redo. The `NSDocument` class takes care of much of the rest, including generally managing the state of the document.

See `https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/DocBasedAppProgrammingGuideForOSX/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011179` for more information about creating subclasses of `NSDocument`, particularly the list of primitive methods that subclasses must override and those that you can optionally override.

#### Document Saving Behavior

The `NSDocument` class implements document saving in a way that preserves, when possible, various attributes of each document, including:

- Creation date
- Permissions/privileges
- Location of the document’s icon in its parent folder’s Icon View Finder window
- Value of the document’s Show Extension setting

Care is also taken to save documents in a way that does not break any user-created aliases that may point to documents. As a result, some methods in any class of `NSDocument` may be invoked with parameters that do not have the same meaning as they did in early releases of macOS. It is important that overrides of `NSDocument/write(to:ofType:)` and `NSDocument/write(to:ofType:for:originalContentsURL:)` make no assumptions about the file paths passed as parameters, including:

- The location to which the file is being written. This location might be a hidden temporary directory.
- The name of the file being written. It is possible that this file has no obvious relation to the document name.
- The relation of any file being passed, including the original file, to the value in `NSDocument/fileURL`.

When updating your app to link against OS X v10.5, keep in mind that it is usually more appropriate to invoke in your app code one of the `NSDocument` `save...` methods than one of the `write...` methods. The `write...` methods are there primarily for you to override. The `NSDocument/saveToURL:ofType:forSaveOperation:error:` method that is meant always to be invoked during document saving, sets the `NSDocument/fileModificationDate` property  with the file’s new modification date after it has been written (for `NSDocument/SaveOperationType/saveOperation` and `NSDocument/SaveOperationType/saveAsOperation` only).

Likewise, it’s usually more appropriate to invoke in your app code one of the `NSDocument` `revert...` methods than one of the `read...` methods. The `read...` methods are there primarily for you to override. The `NSDocument/revert(toContentsOf:ofType:)` method that is meant always to be invoked during rereading of an open document, sets the `NSDocument/fileModificationDate` property with the file’s modification date after it has been read.

#### iCloud Support

The `NSDocument` class implements the file coordination support that is required for an iCloud-enabled, document-based Mac app (see `https://developer.apple.com/library/archive/documentation/General/Conceptual/iCloudDesignGuide/Chapters/DesigningForDocumentsIniCloud.html#//apple_ref/doc/uid/TP40012094-CH2-SW10` in `https://developer.apple.com/library/archive/documentation/General/Conceptual/iCloudDesignGuide/Chapters/Introduction.html#//apple_ref/doc/uid/TP40012094`). In addition, this class’s methods for moving and renaming documents, new in OS X v10.8, ensure that these operations are performed in a safe manner for iCloud-enabled apps.

#### Multicore Considerations

In macOS 10.6 and later, `NSDocument` supports the ability to open multiple documents concurrently. However, this support requires the cooperation of the document object. If your document subclass is able to read specific document types independently of other similar documents, you should override the `NSDocument/canConcurrentlyReadDocuments(ofType:)` class method and return `true` for the appropriate document types. If specific document types rely on shared state information, however, you should return `false` for those types.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSPersistentDocument`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSEditorRegistration`, `NSFilePresenter`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSUserActivityRestoring`, `NSUserInterfaceValidations`, `Sendable`

## Availability

- macOS ?

## Topics

### Creating a Document Object

- `init()`
- `init(contentsOf:ofType:)`
- `init(for:withContentsOf:ofType:)`
- `init(type:)`

### Reading the Document’s Content

- `canConcurrentlyReadDocuments(ofType:)`
- `read(from:ofType:)`
- `read(from:ofType:)`
- `read(from:ofType:)`

### Writing the Document’s Content

- `canAsynchronouslyWrite(to:ofType:for:)`
- `unblockUserInteraction()`
- `write(to:ofType:)`
- `writeSafely(to:ofType:for:)`
- `fileWrapper(ofType:)`
- `data(ofType:)`
- `write(to:ofType:for:originalContentsURL:)`
- `save(to:ofType:for:delegate:didSave:contextInfo:)`
- `save(to:ofType:for:completionHandler:)`
- `fileAttributesToWrite(to:ofType:for:originalContentsURL:)`
- `NSDocument.SaveOperationType`

### Getting Document Metadata

- `fileURL`
- `isEntireFileLoaded`
- `fileModificationDate`
- `keepBackupFile`
- `isDraft`
- `fileType`
- `isDocumentEdited`
- `isInViewingMode`

### Managing File Type Information

- `readableTypes`
- `writableTypes`
- `isNativeType(_:)`
- `writableTypes(for:)`
- `fileNameExtension(forType:saveOperation:)`

### Creating and Managing Window Controllers

- `makeWindowControllers()`
- `addWindowController(_:)`
- `removeWindowController(_:)`
- `windowControllers`
- `windowNibName`
- `windowControllerDidLoadNib(_:)`
- `windowControllerWillLoadNib(_:)`
- `shouldCloseWindowController(_:delegate:shouldClose:contextInfo:)`

### Managing Document Windows

- `showWindows()`
- `setWindow(_:)`
- `windowForSheet`
- `displayName`
- `defaultDraftName()`
- `encodeRestorableState(with:backgroundQueue:)`

### Configuring the Autosave Behavior

- `autosavesInPlace`
- `autosavesDrafts`
- `preservesVersions`
- `autosavedContentsFileURL`
- `autosavingFileType`
- `autosavingIsImplicitlyCancellable`

### Autosaving the Document

- `checkAutosavingSafety()`
- `hasUnautosavedChanges`
- `scheduleAutosaving()`
- `autosave(withDelegate:didAutosave:contextInfo:)`
- `autosave(withImplicitCancellability:completionHandler:)`
- `backupFileURL`

### Browsing Document Versions

- `browseVersions(_:)`
- `isBrowsingVersions`
- `stopBrowsingVersions(completionHandler:)`

### Storing Documents in iCloud

- `moveToUbiquityContainer(_:)`
- `usesUbiquitousStorage`

### Managing Undo and Redo Actions

- `undoManager`
- `hasUndoManager`

### Updating the Document Change Count

- `updateChangeCount(withToken:for:)`
- `updateChangeCount(_:)`
- `NSDocument.ChangeType`
- `changeCountToken(for:)`

### Handling Window Restoration

- `allowedClasses(forRestorableStateKeyPath:)`
- `encodeRestorableState(with:)`
- `restoreState(with:)`
- `restorableStateKeyPaths`
- `invalidateRestorableState()`
- `restoreWindow(withIdentifier:state:completionHandler:)`

### Presenting a Save Panel

- `runModalSavePanel(for:delegate:didSave:contextInfo:)`
- `prepareSavePanel(_:)`
- `shouldRunSavePanelWithAccessoryView`
- `fileTypeFromLastRunSavePanel`
- `fileNameExtensionWasHiddenInLastRunSavePanel`

### Supporting User Activities

- `userActivity`
- `updateUserActivityState(_:)`
- `NSUserActivityDocumentURLKey`

### Validating User Interface Items

- `validateUserInterfaceItem(_:)`

### Performing Tasks Serially

- `performSynchronousFileAccess(_:)`
- `performAsynchronousFileAccess(_:)`
- `performActivity(withSynchronousWaiting:using:)`
- `continueActivity(_:)`
- `continueAsynchronousWorkOnMainThread(_:)`

### Handling User Actions

- `printDocument(_:)`
- `runPageLayout(_:)`
- `revertToSaved(_:)`
- `save(_:)`
- `saveAs(_:)`
- `saveTo(_:)`
- `save(withDelegate:didSave:contextInfo:)`

### Closing the Document

- `canClose(withDelegate:shouldClose:contextInfo:)`
- `close()`

### Reverting the Document Contents

- `revert(toContentsOf:ofType:)`

### Duplicating the Document

- `duplicate()`
- `duplicate(_:)`
- `duplicate(withDelegate:didDuplicate:contextInfo:)`

### Renaming the Document

- `rename(_:)`

### Moving the Document

- `move(_:)`
- `move(completionHandler:)`
- `move(to:completionHandler:)`

### Locking the Document

- `lock(_:)`
- `unlock(_:)`
- `lock(completionHandler:)`
- `lock(completionHandler:)`
- `unlock(completionHandler:)`
- `unlock(completionHandler:)`
- `isLocked`

### Printing the Document

- `printInfo`
- `preparePageLayout(_:)`
- `runModalPageLayout(with:delegate:didRun:contextInfo:)`
- `runModalPrintOperation(_:delegate:didRun:contextInfo:)`
- `shouldChangePrintInfo(_:)`
- `print(withSettings:showPrintPanel:delegate:didPrint:contextInfo:)`
- `printOperation(withSettings:)`
- `pdfPrintOperation`
- `saveToPDF(_:)`

### Sharing the Document

- `allowsDocumentSharing`
- `prepare(_:)`
- `share(with:completionHandler:)`

### Handling Script Commands

- `handleClose(_:)`
- `handlePrint(_:)`
- `handleSave(_:)`
- `objectSpecifier`
- `lastComponentOfFileName`

### Displaying Errors to the User

- `presentError(_:modalFor:delegate:didPresent:contextInfo:)`
- `presentError(_:)`
- `willPresentError(_:)`
- `willNotPresentError(_:)`

### Deprecated

- `Deprecated Symbols`

### Instance Properties

- `observedPresentedItemUbiquityAttributes`
- `presentedItemURL`
- `previewRepresentableActivityItems`
- `savePanelShowsFileFormatsControl`

### Instance Methods

- `accommodatePresentedItemDeletion(completionHandler:)`
- `presentedItemDidChange()`
- `presentedItemDidChangeUbiquityAttributes(_:)`
- `presentedItemDidGain(_:)`
- `presentedItemDidLose(_:)`
- `presentedItemDidMove(to:)`
- `presentedItemDidResolveConflict(_:)`
- `relinquishPresentedItem(toReader:)`
- `relinquishPresentedItem(toWriter:)`
- `savePresentedItemChanges(completionHandler:)`

### Initializers

- `init(contentsOfURL:ofType:)`
- `init(forURL:withContentsOfURL:ofType:)`

## See Also

- `Developing a Document-Based App`
- `NSDocumentController`
- `NSPersistentDocument`
