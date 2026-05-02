---
url: https://developer.apple.com/documentation/appkit/nslayoutanchor
framework: AppKit
category: View layout
title: NSLayoutAnchor
kind: class
captured: 2026-05-02
---

# NSLayoutAnchor

A factory class for creating layout constraint objects using a fluent API.

## Declaration

```swift
class NSLayoutAnchor<AnchorType> where AnchorType : AnyObject
```

### Overview

Use these constraints to programatically define your layout using Auto Layout. Instead of creating `NSLayoutConstraint` objects directly, start with an `NSView` or `NSLayoutGuide` object you wish to constrain, and select one of that object’s anchor properties. These properties correspond to the main `NSLayoutConstraint/Attribute` values used in Auto Layout, and provide an appropriate `NSLayoutAnchor` subclass for creating constraints to that attribute. Use the anchor’s methods to construct your constraint.

As you can see from these examples, the `NSLayoutAnchor` class provides several advantages over using the `NSLayoutConstraint` API directly.

- The code is cleaner, more concise, and easier to read.
- The `NSLayoutConstraint/Attribute` subclasses provide additional type checking, preventing you from creating invalid constraints.

> **NOTE:**  While the `NSLayoutAnchor` class provides additional type checking, it is still possible to create invalid constraints. For example, the compiler allows you to constrain one view’s `NSView/leadingAnchor` with another view’s `NSView/leftAnchor`, since they are both `NSLayoutXAxisAnchor` instances. However, Auto Layout does not allow constraints that mix leading and trailing attributes with left or right attributes. As a result, this constraint crashes at runtime.

For more information on the anchor properties, see `NSView/bottomAnchor` in the `NSView` or `NSLayoutGuide`.

> **NOTE:**  You never use the `NSLayoutAnchor` class directly. Instead, use one of its subclasses, based on the type of constraint you wish to create.

- Use `NSLayoutXAxisAnchor` to create horizontal constraints.
- Use `NSLayoutYAxisAnchor` to create vertical constraints.
- Use `NSLayoutDimension` to create constraints that affect the view’s height or width.

However, since you access `NSLayoutAnchor` objects using the anchor properties of an `NSView` or `NSLayoutGuide`, a correct subclass is automatically provided.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSLayoutDimension`, `NSLayoutXAxisAnchor`, `NSLayoutYAxisAnchor`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.11

## Topics

### Building constraints

- `constraint(equalTo:)`
- `constraint(equalTo:constant:)`
- `constraint(greaterThanOrEqualTo:)`
- `constraint(greaterThanOrEqualTo:constant:)`
- `constraint(lessThanOrEqualTo:)`
- `constraint(lessThanOrEqualTo:constant:)`

### Debugging the anchor

- `constraintsAffectingLayout`
- `hasAmbiguousLayout`
- `name`
- `item`

### Initializers

- `init(coder:)`

## See Also

- `NSLayoutXAxisAnchor`
- `NSLayoutYAxisAnchor`
