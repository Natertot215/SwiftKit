---
url: https://developer.apple.com/documentation/appkit/nssearchfieldcell
framework: AppKit
category: Views and controls
title: NSSearchFieldCell
kind: class
captured: 2026-05-02
---

# NSSearchFieldCell

The programmatic interface for text fields that are used for text-based searches.

## Declaration

```swift
class NSSearchFieldCell
```

### Overview

The `NSSearchFieldCell` class defines the programmatic interface for text fields that are optimized for text-based searches. An `NSSearchFieldCell` object is “wrapped” by an `NSSearchField` control object, which directly inherits from the `NSTextField` class. The search field implemented by these classes presents a standard user interface for searches, including a search button, a cancel button, and a pop-up icon menu for listing recent search strings and custom search categories.

When the user types and then pauses, the cell’s action message is sent to its target. You can query the cell’s string value for the current text to search for. Do not rely on the sender of the action to be an `NSMenu` object because the menu may change. If you need to change the menu, modify the search menu template and update the value in the `NSSearchFieldCell/searchMenuTemplate` property.





## Relationships

**Inherits From**: `NSTextFieldCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Managing buttons

- `searchButtonCell`
- `resetSearchButtonCell()`
- `cancelButtonCell`
- `resetCancelButtonCell()`

### Custom layout

- `searchTextRect(forBounds:)`
- `searchButtonRect(forBounds:)`
- `cancelButtonRect(forBounds:)`

### Managing menu templates

- `searchMenuTemplate`

### Managing search modes

- `sendsWholeSearchString`
- `sendsSearchStringImmediately`

### Managing recent search strings

- `maximumRecents`
- `recentSearches`
- `recentsAutosaveName`

### Constants

- `Menu tags`

### Initializers

- `init(coder:)`
- `init(textCell:)`
