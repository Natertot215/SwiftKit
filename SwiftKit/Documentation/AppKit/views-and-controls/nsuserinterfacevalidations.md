---
url: https://developer.apple.com/documentation/appkit/nsuserinterfacevalidations
framework: AppKit
category: Views and controls
title: NSUserInterfaceValidations
kind: protocol
captured: 2026-05-02
---

# NSUserInterfaceValidations

A protocol that a custom class can adopt to manage the enabled state of a UI element.

## Declaration

```swift
protocol NSUserInterfaceValidations
```

### Overview

The `NSUserInterfaceValidations` protocol works with the `NSValidatedUserInterfaceItem` protocol to allow the target of a user interface element such as a menu item or a toolbar item to decide whether or not the user interface element should be enabled.

Your custom classes should adopt this protocol if an instance may be the target of a user interface element and need to conditionally enable or disable the element based on the current state of the instance. For more details, read `https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/UIValidation/UIValidation.html#//apple_ref/doc/uid/10000040i`.





## Relationships

**Conforming Types**: `NSApplication`, `NSButton`, `NSColorPanel`, `NSComboBox`, `NSDocument`, `NSDocumentController`, `NSFontPanel`, `NSForm`, `NSMatrix`, `NSOpenPanel`, `NSOutlineView`, `NSPanel`, `NSPersistentDocument`, `NSPopUpButton`, `NSSavePanel`, `NSSearchField`, `NSSecureTextField`, `NSSplitViewController`, `NSStatusBarButton`, `NSTableView`, `NSTextField`, `NSTextView`, `NSTokenField`, `NSWindow`

## Availability

- macOS ?

## Topics

### Validating user interface items

- `validateUserInterfaceItem(_:)`

## See Also

- `NSValidatedUserInterfaceItem`
