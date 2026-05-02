---
url: https://developer.apple.com/documentation/appkit/nssearchfield
framework: AppKit
category: Views and controls
title: NSSearchField
kind: class
captured: 2026-05-02
---

# NSSearchField

A text field optimized for performing text-based searches.

## Declaration

```swift
class NSSearchField
```

### Overview

`NSSearchField` provides a customized text field for entering search data. The class also provides a search button, a cancel button, and a pop-up icon menu for listing recent search strings and custom search categories.

An `NSSearchField` object wraps an `NSSearchFieldCell` object. The cell provides access to most search field attributes and a comprehensive programmatic interface for manipulating the search field. You can use an `NSSearchField` object to manipulate some aspects of the search field.

For additional information about search fields and how to implement them, see the `NSSearchFieldCell` class.





## Relationships

**Inherits From**: `NSTextField`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityNavigableStaticText`, `NSAccessibilityProtocol`, `NSAccessibilityStaticText`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTextContent`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Managing Search

- `delegate`
- `NSSearchFieldDelegate`

### Managing Menu Templates

- `searchMenuTemplate`
- `clearRecentsMenuItemTag`
- `noRecentsMenuItemTag`
- `recentsMenuItemTag`
- `recentsTitleMenuItemTag`

### Managing Search Modes

- `sendsSearchStringImmediately`
- `sendsWholeSearchString`

### Managing Recent Searches

- `recentSearches`
- `maximumRecents`
- `recentsAutosaveName`
- `NSSearchField.RecentsAutosaveName`

### Getting Search Field Metrics

- `cancelButtonBounds`
- `searchButtonBounds`
- `searchTextBounds`

### Deprecated Symbols

- `centersPlaceholder`
- `rectForCancelButton(whenCentered:)`
- `rectForSearchButton(whenCentered:)`
- `rectForSearchText(whenCentered:)`
