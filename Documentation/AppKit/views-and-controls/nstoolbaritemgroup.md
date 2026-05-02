---
url: https://developer.apple.com/documentation/appkit/nstoolbaritemgroup
framework: AppKit
category: Views and controls
title: NSToolbarItemGroup
kind: class
captured: 2026-05-02
---

# NSToolbarItemGroup

A group of subitems in a toolbar item.

## Declaration

```swift
class NSToolbarItemGroup
```

### Overview

An `NSToolbarItemGroup` represents a collection set of subitems in a toolbar that the system displays based on available space and settings that you specify. The system uses the views and labels of the subitems, but the parent’s attributes take precedence. This differs from other `NSToolbarItem` objects because they’re attached — the user drags them together as a single item rather than separately.

If a subitem of the group has an action set on it, the group uses that action instead of its own when the user clicks or taps on that item. The system prefers the subitem’s action if it exists, otherwise it uses the group’s action.

To configure an instance of `NSToolbarItemGroup`, you first create the individual toolbar subitems:

```objc
NSToolbarItem *item1 = [[NSToolbarItem alloc] initWithItemIdentifier:@"Item1"];
NSToolbarItem *item2 = [[NSToolbarItem alloc] initWithItemIdentifier:@"Item2"];
[item1 setImage:[NSImage imageNamed:@"LeftArrow"]];
[item2 setImage:[NSImage imageNamed:@"RightArrow"]];
[item1 setLabel:@"Prev"];
[item2 setLabel:@"Next"];
```

Then, you put them in a grouped item:

```objc
NSToolbarItemGroup *group = [[NSToolbarItemGroup alloc] initWithItemIdentifier:@"GroupItem"];
[group setSubitems:[NSArray arrayWithObjects:item1, item2, nil]];
```

In this configuration, you get two grouped items, and two labels.

If you set a label on the parent item, you get two grouped items with one shared label:

```objc
[group setLabel:@"Navigate"];
```

If instead you set a view on the parent item, you get two labels with one shared view:

```objc
[group setView:someSegmentedControl];
```





## Relationships

**Inherits From**: `NSToolbarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSValidatedUserInterfaceItem`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS 10.5

## Topics

### Creating grouped toolbar items

- `init(itemIdentifier:images:selectionMode:labels:target:action:)`
- `init(itemIdentifier:titles:selectionMode:labels:target:action:)`

### Working with subitems

- `subitems`
- `selectedIndex`
- `isSelected(at:)`
- `setSelected(_:at:)`

### Configuring grouped toolbar items

- `controlRepresentation`
- `NSToolbarItemGroup.ControlRepresentation`
- `selectionMode`
- `NSToolbarItemGroup.SelectionMode`

## See Also

- `NSToolbarItem`
- `NSToolbarItemGroup.ControlRepresentation`
- `NSToolbarItemGroup.SelectionMode`
- `NSMenuToolbarItem`
- `NSSearchToolbarItem`
- `NSTrackingSeparatorToolbarItem`
