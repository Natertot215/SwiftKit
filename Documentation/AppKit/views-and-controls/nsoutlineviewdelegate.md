---
url: https://developer.apple.com/documentation/appkit/nsoutlineviewdelegate
framework: AppKit
category: Views and controls
title: NSOutlineViewDelegate
kind: protocol
captured: 2026-05-02
---

# NSOutlineViewDelegate

A set of optional methods implemented by delegates of `NSOutlineView` objects.

## Declaration

```swift
protocol NSOutlineViewDelegate : NSControlTextEditingDelegate
```







## Relationships

**Inherits From**: `NSControlTextEditingDelegate`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Expanding and Collapsing the Outline

- `outlineView(_:shouldExpandItem:)`
- `outlineView(_:shouldCollapseItem:)`

### Supporting Type Select

- `outlineView(_:typeSelectStringFor:item:)`
- `outlineView(_:nextTypeSelectMatchFromItem:toItem:for:)`
- `outlineView(_:shouldTypeSelectFor:withCurrentSearch:)`

### Working with Tooltips

- `outlineView(_:toolTipFor:rect:tableColumn:item:mouseLocation:)`

### Handling Selection

- `outlineView(_:shouldSelect:)`
- `outlineView(_:shouldSelectItem:)`
- `outlineView(_:selectionIndexesForProposedSelection:)`
- `selectionShouldChange(in:)`
- `outlineViewSelectionIsChanging(_:)`
- `outlineViewSelectionDidChange(_:)`

### Displaying Cells

- `outlineView(_:willDisplayCell:for:item:)`
- `outlineView(_:willDisplayOutlineCell:for:item:)`
- `outlineView(_:dataCellFor:item:)`
- `outlineView(_:shouldShowOutlineCellForItem:)`
- `outlineView(_:shouldShowCellExpansionFor:item:)`

### Moving and Resizing Columns

- `outlineView(_:shouldReorderColumn:toColumn:)`

### Working with the Outline Column

- `outlineViewColumnDidMove(_:)`
- `outlineViewColumnDidResize(_:)`
- `outlineViewItemWillExpand(_:)`
- `outlineViewItemDidExpand(_:)`
- `outlineViewItemWillCollapse(_:)`
- `outlineViewItemDidCollapse(_:)`

### Editing Items

- `outlineView(_:shouldEdit:item:)`

### Working with Table Columns

- `outlineView(_:mouseDownInHeaderOf:)`
- `outlineView(_:didClick:)`
- `outlineView(_:didDrag:)`

### Customizing Column and Row Sizes

- `outlineView(_:heightOfRowByItem:)`
- `outlineView(_:sizeToFitWidthOfColumn:)`

### Customizing Tint Color

- `outlineView(_:tintConfigurationForItem:)`
- `NSTintConfiguration`

### Customizing Tracking Support

- `outlineView(_:shouldTrackCell:for:item:)`

### Grouping Rows

- `outlineView(_:isGroupItem:)`

### Working with NSView-Based Outline Views

- `outlineView(_:didAdd:forRow:)`
- `outlineView(_:didRemove:forRow:)`
- `outlineView(_:rowViewForItem:)`
- `outlineView(_:viewFor:item:)`

### Changing Visibility

- `outlineView(_:userCanChangeVisibilityOf:)`
- `outlineView(_:userDidChangeVisibilityOf:)`

## See Also

- `NSOutlineViewDataSource`
