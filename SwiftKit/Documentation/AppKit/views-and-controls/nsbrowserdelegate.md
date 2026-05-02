---
url: https://developer.apple.com/documentation/appkit/nsbrowserdelegate
framework: AppKit
category: Views and controls
title: NSBrowserDelegate
kind: protocol
captured: 2026-05-01
---

# NSBrowserDelegate

## Declaration

```swift
protocol NSBrowserDelegate : NSObjectProtocol
```

## Abstract

A set of methods that a browser delegate implements to manage selection, scrolling, sizing, and other behavior.

## Overview

The NSBrowserDelegate protocol defines optional methods that allow you to customize the behavior of an NSBrowser object. Delegates can manage selection, handle drag and drop operations, control column sizing, and customize the display of browser contents.

## Topics

### Getting Browser Information
- `browser(_:isColumnValid:)` - Returns whether the contents of the specified column are valid
- `browser(_:numberOfRowsInColumn:)` - Returns the number of rows of data in the specified column
- `browser(_:numberOfChildrenOfItem:)` - Asks the delegate for the number of children the given item has
- `browser(_:titleOfColumn:)` - Asks the delegate for the title to display above the specified column

### Managing Selection Behavior
- `browser(_:shouldTypeSelectFor:withCurrentSearch:)` - Determines whether keyboard-based selection (type select) should proceed
- `browser(_:typeSelectStringForRow:inColumn:)` - Gets the keyboard-based selection string for the specified row and column
- `browser(_:nextTypeSelectMatchFromRow:toRow:inColumn:for:)` - Customizes keyboard-based selection behavior

### Managing Selection
- `browser(_:selectCellWith:inColumn:)` - Asks the delegate to select the cell with the given title in the specified column
- `browser(_:selectRow:inColumn:)` - Asks the delegate to select the cell at the specified row and column location
- `browser(_:selectionIndexesForProposedSelection:inColumn:)` - Asks the delegate for a set of indexes to select when the user changes the selection

### Accessing Components
- `browser(_:child:ofItem:)` - Returns the child of the specified item at the specified index
- `browser(_:isLeafItem:)` - Asks whether the specified item is a leaf item (cannot be expanded)
- `browser(_:shouldEditItem:)` - Asks whether the browser may start an editing session for the specified item
- `browser(_:objectValueForItem:)` - Returns the object that the specified item uses to draw its contents
- `browser(_:setObjectValue:forItem:)` - Sets the object that the specified item uses to draw its contents
- `rootItem(for:)` - Asks the delegate to return the root item of the browser
- `browser(_:previewViewControllerForLeafItem:)` - Asks for a controller that provides a preview column for the specified leaf item
- `browser(_:headerViewControllerForItem:)` - Asks for a controller that provides a header view for the specified column item

### Managing Columns
- `browser(_:createRowsForColumn:in:)` - Creates a row in the given matrix for each row of data in the specified column
- `browser(_:willDisplayCell:atRow:column:)` - Gives the delegate the opportunity to modify the specified cell before display
- `browser(_:didChangeLastColumn:toColumn:)` - Tells the delegate that the browser's last column changed

### Scrolling
- `browserWillScroll(_:)` - Notifies the delegate when the browser will scroll
- `browserDidScroll(_:)` - Notifies the delegate when the browser has scrolled

### Dragging
- `browser(_:canDragRowsWith:inColumn:with:)` - Determines whether the browser can attempt to initiate a drag
- `browser(_:draggingImageForRowsWith:inColumn:with:offset:)` - Obtains an image to represent dragged rows
- `browser(_:validateDrop:proposedRow:column:dropOperation:)` - Determines whether to accept a drop (required for drag destination)
- `browser(_:acceptDrop:atRow:column:dropOperation:)` - Determines whether to accept the drop
- `browser(_:writeRowsWith:inColumn:to:)` - Determines whether a drag operation can proceed (required for drag source)
- `browser(_:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWith:inColumn:)` - Implements file promise drag operations (deprecated)

### Sizing
- `browser(_:shouldSizeColumn:forUserResize:toWidth:)` - Used to determine a column's initial size
- `browser(_:sizeToFitWidthOfColumn:)` - Returns the ideal width for a column
- `browserColumnConfigurationDidChange(_:)` - Used by clients to implement their own column width persistence
- `browser(_:heightOfRow:inColumn:)` - Specifies the height of the specified row in the specified column

### Displaying Cell Content
- `browser(_:shouldShowCellExpansionForRow:column:)` - Invoked to allow the delegate to control cell expansion for a specific row and column

## Inheritance

Conforms to: `NSObjectProtocol`

## Availability

- **macOS** 10.0+
