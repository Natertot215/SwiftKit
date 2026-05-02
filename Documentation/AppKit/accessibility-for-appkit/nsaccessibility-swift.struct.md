---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibility
kind: struct
captured: 2026-05-02
---

# NSAccessibility

A namespace for accessibility symbols for AppKit apps.

## Declaration

```swift
struct NSAccessibility
```







## Relationships

**Conforms To**: `BitwiseCopyable`

## Availability

- macOS ?

## Topics

### Posting Notifications

- `post(element:notification:)`
- `post(element:notification:userInfo:)`

### Getting Accessibility Objects

- `unignoredAncestor(of:)`
- `unignoredChildren(from:)`
- `unignoredChildrenForOnlyChild(from:)`
- `unignoredDescendant(of:)`

### Getting Screen Coordinates

- `screenPoint(fromView:point:)`
- `screenRect(fromView:rect:)`

### Specifying Protected Content

- `setMayContainProtectedContent(_:)`

### Handling Errors

- `ErrorCodeExceptionInfo`

### Using Accessibility Types

- `NSAccessibility.Action`
- `NSAccessibility.AnnotationAttributeKey`
- `NSAccessibility.Attribute`
- `NSAccessibility.FontAttributeKey`
- `NSAccessibility.Notification`
- `NSAccessibility.NotificationUserInfoKey`
- `NSAccessibility.OrientationValue`
- `NSAccessibility.ParameterizedAttribute`
- `NSAccessibility.Role`
- `NSAccessibility.RulerMarkerTypeValue`
- `NSAccessibility.RulerUnitValue`
- `NSAccessibility.SortDirectionValue`
- `NSAccessibility.Subrole`

### Deprecated

- `raiseBadArgumentException(_:_:_:)`

## See Also

- `NSAccessibilityProtocol`
