---
url: https://developer.apple.com/documentation/appkit/nstokenfielddelegate
framework: AppKit
category: Views and controls
title: NSTokenFieldDelegate
kind: protocol
captured: 2026-05-02
---

# NSTokenFieldDelegate

A set of optional methods implemented by delegates of `NSTokenField` objects.

## Declaration

```swift
protocol NSTokenFieldDelegate : NSTextFieldDelegate
```







## Relationships

**Inherits From**: `NSControlTextEditingDelegate`, `NSObjectProtocol`, `NSTextFieldDelegate`

## Availability

- macOS ?

## Topics

### Displaying Tokenized Strings

- `tokenField(_:displayStringForRepresentedObject:)`
- `tokenField(_:styleForRepresentedObject:)`

### Editing a Tokenized Strings

- `tokenField(_:completionsForSubstring:indexOfToken:indexOfSelectedItem:)`
- `tokenField(_:editingStringForRepresentedObject:)`
- `tokenField(_:representedObjectForEditing:)`
- `tokenField(_:shouldAdd:at:)`

### Reading To and Writing From the Pasteboard

- `tokenField(_:readFrom:)`
- `tokenField(_:writeRepresentedObjects:to:)`

### Managing Menus for Represented Objects

- `tokenField(_:hasMenuForRepresentedObject:)`
- `tokenField(_:menuForRepresentedObject:)`
