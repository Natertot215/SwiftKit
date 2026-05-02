---
url: https://developer.apple.com/documentation/appkit/accessibility-functions
framework: AppKit
category: Accessibility for AppKit
title: Accessibility Functions
kind: collectionGroup
captured: 2026-05-02
---

# Accessibility Functions

Global accessibility functions for custom views and controls.



### Overview

Use these `NSAccessibility-swift.struct` functions to enhance the accessibility experience of your custom view or control. Standard AppKit elements handle this behavior for you.

#### Notifications

Your custom view or control may need to let the assistive app know when changes occur. For example, if your control’s value changes, you need to send a `NSAccessibility-swift.struct/Notification/valueChanged` notification.

`NSAccessibility-swift.struct/Notification` defines a number of notifications that you can send using the `NSAccessibility-swift.struct/post(element:notification:)` method. You typically need to send your own notifications only when you’re creating a custom control or when you’re using a standard control in a nonstandard way. Make sure you’re posting any relevant notifications as your control’s state changes.









## Topics

### Notifications

- `post(element:notification:)`
- `post(element:notification:userInfo:)`
- `NSAccessibility.Notification`
- `NSAccessibility.NotificationUserInfoKey`

### Screen Coordinates

- `screenRect(fromView:rect:)`
- `screenPoint(fromView:point:)`

### Accessibility Objects

- `unignoredChildren(from:)`
- `unignoredChildrenForOnlyChild(from:)`
- `unignoredDescendant(of:)`
- `unignoredAncestor(of:)`

### Protected Content

- `setMayContainProtectedContent(_:)`

### Descriptions

- `description`
- `description(with:)`
- `description(for:)`

## See Also

- `Custom Controls`
