---
url: https://developer.apple.com/documentation/appkit/nsruleeditor
framework: AppKit
category: Views and controls
title: NSRuleEditor
kind: class
captured: 2026-05-02
---

# NSRuleEditor

An interface for configuring a rule-based list of options.

## Declaration

```swift
class NSRuleEditor
```

### Overview

A rule editor lets the user visually create and configure a list of options that are expressed as a predicate (as described in `https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html#//apple_ref/doc/uid/TP40001789`). Each row displayed by the rule editor represents a particular path down a tree of choices. The rule editor’s delegate provides the tree of choices to be displayed. The rule editor presents those choices to the user as a row of popup buttons, static text fields, and custom views.

`NSRuleEditor` exposes one binding, `rows`. You can bind `rows` to an ordered collection (such as an instance of `NSMutableArray`). Each object in the collection should have the following properties:

**@“rowType”**: An integer representing the type of the row (`NSRuleEditorRowType`).

**@“subrows”**: An ordered to-many relation (such as an instance of `NSMutableArray`) containing the directly nested subrows for the given row.

**@“displayValues”**: An ordered to-many relation containing the display values for the row.

**@“criteria”**: An ordered to-many relation containing the criteria for the row.

> **NOTE:** If you override `NSView/viewDidMoveToWindow()` in a subclass of `NSRuleEditor`, you must invoke super’s implementation.





## Relationships

**Inherits From**: `NSControl`

**Inherited By**: `NSPredicateEditor`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring the Delegate

- `delegate`
- `NSRuleEditorDelegate`

### Configuring a Rule Editor

- `isEditable`
- `nestingMode`
- `NSRuleEditor.NestingMode`
- `canRemoveAllRows`
- `rowHeight`

### Working with Formatting

- `formattingDictionary`
- `formattingStringsFilename`

### Providing Data

- `reloadCriteria()`
- `setCriteria(_:andDisplayValues:forRowAt:)`
- `criteria(forRow:)`
- `displayValues(forRow:)`

### Obtaining Row Information

- `numberOfRows`
- `parentRow(forRow:)`
- `row(forDisplayValue:)`
- `rowType(forRow:)`
- `NSRuleEditor.RowType`
- `subrowIndexes(forRow:)`

### Working with the Selection

- `selectedRowIndexes`
- `selectRowIndexes(_:byExtendingSelection:)`

### Manipulating Rows

- `addRow(_:)`
- `insertRow(at:with:asSubrowOfRow:animate:)`
- `removeRow(at:)`
- `removeRows(at:includeSubrows:)`

### Working with Predicates

- `predicate`
- `reloadPredicate()`
- `predicate(forRow:)`

### Supporting Bindings

- `rowClass`
- `rowTypeKeyPath`
- `subrowsKeyPath`
- `criteriaKeyPath`
- `displayValuesKeyPath`

### Notifications

- `rowsDidChangeNotification`

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
- `NSPredicateEditor`
- `Search Field`
- `NSSegmentedControl`
- `Slider`
