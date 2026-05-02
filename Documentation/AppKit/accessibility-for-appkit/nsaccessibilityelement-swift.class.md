---
url: https://developer.apple.com/documentation/appkit/nsaccessibilityelement-swift.class
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityElement
kind: class
captured: 2026-05-02
---

# NSAccessibilityElement

The basic infrastructure necessary for interacting with an assistive app.

## Declaration

```swift
class NSAccessibilityElement
```

### Overview

Create subclasses of the `NSAccessibilityElement-swift.class` class to represent any of your user interface elements that don’t inherit from `NSView` or from one of the standard AppKit controls. This class represents your user interface element in the accessibility hierarchy and manages the details necessary for working with assistive apps.

To support accessibility features for a custom user interface element:

1. Create your `NSAccessibilityElement-swift.class` subclass by using `NSAccessibilityElement-swift.class/element(withRole:frame:label:parent:)`. You can also set these values using `NSAccessibilityProtocol/setAccessibilityRole(_:)`, `NSAccessibilityProtocol/setAccessibilityLabel(_:)` and `NSAccessibilityProtocol/setAccessibilityParent(_:)`.
2. Call the parent’s `NSAccessibilityElement-swift.class/accessibilityAddChildElement(_:)` method to add your subclass. You can also add the subclass to its parent’s `NSAccessibility-c.protocol/accessibilityChildren` array using `NSAccessibilityProtocol/setAccessibilityChildren(_:)`.
3. In your subclass, call `NSAccessibilityElement-swift.class/setAccessibilityFrameInParentSpace(_:)`. This ensures that your control moves with its superview.
4. In your subclass, adopt a role-specific protocol, customize the role, and post notifications just as you would handle any other accessible control. See `custom-controls`.
5. In your subclass, implement any additional properties and methods you may need to use to further customize your user interface element’s accessibility behavior. See `NSAccessibilityProtocol`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityProtocol`, `NSObjectProtocol`

## Availability

- macOS 10.10

## Topics

### Supporting the Accessibility Hierarchy

- `element(withRole:frame:label:parent:)`
- `accessibilityAddChildElement(_:)`
- `accessibilityFrameInParentSpace()`
- `setAccessibilityFrameInParentSpace(_:)`
