---
url: https://developer.apple.com/documentation/appkit/nsaccessibilityprotocol
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityProtocol
kind: protocol
captured: 2026-05-01
---

# NSAccessibilityProtocol

## Declaration

```swift
protocol NSAccessibilityProtocol : NSObjectProtocol
```

## Abstract

The complete list of properties and methods for accessible elements.

## Overview

To be accessible, an app must provide information to the assistive app about its user interface and capabilities. There are three ways that apps and assistive apps interact:

1. **Informational properties.** `NSAccessibilityProtocol` defines a number of properties that provide information about your view or control. If you're working with a subclass of a standard AppKit view or control, you can either set the desired property or override its getters and setters. By default, overriding only the getter tells the assistive app that it has read-only access to the property. Overriding the setter tells the assistive app that it also has write access to the property.

2. **Action methods.** `NSAccessibilityProtocol` also defines a number of methods that simulate button presses, mouse clicks, and selections in your view or control. By implementing these methods, you give assistive apps the ability to drive your view or control.

3. **Notifications.** Your view or control may need to let the assistive app know when changes occur. `NSAccessibility.Notification` defines a number of notifications that you can send using the `NSAccessibility.post(element:notification:)` method. The role-specific protocols don't include these notifications; however, standard AppKit controls already send appropriate messages for their standard usage patterns. You typically need to send your own notifications only when you're creating a custom control or when you're using a standard control in a nonstandard way.

## Implementation Notes

If you're using standard AppKit user interface elements, much of the work has been done for you. AppKit views and controls adopt the `NSAccessibilityProtocol` protocol by default. In particular, `NSView`, `NSWindow`, `NSCell`, and `NSDrawer` provide a default implementation for all the properties and methods in this protocol. In some cases, you may need to modify these default values to better represent your app, to provide additional context, or to modify the user's flow through the app.

If you're using custom view or control subclasses, you need to add the appropriate informational properties, action methods, and notifications by adopting a role-specific protocol instead of `NSAccessibilityProtocol`.

If you're using custom user interface elements that don't inherit from `NSView` or one of the other accessibility-enabled AppKit classes, subclass the `NSAccessibilityElement` class instead of adopting `NSAccessibilityProtocol`.

## Customizing User Interface Elements

Often, you can adjust how an assistive app interacts with your user interface element without creating a custom subclass. If a user interface element inherits from `NSView` or one of the other accessibility-enabled AppKit classes, you can customize it by:

- Setting its accessibility values using any of the setter methods in the `NSAccessibilityProtocol` protocol.
- Overriding any of the properties or methods in the `NSAccessibilityProtocol` protocol with a custom implementation.

If you override a getter method, the system lets assistive apps call your getter. This can be particularly useful when managing dynamic properties because you can calculate their current value on demand instead of trying to update the property in response to a change.

If you override a setter method, the system lets assistive apps both read and modify that property.

You can control which accessor methods the assistive app can use by overriding `isAccessibilitySelectorAllowed(_:)`. Return `true` if the assistive app can call the selector; otherwise, return `false`.

## Inheritance

Inherits from: `NSObjectProtocol`

## Conforming Types

The protocol is adopted by numerous AppKit classes including:
- `NSView`
- `NSWindow`
- `NSControl`
- `NSCell`
- `NSButton`
- `NSTextField`
- `NSTableView`
- `NSOutlineView`
- And many others (100+ AppKit classes)
