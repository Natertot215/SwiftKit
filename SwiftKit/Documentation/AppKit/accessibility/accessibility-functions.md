---
url: https://developer.apple.com/documentation/appkit/accessibility-functions
framework: AppKit
category: Accessibility for AppKit
title: Accessibility Functions
kind: article
captured: 2026-05-01
---

# NSAccessibility Accessibility Functions

## Overview

Global accessibility functions for custom views and controls in AppKit.

**Abstract:** Use these `NSAccessibility` functions to enhance the accessibility experience of your custom view or control. Standard AppKit elements handle this behavior for you.

---

## Main Sections

### Notifications

Your custom view or control may need to let assistive apps know when changes occur. For example, if your control's value changes, you need to send a `valueChanged` notification.

`NSAccessibility.Notification` defines a number of notifications that you can send using the `post(element:notification:)` method. You typically need to send your own notifications only when you're creating a custom control or when you're using a standard control in a nonstandard way. Make sure you're posting any relevant notifications as your control's state changes.

**Functions:**
- `post(element:notification:)` - Sends a notification to any observing assistive apps
- `post(element:notification:userInfo:)` - Sends a notification and an optional user info dictionary to any observing assistive apps
- `Notification` - The name of the notification
- `NotificationUserInfoKey` - The key in the user info dictionary for a notification

### Screen Coordinates

- `screenRect(fromView:rect:)` - Returns the frame in screen coordinates
- `screenPoint(fromView:point:)` - Returns the point in screen coordinates

### Accessibility Objects

- `unignoredChildren(from:)` - Returns a list of unignored accessibility objects, descending the hierarchy, if necessary
- `unignoredChildrenForOnlyChild(from:)` - Returns a list of unignored accessibility objects, descending the hierarchy, if necessary
- `unignoredDescendant(of:)` - Returns an unignored accessibility object, descending the hierarchy, if necessary
- `unignoredAncestor(of:)` - Returns an unignored accessibility object, ascending the hierarchy, if necessary

### Protected Content

- `setMayContainProtectedContent(_:)` - Sets whether the app may have protected content

### Descriptions

- `Action.description` - Returns a standard description for an action
- `Role.description(with:)` - Returns a standard description for a role and subrole
- `Role.description(for:)` - Returns a standard role description for a user interface element

---

## See Also

- Custom View Subclasses - Support accessibility for custom user interface elements by adopting a role-specific protocol and implementing its methods
