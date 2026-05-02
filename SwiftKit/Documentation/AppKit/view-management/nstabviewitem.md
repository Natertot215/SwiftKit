---
url: https://developer.apple.com/documentation/appkit/nstabviewitem
framework: AppKit
category: View management
title: NSTabViewItem
kind: class
captured: 2026-05-02
---

# NSTabViewItem

An item in a tab view.

## Declaration

```swift
class NSTabViewItem
```

### Overview

An `NSTabViewItem` is a convenient way for presenting information in multiple pages. A tab view is usually distinguished by a row of tabs that give the visual appearance of folder tabs. When the user clicks a tab, the tab view displays a view page provided by your application. A tab view keeps a zero-based array of tab view items, one for each tab in the view.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating a Tab View Item

- `init(identifier:)`

### Working with Labels

- `drawLabel(_:in:)`
- `label`
- `sizeOfLabel(_:)`

### Checking the Tab Display State

- `tabState`

### Assigning an Identifier Object

- `identifier`

### Setting the Color

- `color`

### Assigning a View

- `view`

### Setting the Initial First Responder

- `initialFirstResponder`

### Accessing the Parent Tab View

- `tabView`

### Getting and Setting Tooltips

- `toolTip`

### Constants

- `NSTabViewItem.State`

### Initializers

- `init(viewController:)`
- `init(coder:)`

### Instance Properties

- `image`
- `viewController`

## See Also

- `NSTabViewController`
- `NSTabView`
