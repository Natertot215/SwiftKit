---
url: https://developer.apple.com/documentation/appkit/nsoutlineview
framework: AppKit
category: Views and controls
title: NSOutlineView
kind: class
captured: 2026-05-02
---

# NSOutlineView

A view that uses a row-and-column format to display hierarchical data like directories and files that can be expanded and collapsed.

## Declaration

```swift
class NSOutlineView
```

### Overview

Like a table view, an outline view does not store its own data, instead it retrieves data values as needed from a data source to which it has a weak reference (see `https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/DelegatesandDataSources/DelegatesandDataSources.html#//apple_ref/doc/uid/TP40010810-CH11`). See `NSOutlineViewDataSource`, which declares the methods that an `NSOutlineView` object uses to access the contents of its data source object.

An outline view has the following features:

- A user can expand and collapse rows, edit values, and resize and rearrange columns.
- Each item in the outline view must be unique. In order for the collapsed state to remain consistent between reloads the item’s pointer must remain the same and the item must maintain `NSObjectProtocol/isEqual(_:)` sameness.
- The view gets data from a data source (see `NSOutlineViewDataSource`).
- The view retrieves only the data that needs to be displayed.

> **IMPORTANT:**  It is possible that your data source methods for populating the outline view may be called before `NSObject-swift.class/awakeFromNib()` if the data source is specified in Interface Builder. You should defend against this by having the data source’s `NSOutlineViewDataSource/outlineView(_:numberOfChildrenOfItem:)` method return `0` for the number of items when the data source has not yet been configured. In `NSObject-swift.class/awakeFromNib()`, when the data source is initialized you should always call `NSTableView/reloadData()`.

For more information about using NSOutlineView in your app, see `navigating-hierarchical-data-using-outline-and-split-views`.

#### Subclassing

Subclassing `NSOutlineView` is not recommended. Customization can be accomplished in your data source class implementation (conforming to `NSOutlineViewDataSource`) or your delegate class implementation (conforming to `NSOutlineViewDelegate`).





## Relationships

**Inherits From**: `NSTableView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSAccessibilityOutline`, `NSAccessibilityProtocol`, `NSAccessibilityTable`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSDraggingSource`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTextDelegate`, `NSTextViewDelegate`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Accessing the Data Source

- `dataSource`
- `stronglyReferencesItems`

### Working with Expandability

- `isExpandable(_:)`
- `isItemExpanded(_:)`

### Expanding and Collapsing the Outline

- `expandItem(_:)`
- `expandItem(_:expandChildren:)`
- `collapseItem(_:)`
- `collapseItem(_:collapseChildren:)`

### Redisplaying Information

- `reloadItem(_:)`
- `reloadItem(_:reloadChildren:)`

### Converting Between Items and Rows

- `item(atRow:)`
- `row(forItem:)`

### Working with the Outline Column

- `outlineTableColumn`
- `autoresizesOutlineColumn`

### Working with Indentation

- `level(forItem:)`
- `level(forRow:)`
- `indentationPerLevel`
- `indentationMarkerFollowsCell`

### Working with Persistence

- `autosaveExpandedItems`

### Supporting Drag and Drop

- `setDropItem(_:dropChildIndex:)`
- `shouldCollapseAutoExpandedItems(forDeposited:)`

### Getting Related Items

- `parent(forItem:)`
- `childIndex(forItem:)`
- `child(_:ofItem:)`
- `numberOfChildren(ofItem:)`

### Getting the Frame for a Cell

- `frameOfOutlineCell(atRow:)`

### Accessing the Delegate

- `delegate`

### Manipulating Items

- `insertItems(at:inParent:withAnimation:)`
- `moveItem(at:inParent:to:inParent:)`
- `removeItems(at:inParent:withAnimation:)`

### User Interface Layout Direction

- `userInterfaceLayoutDirection`

### Constants

- `Drop on Item Index`
- `Outline View Button Keys`

### Notifications

- `columnDidMoveNotification`
- `columnDidResizeNotification`
- `itemDidCollapseNotification`
- `itemDidExpandNotification`
- `itemWillCollapseNotification`
- `itemWillExpandNotification`
- `selectionDidChangeNotification`
- `selectionIsChangingNotification`

## See Also

- `Navigating Hierarchical Data Using Outline and Split Views`
