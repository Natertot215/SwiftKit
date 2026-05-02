---
url: https://developer.apple.com/documentation/appkit/nstabviewcontroller
framework: AppKit
category: View management
title: NSTabViewController
kind: class
captured: 2026-05-02
---

# NSTabViewController

A container view controller that manages a tab view interface, which organizes multiple pages of content but displays only one page at a time.

## Declaration

```swift
class NSTabViewController
```

### Overview

Each page of content is managed by a separate child view controller. Navigation between child view controllers is accomplished with the help of an `NSTabView` object, which the tab view controller manages. When the user selects a new tab, the tab view controller displays the content associated with the associated child view controller, replacing the previous content.

Each tab is represented by an `NSTabViewItem` object, which contains the name of the tab and stores a pointer to the child view controller that manages the tab’s content. Normally, you configure the tab view items at design time using Interface Builder, but you can also add them programmatically using the methods of this class. Always assign a child view controller to new tab view items before adding those items to the tab view interface.

Another way to add tabs programmatically is to add child view controllers directly to the tab view controller. When you call the `NSViewController/addChild(_:)` or `NSViewController/insertChild(_:at:)` method of this class, the tab view controller automatically creates a default `NSTabViewItem` object for the specified view controller. You can fetch the newly created item using the `NSTabViewController/tabViewItem(for:)` method and configure it. Removing a child view controller with the `NSViewController/removeChild(at:)` method similarly removes the corresponding tab view item.

The tab view controller lazily loads the views associated with each child view controller, creating them only after the corresponding tab is selected. When the tab view controller’s view is first displayed, only the view for the initially selected tab is loaded.

The `NSTabViewController/tabStyle-swift.property` property determines the appearance of the tab controls. A tab view controller can display a segmented control or display tabs in the window’s toolbar. You can also provide your own control for displaying tabs. The tab view controller automatically coordinates interactions between designated control and the corresponding `NSTabViewController/tabView` object.





## Relationships

**Inherits From**: `NSViewController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSExtensionRequestHandling`, `NSObjectProtocol`, `NSSeguePerforming`, `NSStandardKeyBindingResponding`, `NSTabViewDelegate`, `NSToolbarDelegate`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.10

## Topics

### Configuring the Tab View

- `tabStyle`
- `tabView`
- `transitionOptions`
- `canPropagateSelectedChildViewControllerTitle`

### Managing Tab View Items

- `tabViewItems`
- `tabViewItem(for:)`
- `addTabViewItem(_:)`
- `insertTabViewItem(_:at:)`
- `removeTabViewItem(_:)`
- `selectedTabViewItemIndex`

### Responding to Tab View Events

- `viewDidLoad()`
- `tabView(_:shouldSelect:)`
- `tabView(_:willSelect:)`
- `tabView(_:didSelect:)`

### Responding to Toolbar Events

- `toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:)`
- `toolbarAllowedItemIdentifiers(_:)`
- `toolbarDefaultItemIdentifiers(_:)`
- `toolbarSelectableItemIdentifiers(_:)`

### Constants

- `NSTabViewController.TabStyle`

## See Also

- `NSTabView`
- `NSTabViewItem`
