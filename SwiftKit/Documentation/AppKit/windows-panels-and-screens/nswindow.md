---
url: https://developer.apple.com/documentation/appkit/nswindow
framework: AppKit
category: Windows, panels, and screens
title: NSWindow
kind: class
captured: 2026-05-02
---

# NSWindow

A window that an app displays on the screen.

## Declaration

```swift
@MainActor class NSWindow
```

### Overview

A single `NSWindow` object corresponds to, at most, one on-screen window. Windows perform two principal functions:

- To place views in a provided area
- To accept and distribute mouse and keyboard events the user generates to the appropriate views

> **NOTE:**  Although the `NSWindow` class inherits the `NSCoding` protocol from `NSResponder`, the class doesn’t support coding. Legacy support for archivers exists, but its use is deprecated and may not work. Any attempt to archive or unarchive a window object using a keyed coding object raises an `NSExceptionName/invalidArgumentException` exception. For details about window restoration, see `NSWindow/restorationClass`.





## Relationships

**Inherits From**: `NSResponder`

**Inherited By**: `NSPanel`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating a Window

- `init(contentViewController:)`
- `init(contentRect:styleMask:backing:defer:)`
- `init(contentRect:styleMask:backing:defer:screen:)`

### Managing the Window’s Behavior

- `delegate`
- `NSWindowDelegate`

### Configuring the Window’s Content

- `contentViewController`
- `contentView`

### Configuring the Window’s Appearance

- `styleMask`
- `NSWindow.StyleMask`
- `toggleFullScreen(_:)`
- `worksWhenModal`
- `alphaValue`
- `backgroundColor`
- `colorSpace`
- `setDynamicDepthLimit(_:)`
- `canHide`
- `isOnActiveSpace`
- `hidesOnDeactivate`
- `collectionBehavior`
- `isOpaque`
- `hasShadow`
- `invalidateShadow()`
- `autorecalculatesContentBorderThickness(for:)`
- `setAutorecalculatesContentBorderThickness(_:for:)`
- `contentBorderThickness(for:)`
- `setContentBorderThickness(_:for:)`
- `preventsApplicationTerminationWhenModal`
- `appearanceSource`

### Accessing Window Information

- `depthLimit`
- `hasDynamicDepthLimit`
- `defaultDepthLimit`
- `windowNumber`
- `windowNumbers(options:)`
- `deviceDescription`
- `NSDeviceDescriptionKey`
- `canBecomeVisibleWithoutLogin`
- `sharingType`
- `backingType`
- `displayLink(target:selector:)`

### Getting Layout Information

- `contentRect(forFrameRect:styleMask:)`
- `frameRect(forContentRect:styleMask:)`
- `minFrameWidth(withTitle:styleMask:)`
- `contentRect(forFrameRect:)`
- `frameRect(forContentRect:)`

### Managing Windows

- `windowController`

### Managing Sheets

- `attachedSheet`
- `isSheet`
- `beginSheet(_:completionHandler:)`
- `beginCriticalSheet(_:completionHandler:)`
- `endSheet(_:)`
- `endSheet(_:returnCode:)`
- `sheetParent`
- `sheets`

### Sizing Windows

- `frame`
- `setFrameOrigin(_:)`
- `setFrameTopLeftPoint(_:)`
- `constrainFrameRect(_:to:)`
- `cascadeTopLeft(from:)`
- `setFrame(_:display:)`
- `setFrame(_:display:animate:)`
- `animationResizeTime(_:)`
- `aspectRatio`
- `minSize`
- `maxSize`
- `isZoomed`
- `performZoom(_:)`
- `zoom(_:)`
- `resizeFlags`
- `resizeIncrements`
- `preservesContentDuringLiveResize`
- `inLiveResize`

### Sizing Content

- `contentAspectRatio`
- `contentMinSize`
- `setContentSize(_:)`
- `contentMaxSize`
- `contentResizeIncrements`
- `contentLayoutGuide`
- `contentLayoutRect`
- `maxFullScreenContentSize`
- `minFullScreenContentSize`

### Managing Window Layers

- `orderOut(_:)`
- `orderBack(_:)`
- `orderFront(_:)`
- `orderFrontRegardless()`
- `order(_:relativeTo:)`
- `level`
- `NSWindow.Level`

### Managing Window Visibility and Occlusion State

- `isVisible`
- `occlusionState`

### Managing Window Frames in User Defaults

- `removeFrame(usingName:)`
- `setFrameUsingName(_:)`
- `setFrameUsingName(_:force:)`
- `saveFrame(usingName:)`
- `setFrameAutosaveName(_:)`
- `frameAutosaveName`
- `NSWindow.FrameAutosaveName`
- `frameDescriptor`
- `setFrame(from:)`
- `NSWindow.PersistableFrameDescriptor`

### Managing Key Status

- `isKeyWindow`
- `canBecomeKey`
- `makeKey()`
- `makeKeyAndOrderFront(_:)`
- `becomeKey()`
- `resignKey()`

### Managing Main Status

- `isMainWindow`
- `canBecomeMain`
- `makeMain()`
- `becomeMain()`
- `resignMain()`

### Managing Toolbars

- `toolbar`
- `toggleToolbarShown(_:)`
- `runToolbarCustomizationPalette(_:)`

### Managing Attached Windows

- `childWindows`
- `addChildWindow(_:ordered:)`
- `removeChildWindow(_:)`
- `parent`

### Managing Default Buttons

- `defaultButtonCell`
- `enableKeyEquivalentForDefaultButtonCell()`
- `disableKeyEquivalentForDefaultButtonCell()`

### Managing Field Editors

- `fieldEditor(_:for:)`
- `endEditing(for:)`

### Managing the Window Menu

- `isExcludedFromWindowsMenu`

### Managing Cursor Rectangles

- `areCursorRectsEnabled`
- `enableCursorRects()`
- `disableCursorRects()`
- `discardCursorRects()`
- `invalidateCursorRects(for:)`
- `resetCursorRects()`

### Managing Title Bars

- `standardWindowButton(_:for:)`
- `standardWindowButton(_:)`
- `showsToolbarButton`
- `titlebarAppearsTransparent`
- `toolbarStyle`
- `NSWindow.ToolbarStyle`
- `titlebarSeparatorStyle`
- `NSTitlebarSeparatorStyle`
- `windowTitlebarLayoutDirection`

### Managing Title Bar Accessories

- `addTitlebarAccessoryViewController(_:)`
- `insertTitlebarAccessoryViewController(_:at:)`
- `removeTitlebarAccessoryViewController(at:)`
- `titlebarAccessoryViewControllers`

### Managing Window Tabs

- `allowsAutomaticWindowTabbing`
- `userTabbingPreference`
- `tab`
- `tabbingIdentifier`
- `NSWindow.TabbingIdentifier`
- `addTabbedWindow(_:ordered:)`
- `tabbingMode`
- `tabbedWindows`
- `mergeAllWindows(_:)`
- `selectNextTab(_:)`
- `selectPreviousTab(_:)`
- `moveTabToNewWindow(_:)`
- `toggleTabBar(_:)`
- `toggleTabOverview(_:)`
- `tabGroup`

### Managing Tooltips

- `allowsToolTipsWhenApplicationIsInactive`

### Handling Events

- `currentEvent`
- `nextEvent(matching:)`
- `nextEvent(matching:until:inMode:dequeue:)`
- `discardEvents(matching:before:)`
- `postEvent(_:atStart:)`
- `sendEvent(_:)`
- `tryToPerform(_:with:)`

### Managing Responders

- `initialFirstResponder`
- `firstResponder`
- `makeFirstResponder(_:)`

### Managing the Key View Loop

- `selectKeyView(preceding:)`
- `selectKeyView(following:)`
- `selectPreviousKeyView(_:)`
- `selectNextKeyView(_:)`
- `keyViewSelectionDirection`
- `autorecalculatesKeyViewLoop`
- `recalculateKeyViewLoop()`

### Managing Window Sharing

- `transferWindowSharing(to:completionHandler:)`
- `hasActiveWindowSharingSession`

### Handling Mouse Events

- `acceptsMouseMovedEvents`
- `ignoresMouseEvents`
- `mouseLocationOutsideOfEventStream`
- `windowNumber(at:belowWindowWithWindowNumber:)`
- `trackEvents(matching:timeout:mode:handler:)`
- `performDrag(with:)`
- `foreverDuration`

### Handling Window Restoration

- `isRestorable`
- `restorationClass`
- `disableSnapshotRestoration()`
- `enableSnapshotRestoration()`

### Drawing Windows

- `display()`
- `displayIfNeeded()`
- `viewsNeedDisplay`
- `allowsConcurrentViewDrawing`

### Window Animation

- `animationBehavior`

### Updating Windows

- `disableScreenUpdatesUntilFlush()`
- `update()`

### Dragging Items

- `drag(_:at:offset:event:pasteboard:source:slideBack:)`
- `registerForDraggedTypes(_:)`
- `unregisterDraggedTypes()`

### Accessing Edited Status

- `isDocumentEdited`

### Converting Coordinates

- `backingScaleFactor`
- `backingAlignedRect(_:options:)`
- `convertFromBacking(_:)`
- `convertFromScreen(_:)`
- `convertPointFromBacking(_:)`
- `convertPoint(fromScreen:)`
- `convertToBacking(_:)`
- `convertToScreen(_:)`
- `convertPointToBacking(_:)`
- `convertPoint(toScreen:)`

### Managing Titles

- `title`
- `subtitle`
- `titleVisibility`
- `setTitleWithRepresentedFilename(_:)`
- `representedFilename`
- `representedURL`

### Accessing Screen Information

- `screen`
- `deepestScreen`
- `displaysWhenScreenProfileChanges`

### Moving Windows

- `isMovableByWindowBackground`
- `isMovable`
- `center()`

### Closing Windows

- `performClose(_:)`
- `close()`
- `isReleasedWhenClosed`

### Minimizing Windows

- `isMiniaturized`
- `performMiniaturize(_:)`
- `miniaturize(_:)`
- `deminiaturize(_:)`
- `miniwindowImage`
- `miniwindowTitle`

### Getting the Dock Tile

- `dockTile`

### Printing Windows

- `printWindow(_:)`
- `dataWithEPS(inside:)`
- `dataWithPDF(inside:)`

### Providing Services

- `validRequestor(forSendType:returnType:)`

### Triggering Constraint-Based Layout

- `updateConstraintsIfNeeded()`
- `layoutIfNeeded()`

### Debugging Constraint-Based Layout

- `visualizeConstraints(_:)`

### Constraint-Based Layouts

- `anchorAttribute(for:)`
- `setAnchorAttribute(_:for:)`

### Working with Window Depths

- `bitsPerPixel`
- `bitsPerSample`
- `colorSpaceName`
- `numberOfColorComponents`
- `isPlanar`
- `canRepresent(_:)`

### Getting Information About Scripting Attributes

- `hasCloseBox`
- `hasTitleBar`
- `isModalPanel`
- `isFloatingPanel`
- `isZoomable`
- `isResizable`
- `isMiniaturizable`
- `orderedIndex`

### Setting Scripting Attributes

- `setIsMiniaturized(_:)`
- `setIsVisible(_:)`
- `setIsZoomed(_:)`

### Handling Script Commands

- `handleClose(_:)`
- `handlePrint(_:)`
- `handleSave(_:)`

### Constants

- `NSWindow.SelectionDirection`
- `NSWindow.ButtonType`
- `NSRunLoop—Ordering Modes for NSWindow`
- `NSWindow.Depth`
- `NSWindow.BackingStoreType`
- `NSWindow.OrderingMode`
- `NSWindow.SharingType`
- `NSWindow.NumberListOptions`
- `NSWindow.AnimationBehavior`
- `NSWindow.CollectionBehavior`
- `NSWindow.OcclusionState`
- `NSWindow.TitleVisibility`
- `NSWindow.UserTabbingPreference`
- `NSWindow.TabbingMode`
- `Application Kit Version for Deferred Window Display Support`
- `Application Kit Version for Custom Sheet Position`
- `NSWindowDidChangeBackingPropertiesNotification User Info Properties`

### Notifications

- `didBecomeKeyNotification`
- `didBecomeMainNotification`
- `didChangeScreenNotification`
- `didChangeScreenProfileNotification`
- `didDeminiaturizeNotification`
- `didEndSheetNotification`
- `didEndLiveResizeNotification`
- `didExposeNotification`
- `didMiniaturizeNotification`
- `didMoveNotification`
- `didResignKeyNotification`
- `didResignMainNotification`
- `didResizeNotification`
- `didUpdateNotification`
- `willBeginSheetNotification`
- `willCloseNotification`
- `willMiniaturizeNotification`
- `willMoveNotification`
- `willStartLiveResizeNotification`
- `willEnterFullScreenNotification`
- `didEnterFullScreenNotification`
- `willExitFullScreenNotification`
- `didExitFullScreenNotification`
- `willEnterVersionBrowserNotification`
- `didEnterVersionBrowserNotification`
- `willExitVersionBrowserNotification`
- `didExitVersionBrowserNotification`
- `didChangeBackingPropertiesNotification`
- `didChangeOcclusionStateNotification`

### Deprecated

- `Deprecated Symbols`

### Classes

- `NSWindow.HostingSheetRepresentation`

### Instance Properties

- `cascadingReferenceFrame`

### Instance Methods

- `beginDraggingSession(items:event:source:)`
- `beginSheet(content:completionHandler:)`
- `endSheet(_:)`
- `requestSharingOfWindow(_:completionHandler:)`
- `requestSharingOfWindow(usingPreview:title:completionHandler:)`

## See Also

- `NSPanel`
- `NSWindowDelegate`
- `NSWindowTab`
- `NSWindowTabGroup`
