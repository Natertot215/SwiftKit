---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibility
kind: struct
captured: 2026-05-01
---

# NSAccessibility

## Overview
A namespace for accessibility symbols for AppKit apps.

## Declaration
```swift
struct NSAccessibility
```

## Abstract
NSAccessibility is a namespace structure that provides accessibility-related functionality for AppKit applications on macOS.

## Availability
- **Platform:** macOS
- **Module:** AppKit

## Conformances
- `BitwiseCopyable`

## Topics

### Posting Notifications
- `post(element:notification:)` - Sends a notification to any observing assistive apps.
- `post(element:notification:userInfo:)` - Sends a notification and an optional user info dictionary to any observing assistive apps.

### Getting Accessibility Objects
- `unignoredAncestor(of:)` - Returns an unignored accessibility object, ascending the hierarchy, if necessary.
- `unignoredChildren(from:)` - Returns a list of unignored accessibility objects, descending the hierarchy, if necessary.
- `unignoredChildrenForOnlyChild(from:)` - Returns a list of unignored accessibility objects, descending the hierarchy, if necessary.
- `unignoredDescendant(of:)` - Returns an unignored accessibility object, descending the hierarchy, if necessary.

### Getting Screen Coordinates
- `screenPoint(fromView:point:)` - Returns the point in screen coordinates.
- `screenRect(fromView:rect:)` - Returns the frame in screen coordinates.

### Specifying Protected Content
- `setMayContainProtectedContent(_:)` - Sets whether the app may have protected content.

### Handling Errors
- `ErrorCodeExceptionInfo` - An integer error code for debugging.

### Using Accessibility Types
- `Action` - Constants that describe types of actions.
- `Attribute` - Constants that describe attributes.
- `AnnotationAttributeKey` - Keys for annotation attributes.
- `FontAttributeKey` - Keys for font attributes.
- `Notification` - The name of the notification.
- `NotificationUserInfoKey` - The key in the user info dictionary for a notification.
- `ParameterizedAttribute` - Values that describe parameterized attributes.
- `Role` - Values that describe types of objects that accessibility elements represent.
- `Subrole` - Values that describe specialized object subtypes that accessibility elements represent.
- `OrientationValue` - Values that indicate the orientation of UI elements, such as scroll bars and split views.
- `SortDirectionValue` - Values that indicate the sort direction of a column.
- `RulerMarkerTypeValue` - Values that describe ruler marker types.
- `RulerUnitValue` - Values that indicate the unit values of a ruler or layout area.

### Deprecated
- `raiseBadArgumentException(_:_:_:)` - Raises an error if the parameter is the wrong type or has an illegal value.

## See Also
- `NSAccessibilityProtocol` - The complete list of properties and methods for accessible elements.
