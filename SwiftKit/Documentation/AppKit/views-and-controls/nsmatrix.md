---
url: https://developer.apple.com/documentation/appkit/nsmatrix
framework: AppKit
category: Views and controls
title: NSMatrix
kind: class
captured: 2026-05-02
---

# NSMatrix

A legacy interface for grouping radio buttons or other types of cells together.

## Declaration

```swift
class NSMatrix
```

### Overview

> **IMPORTANT:**  Use of NSMatrix is discouraged in apps that run in macOS 10.8 and later. If you need to create a radio button group in an app that runs in macOS 10.8 and later, create instances of `https://developer.apple.com/library/archive/technotes/tn2219/_index.html#//apple_ref/doc/uid/DTS10004624-CH1-SUBSECTION12` that each specify a button type of `NSRadioButton` and specify the same action and the same superview for each button in the group.

`NSMatrix` uses flipped coordinates by default. The cells in an `NSMatrix` object are numbered by row and column, each starting with 0; for example, the top left `NSCell` would be at (0, 0), and the `NSCell` that’s second down and third across would be at (1, 2).

The `NSMatrix` class has the notion of a single selected cell, which is the cell that was most recently clicked or that was so designated by a `NSMatrix/selectCell(atRow:column:)` or `NSMatrix/selectCell(withTag:)` message. The selected cell is the cell chosen for action messages except for `NSCell/performClick(_:)` (`NSCell`), which is assigned to the key cell. (The key cell is generally identical to the selected cell, but can be given click focus while leaving the selected cell unchanged.) If the user has selected multiple cells, the selected cell is the one lowest and furthest to the right in the matrix of cells.





## Relationships

**Inherits From**: `NSControl`

**Inherited By**: `NSForm`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `NSViewToolTipOwner`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Initializing an NSMatrix Object

- `init(frame:)`
- `init(frame:mode:cellClass:numberOfRows:numberOfColumns:)`
- `init(frame:mode:prototype:numberOfRows:numberOfColumns:)`

### Configuring the Matrix Object

- `mode`
- `allowsEmptySelection`
- `isSelectionByRect`

### Managing the Cell Class

- `cellClass`
- `prototype`

### Laying Out the Cells of the Matrix

- `addColumn()`
- `addColumn(with:)`
- `addRow()`
- `addRow(with:)`
- `cellFrame(atRow:column:)`
- `cellSize`
- `getNumberOfRows(_:columns:)`
- `insertColumn(_:)`
- `insertColumn(_:with:)`
- `insertRow(_:)`
- `insertRow(_:with:)`
- `intercellSpacing`
- `makeCell(atRow:column:)`
- `numberOfColumns`
- `numberOfRows`
- `putCell(_:atRow:column:)`
- `removeColumn(_:)`
- `removeRow(_:)`
- `renewRows(_:columns:)`
- `sort(using:context:)`
- `sort(using:)`

### Auto Layout Sizing

- `autorecalculatesCellSize`

### Finding Matrix Coordinates

- `getRow(_:column:for:)`
- `getRow(_:column:of:)`

### Managing Attributes of Individual Cells

- `setState(_:atRow:column:)`
- `setToolTip(_:for:)`
- `toolTip(for:)`

### Selecting and Deselecting Cells

- `selectCell(atRow:column:)`
- `selectCell(withTag:)`
- `selectAll(_:)`
- `keyCell`
- `setSelectionFrom(_:to:anchor:highlight:)`
- `deselectAllCells()`
- `deselectSelectedCell()`

### Finding Cells

- `selectedCells`
- `selectedColumn`
- `selectedRow`
- `cell(atRow:column:)`
- `cell(withTag:)`
- `cells`

### Modifying Graphics Attributes

- `backgroundColor`
- `cellBackgroundColor`
- `drawsBackground`
- `drawsCellBackground`

### Editing Text in Cells

- `selectText(_:)`
- `selectText(atRow:column:)`
- `textShouldBeginEditing(_:)`
- `textDidBeginEditing(_:)`
- `textDidChange(_:)`
- `textShouldEndEditing(_:)`
- `textDidEndEditing(_:)`

### Setting Tab Key Behavior

- `tabKeyTraversesCells`

### Managing the Delegate

- `delegate`
- `NSMatrixDelegate`

### Resizing the Matrix and Its Cells

- `autosizesCells`
- `setValidateSize(_:)`
- `sizeToCells()`

### Scrolling Cells in the Matrix

- `isAutoscroll`
- `setScrollable(_:)`
- `scrollCellToVisible(atRow:column:)`

### Displaying and Highlighting Cells

- `drawCell(atRow:column:)`
- `highlightCell(_:atRow:column:)`

### Managing and Sending Action Messages

- `sendAction()`
- `sendAction(_:to:forAllCells:)`
- `doubleAction`
- `sendDoubleAction()`

### Handling Event and Action Messages

- `acceptsFirstMouse(for:)`
- `mouseDown(with:)`
- `mouseDownFlags`
- `performKeyEquivalent(with:)`

### Managing the Cursor

- `resetCursorRects()`

### Constants

- `NSMatrix.Mode`

### Instance Methods

- `selectedCell()`

## See Also

- `Responding to control-based events using target-action`
- `NSButton`
- `NSColorWell`
- `Combo Box`
- `NSComboButton`
- `Date Picker`
- `NSImageView`
- `NSLevelIndicator`
- `Path Control`
- `NSPopUpButton`
- `NSProgressIndicator`
- `NSRuleEditor`
- `NSPredicateEditor`
- `Search Field`
- `NSSegmentedControl`
