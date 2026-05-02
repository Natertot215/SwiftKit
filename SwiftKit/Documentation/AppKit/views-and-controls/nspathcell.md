---
url: https://developer.apple.com/documentation/appkit/nspathcell
framework: AppKit
category: Views and controls
title: NSPathCell
kind: class
captured: 2026-05-02
---

# NSPathCell

The user interface of a path control object.

## Declaration

```swift
class NSPathCell
```

### Overview

`NSPathCell` maintains a collection of `NSPathComponentCell` objects that represent a particular path to be displayed to the user.

The path shown can be set with the `NSPathCell/clickedPathComponentCell` method. Doing so removes all displayed `NSPathComponentCell` objects and automatically fills the control with `NSPathComponentCell` objects set to have the appropriate icons, display titles, and `NSURL` values for the particular path component they represent. Alternatively, you can fill the control manually by setting the cell array or directly modifying existing cells.

Both an action and double-click action can be set for the path control. To find out what path component cell was clicked in the action, you can read the value of `NSPathCell/clickedPathComponentCell`. When the style is set to `NSPathControl/Style/popUp`, the action is still sent, and the `NSPathCell/clickedPathComponentCell` value for the represented menu item is correctly set. The `NSPathCell/clickedPathComponentCell` value is valid only when the action is being sent. It is also valid when the keyboard is used to invoke the action.

Automatic animated expansion of partially hidden `NSPathComponentCell` objects happens if you correctly call `NSResponder/mouseEntered(with:)` and `NSResponder/mouseExited(with:)` for each `NSPathComponentCell` in the `NSPathCell` object. This is not required if the `NSPathCell/pathStyle` is set to `NSPathControl/Style/popUp`, or if you wish to not have the animation.

`NSPathCell` supports several path display styles. `NSPathControl/Style/standard` has a light blue background with arrows indicating the path. `NSPathStyle/NSPathStyleNavigationBar` has more defined arrows (chevrons) and looks a little like a segmented button. `NSPathControl/Style/popUp` looks and works like an `NSPopUpButton` object to display the full path, or, if the cell is editable, select a new path.

If the cell’s `NSCell/isEditable` method returns `true` (the default), you can drag and drop into the cell to change the value. You can constrain what can be dropped using UTIs (Uniform Type Identifiers) with `NSPathCell/allowedTypes` or the appropriate delegate methods on `NSPathControl`.

If the cell’s `NSCell/isSelectable` method returns `true` (the default), the cell’s contents can automatically be dragged out. The proper UTI, filename, and URL are placed on the pasteboard. You can further control or limit this by using the appropriate delegate methods on `NSPathControl`.

If the cell is editable and has the path style set to `NSPathControl/Style/popUp`, an additional item in the pop-up menu allows selecting another location. By default, an `NSOpenPanel` object is configured based on the allowed types. The `NSOpenPanel` object can be customized with a delegate method.

### Setting the control size

When setting the `NSCell/controlSize` property, `NSPathCell` properly respects the control size for the `NSPathControl/Style/standard` and `NSPathControl/Style/popUp` styles. When the control size is set, the new size is propagated to subcells. When the path style is set to `NSPathStyle/NSPathStyleNavigationBar`, you cannot change the control size, and it is always set to `NSSmallControlSize`. Attempting to change the control size when the path style is `NSPathStyle/NSPathStyleNavigationBar` causes an assertion. Setting the path style to `NSPathStyle/NSPathStyleNavigationBar` forces the control size to be `NSSmallControlSize`.





## Relationships

**Inherits From**: `NSActionCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSOpenSavePanelDelegate`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.5

## Topics

### Displaying Hidden Components

- `mouseEntered(with:frame:in:)`
- `mouseExited(with:frame:in:)`

### Setting the Allowed Types

- `allowedTypes`

### Setting the Control Style

- `pathStyle`

### Setting the Object Value

- `setObjectValue(_:)`

### Setting Cell Appearance

- `placeholderAttributedString`
- `placeholderString`
- `backgroundColor`

### Managing Path Components

- `pathComponentCellClass`
- `rect(of:withFrame:in:)`
- `pathComponentCell(at:withFrame:in:)`
- `clickedPathComponentCell`
- `pathComponentCells`

### Setting the Double-Click Action

- `doubleAction`

### Setting the Path

- `url`
- `clickedPathComponentCell`

### Setting the Delegate

- `delegate`

### Constants

- `NSPathControl.Style`

## See Also

- `NSPathCellDelegate`
- `NSPathComponentCell`
- `NSPathControlItem`
