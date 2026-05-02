---
url: https://developer.apple.com/documentation/appkit/nstokenfieldcelldelegate
framework: AppKit
category: Views and controls
title: NSTokenFieldCellDelegate
kind: protocol
captured: 2026-05-02
---

# NSTokenFieldCellDelegate

A set of optional methods implemented by delegates of `NSTokenFieldCell` objects to work with tokenized strings.

## Declaration

```swift
protocol NSTokenFieldCellDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Displaying Tokenized Strings

- `tokenFieldCell(_:displayStringForRepresentedObject:)`
- `tokenFieldCell(_:styleForRepresentedObject:)`

### Editing a Tokenized Strings

- `tokenFieldCell(_:completionsForSubstring:indexOfToken:indexOfSelectedItem:)`
- `tokenFieldCell(_:editingStringForRepresentedObject:)`
- `tokenFieldCell(_:representedObjectForEditing:)`
- `tokenFieldCell(_:shouldAdd:at:)`

### Reading To and Writing From the Pasteboard

- `tokenFieldCell(_:readFrom:)`
- `tokenFieldCell(_:writeRepresentedObjects:to:)`

### Managing Menus for Represented Objects

- `tokenFieldCell(_:hasMenuForRepresentedObject:)`
- `tokenFieldCell(_:menuForRepresentedObject:)`

## See Also

- `NSTokenFieldCell`
