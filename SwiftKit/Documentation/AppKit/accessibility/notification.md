---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/notification
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibility.Notification
kind: struct
captured: 2026-05-01
---

# NSAccessibility.Notification

## Declaration

```swift
struct Notification
```

## Overview

The name of the notification.

## Availability

- **macOS**

## Conformance

- `Equatable`
- `Hashable`
- `RawRepresentable`
- `Sendable`
- `SendableMetatype`

## Topics

### Notification Names

The structure provides numerous static properties representing accessibility notifications:

- `announcementRequested` - Posted when an app needs to make an announcement to the user
- `applicationActivated` - Posted after the app has been activated
- `applicationDeactivated` - Posted after the app has been deactivated
- `applicationHidden` - Posted after the app is hidden
- `applicationShown` - Posted after the app is shown
- `created` - Posted after an accessibility element is created
- `drawerCreated` - Posted after a drawer appears
- `focusedUIElementChanged` - Posted after an accessibility element gains focus
- `focusedWindowChanged` - Posted after the key window changes
- `helpTagCreated` - Posted after a help tag appears
- `layoutChanged` - Posted when the UI changes requiring accessibility client attention
- `mainWindowChanged` - Posted after the main window changes
- `moved` - Posted after an accessibility element moves
- `resized` - Posted after an accessibility element's size changes
- `rowCollapsed`, `rowExpanded`, `rowCountChanged` - Posted for row state changes
- `selectedCellsChanged`, `selectedChildrenChanged`, `selectedColumnsChanged`, `selectedRowsChanged`, `selectedTextChanged` - Posted after selection changes
- `titleChanged` - Posted after an accessibility element's title changes
- `uiElementDestroyed` - Posted after an accessibility element is destroyed
- `unitsChanged` - Posted after units in a layout area change
- `valueChanged` - Posted after an accessibility element's value changes
- `windowCreated`, `windowMiniaturized`, `windowDeminiaturized`, `windowMoved`, `windowResized` - Posted for window state changes

### Accessibility Notification Names

- `NSAccessibilityAutocorrectionOccurred`
- `NSAccessibilityDraggingDestinationDragAccepted`
- `NSAccessibilityDraggingDestinationDragNotAccepted`
- `NSAccessibilityDraggingDestinationDropAllowed`
- `NSAccessibilityDraggingDestinationDropNotAllowed`
- `NSAccessibilityDraggingSourceDragBegan`
- `NSAccessibilityDraggingSourceDragEnded`
- `NSAccessibilityTextInputMarkingSessionBegan`
- `NSAccessibilityTextInputMarkingSessionEnded`

### Initializers

- `init(rawValue: String)` - Creates a new instance with the specified raw value

## Usage Notes

When posting accessibility notifications, use the `post(element:notification:)` function instead of an `NSNotificationCenter` instance.

## See Also

- `NSAccessibility.Action`
- `NSAccessibility.Attribute`
- `NSAccessibility.NotificationUserInfoKey`
- `NSAccessibility.Role`
- `NSAccessibility.Subrole`
