---
url: https://developer.apple.com/documentation/appkit/nsbrowser
framework: AppKit
category: Views and controls
title: NSBrowser
kind: class
captured: 2026-05-02
---

# NSBrowser

An interface that displays a hierarchically organized list of data items that can be navigated and selected.

## Declaration

```swift
class NSBrowser
```

### Overview

A browser displays information using a set of columns, which are indexed from left to right. Each successive column displays the next level down in the data hierarchy. This class uses the `NSBrowserCell` class to implement its user interface.

Browsers have the following components:

- Columns
- Scroll views
- Matrices
- Browser cells

To the user, browsers display data in columns and rows within each column. These components are arranged in the following component hierarchy:

```objc
Browser
|---Columns [1..*]
    |---Scroll view
       |---Matrix
           |---Rows [0..*]
```

#### Superclass overrides

- `NSView/isOpaque` returns `true` when the browser doesn’t have a title and its background color’s alpha component is `1.0`; otherwise, it returns `false`.

#### Protocol implementations

- The `NSBrowser` implementation of `NSDraggingInfo/namesOfPromisedFilesDropped(atDestination:)` provides the names of the files that the browser promises to create at a specified location, the result of sending `browser:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:inColumn:` to the delegate.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring Browsers

- `reusesColumns`
- `maxVisibleColumns`
- `autohidesScroller`
- `backgroundColor`
- `minColumnWidth`
- `separatesColumns`
- `takesTitleFromPreviousColumn`
- `tile()`
- `delegate`

### Managing Component Types

- `cellClass`
- `setCellClass(_:)`
- `cellPrototype`

### Managing Selection Behavior

- `allowsBranchSelection`
- `allowsEmptySelection`
- `allowsMultipleSelection`
- `selectedRowIndexes(inColumn:)`
- `selectRowIndexes(_:inColumn:)`
- `allowsTypeSelect`

### Managing Selection

- `selectedCell(inColumn:)`
- `selectedCells`
- `selectAll(_:)`
- `selectedRow(inColumn:)`
- `selectRow(_:inColumn:)`
- `selectionIndexPath`
- `selectionIndexPaths`

### Accessing Components

- `loadedCell(atRow:column:)`
- `editItem(at:with:select:)`
- `item(at:)`
- `item(atRow:inColumn:)`
- `indexPath(forColumn:)`
- `isLeafItem(_:)`
- `parentForItems(inColumn:)`

### Managing the Path

- `path()`
- `setPath(_:)`
- `path(toColumn:)`
- `pathSeparator`

### Managing Columns

- `addColumn()`
- `selectedColumn`
- `lastColumn`
- `firstVisibleColumn`
- `numberOfVisibleColumns`
- `lastVisibleColumn`
- `validateVisibleColumns()`
- `isLoaded`
- `loadColumnZero()`
- `reloadColumn(_:)`

### Accessing Column Titles

- `title(ofColumn:)`
- `setTitle(_:ofColumn:)`
- `isTitled`
- `drawTitle(ofColumn:in:)`
- `titleHeight`
- `titleFrame(ofColumn:)`

### Updating Browsers

- `noteHeightOfRowsWithIndexesChanged(_:inColumn:)`
- `reloadData(forRowIndexes:inColumn:)`

### Scrolling

- `hasHorizontalScroller`
- `scrollColumnToVisible(_:)`
- `scrollColumnsLeft(by:)`
- `scrollColumnsRight(by:)`
- `scrollRowToVisible(_:inColumn:)`

### Dragging

- `setDraggingSourceOperationMask(_:forLocal:)`
- `canDragRows(with:inColumn:with:)`
- `draggingImageForRows(with:inColumn:with:offset:)`

### Getting Column Frames

- `frame(ofColumn:)`
- `frame(ofInsideOfColumn:)`

### Getting Row Frames

- `frame(ofRow:inColumn:)`
- `getRow(_:column:for:)`

### Managing Actions

- `doubleAction`
- `sendsActionOnArrowKeys`
- `sendAction()`

### Handling Mouse-Click Events

- `doClick(_:)`
- `doDoubleClick(_:)`
- `clickedColumn`
- `clickedRow`

### Sizing

- `removeSavedColumns(withAutosaveName:)`
- `columnsAutosaveName`
- `NSBrowser.ColumnsAutosaveName`
- `columnContentWidth(forColumnWidth:)`
- `columnWidth(forColumnContentWidth:)`
- `columnResizingType`
- `prefersAllColumnUserResizing`
- `width(ofColumn:)`
- `setWidth(_:ofColumn:)`
- `defaultColumnWidth()`
- `setDefaultColumnWidth(_:)`
- `rowHeight`

### Constants

- `NSBrowser.ColumnResizingType`
- `NSBrowser.DropOperation`
- `Application Kit Versions for NSBrowser Functionality`

### Notifications

- `columnConfigurationDidChangeNotification`

### Deprecated

- `column(of:)`
- `matrix(inColumn:)`
- `matrixClass()`
- `setMatrixClass(_:)`

### Instance Methods

- `selectedCell()`
