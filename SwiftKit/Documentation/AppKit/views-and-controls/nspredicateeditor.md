---
url: https://developer.apple.com/documentation/appkit/nspredicateeditor
framework: AppKit
category: Views and controls
title: NSPredicateEditor
kind: class
captured: 2026-05-02
---

# NSPredicateEditor

A defined set of rules that allows the editing of predicate objects.

## Declaration

```swift
class NSPredicateEditor
```

### Overview

`NSPredicateEditor` provides an `NSPredicate` property—`NSControl/objectValue` (inherited from `NSControl`)—that you can get and set directly, and that you can bind using Cocoa bindings (you typically configure a predicate editor in Interface Builder). `NSPredicateEditor` depends on another class, `NSPredicateEditorRowTemplate`, that describes the available predicates and how to display them.

Unlike `NSRuleEditor`, `NSPredicateEditor` does not depend on its delegate to populate its rows (and *does not call the populating delegate methods*does not call the populating delegate methods). Instead, its rows are populated from its `objectValue` property (an instance of `NSPredicate`). `NSPredicateEditor` relies on instances `NSPredicateEditorRowTemplate`, which are responsible for mapping back and forth between the displayed view values and various predicates.

`NSPredicateEditor` exposes one property, `NSPredicateEditor/rowTemplates`, which is an array of `NSPredicateEditorRowTemplate` objects.





## Relationships

**Inherits From**: `NSRuleEditor`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.5

## Topics

### Managing Row Templates

- `rowTemplates`
- `NSPredicateEditorRowTemplate`

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
- `Search Field`
- `NSSegmentedControl`
- `Slider`
