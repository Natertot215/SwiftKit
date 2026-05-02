---
url: https://developer.apple.com/documentation/appkit/nslayoutconstraint
framework: AppKit
category: View layout
title: NSLayoutConstraint
kind: class
captured: 2026-05-02
---

# NSLayoutConstraint

The relationship between two user interface objects that must be satisfied by the constraint-based layout system.

## Declaration

```swift
class NSLayoutConstraint
```

### Overview

Each constraint is a linear equation with the following format:

```objc
item1.attribute1 = multiplier × item2.attribute2 + constant
```

In this equation, `attribute1` and `attribute2` are the variables that Auto Layout can adjust when solving these constraints. The other values are defined when you create the constraint. For example, If you’re defining the relative position of two buttons, you might say “the leading edge of the second button should be 8 points after the trailing edge of the first button.” The linear equation for this relationship is shown below:

```objc
// positive values move to the right in left-to-right languages like English.
button2.leading = 1.0 × button1.trailing + 8.0
```

Auto Layout then modifies the values of the specified leading and trailing edges until both sides of the equation are equal. Note that Auto Layout does not simply assign the value of the right side of this equation to the left side. Instead, the system can modify either attribute or both attributes as needed to solve for this constraint.

The fact that constraints are equations (and not assignment operators) means that you can switch the order of the items in the equation as needed to more clearly express the desired relationship. However, if you switch the order, you must also invert the multiplier and constant. For example, the following two equations produce identical constraints:

```objc
// These equations produce identical constraints
button2.leading = 1.0 × button1.trailing + 8.0
button1.trailing = 1.0 × button2.leading - 8.0
```

A valid layout is defined as a set constraints with one and only one possible solution. Valid layouts are also referred to as a nonambiguous, nonconflicting layouts. Constraints with more than one solution are ambiguous. Constraints with no valid solutions are conflicting. For more information on resolving ambiguous and conflicting constraints, see `https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/TypesofErrors.html#//apple_ref/doc/uid/TP40010853-CH17` in `https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853`.

Additionally, constraints are not limited to equality relationships. They can also use greater than or equal to (>=) or less than or equal to (<=) to describe the relationship between the two attributes. Constraints also have priorities between 1 and 1,000. Constraints with a priority of 1,000 are required. All priorities less than 1,000 are optional. By default, all constraints are required (priority = 1,000).

After solving for the required constraints, Auto Layout tries to solve all the optional constraints in priority order from highest to lowest. If it cannot solve for an optional constraint, it tries to come as close as possible to the desired result, and then moves on to the next constraint.

This combination of inequalities, equalities, and priorities gives you a great amount of flexibility and power. By combining multiple constraints, you can define layouts that dynamically adapt as the size and location of the elements in your user interface change. For some example layouts, see `https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html#//apple_ref/doc/uid/TP40010853-CH11` in `https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSAnimatablePropertyContainer`, `NSObjectProtocol`

## Availability

- macOS 10.7

## Topics

### Creating constraints

- `constraints(withVisualFormat:options:metrics:views:)`
- `init(item:attribute:relatedBy:toItem:attribute:multiplier:constant:)`

### Activating and deactivating constraints

- `isActive`
- `activate(_:)`
- `deactivate(_:)`

### Accessing constraint data

- `firstItem`
- `firstAttribute`
- `relation`
- `secondItem`
- `secondAttribute`
- `multiplier`
- `constant`
- `firstAnchor`
- `secondAnchor`

### Getting the layout priority

- `priority`
- `NSLayoutConstraint.Priority`

### Identifying a constraint

- `identifier`

### Controlling constraint archiving

- `shouldBeArchived`

### Constants

- `NSLayoutConstraint.Relation`
- `NSLayoutConstraint.Attribute`
- `NSLayoutConstraint.FormatOptions`
- `NSLayoutConstraint.Orientation`
- `NSEdgeInsets`
