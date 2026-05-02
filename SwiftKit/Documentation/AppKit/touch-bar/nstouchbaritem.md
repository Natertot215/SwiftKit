---
url: https://developer.apple.com/documentation/appkit/nstouchbaritem
framework: AppKit
category: Touch Bar
title: NSTouchBarItem
kind: class
captured: 2026-05-02
---

# NSTouchBarItem

A UI control shown in the Touch Bar on supported models of MacBook Pro.

## Declaration

```swift
@MainActor class NSTouchBarItem
```

### Overview

An instance of the `NSTouchBarItem` class is called an *item*item. It appears to the user on the Touch Bar, typically along with other items, within the (invisible) bounds of the view for an `NSTouchBar` object, called a *bar*bar.

You use an item by adding it or its identifier to one or another of a bar’s arrays, depending on your app’s architecture and on the user customization you want to support. Because of the close interaction between bars and items, be sure you have read the overview for the `NSTouchBar` class before continuing here to learn about items.

AppKit provides a rich set of subclasses of `NSTouchBarItem`, each of which is described in the corresponding class reference document:

- An `NSCandidateListTouchBarItem` object (a *candidate-list item*candidate-list item), along with its delegate, provides a list of textual suggestions for the current text view
- An `NSColorPickerTouchBarItem` object (a *color picker item*color picker item) provides a system-defined color picker
- An `NSCustomTouchBarItem` object (a *custom item*custom item) contains a responder of your choice, such as a view, a button, or a scrubber (an instance of the `NSScrubber` class)
- An `NSGroupTouchBarItem` object (a *group item*group item) provides a bar to contain other items
- An `NSPopoverTouchBarItem` object (a *popover item*popover item) provides a two-state control that, when touched or pressed, expands into its second state, showing the contents of a bar it owns
- An `NSSharingServicePickerTouchBarItem` object (a *sharing service picker item*sharing service picker item), along with its delegate, provides a list of objects eligible for sharing
- An `NSSliderTouchBarItem` object (a *slider item*slider item) provides a slider control for choosing a value in a range

The two most commonly-used item classes are `NSCustomTouchBarItem` and `NSPopoverTouchBarItem`.

Refer to the following sample code projects which demonstrate how to use `NSTouchBarItem` and related classes:

- `creating-and-customizing-the-touch-bar`
- `integrating-a-toolbar-and-touch-bar-into-your-app`

#### Custom items

You typically use a *custom item*custom item (an instance of the `NSCustomTouchBarItem` class) to hold a view. For example, to place a button in the Touch Bar, proceed as follows:

1. Use an `NSButton` convenience initializer such as `NSButton/init(title:image:target:action:)` to create and configure the button.
2. Set the `NSTouchBarItem/view` property for a custom item to point to the new button.

> **NOTE:**  When you create custom items, it’s important to use convenience initializers, available starting in macOS 10.12, for the `NSButton`, `NSSegmentedControl`, and `NSSlider` classes. These initializers take care of sizing their controls correctly for the Touch Bar, and they configure appearance appropriately for the Touch Bar. If you don’t use the convenience initializers, it’s your app’s responsibility to ensure correct sizing and appearance.

#### Popover items

A *popover item*popover item (an instance of the `NSPopoverTouchBarItem` class) — the second commonly-used type — lets you provide a new bar (an `NSTouchBar` object) when a user taps, or presses-and-holds, on the collapsed representation of the popover item.

In its expanded state, a popover appears as an overlay above other items in the Touch Bar.

To show a bar when a user taps a popover item, specify a bar in the item’s `NSPopoverTouchBarItem/popoverTouchBar` property. Enable press-and-hold by specifying a bar in the `NSPopoverTouchBarItem/pressAndHoldTouchBar` property. The press-and-hold feature is suitable only for a simple popover, such as one that contains a single segmented control (an instance of the `NSSegmentedControl` class) or slider (an instance of the `NSSliderTouchBarItem` class).

> **NOTE:**  If your popover bar requires significant user interaction and contains many items or many scroll views, don’t enable press-and-hold; doing so can result in an awkward user experience.

The system automatically shows a chevron in the popover item under the following conditions: You specify the same `NSTouchBar` object for both `NSPopoverTouchBarItem/pressAndHoldTouchBar` and `NSPopoverTouchBarItem/popoverTouchBar` properties, *and*and you use the default view for the popover item’s `NSPopoverTouchBarItem/collapsedRepresentation` property.

If you provide a popover item that contains a scrubber (an `NSScrubber` instance), you’ll likely want to dismiss both the scrubber and the popover after the user makes their selection in the scrubber. A good approach to achieve this user interaction is to subclass `NSPopoverTouchBarItem`, employing your instance of the subclass as the scrubber’s delegate. You can then configure the delegate object, within its `NSScrubberDelegate/didFinishInteracting(with:)` method, to call the popover’s `NSPopoverTouchBarItem/dismissPopover(_:)` method.

If you place a segmented control in a bar for a popover item, take care *not*not to use `NSSegmentedControl/SwitchTracking/momentary` option of the `NSSegmentedControl/SwitchTracking` enumeration because doing so interferes with the user’s operation of the control.

#### Other common item types

To provide a *slider item*slider item, always use the `NSSliderTouchBarItem` class, which employs a standard slider but is optimized for user interaction with the Touch Bar. (That is, don’t instead add an `NSSlider` object directly to a custom item.)

A *group item*group item (an instance of the `NSGroupTouchBarItem` class) is a container that provides a bar, in its `NSGroupTouchBarItem/groupTouchBar` property, with its own array of items. You can enable customization for the items in a group’s contained bar, in the same way you would for items directly within a top-level bar. Using a group item lets you provide different user customization rules for different parts of the Touch Bar. Using a group item also lets you enable centering of the group within the Touch Bar.

A *spacing item*spacing item lets you add custom spacing between items in a bar. Specify a spacing item for a bar by assigning the `NSTouchBarItem/Identifier-swift.struct/fixedSpaceSmall`, `NSTouchBarItem/Identifier-swift.struct/fixedSpaceLarge`, or `NSTouchBarItem/Identifier-swift.struct/flexibleSpace` identifier to an item, and adding that item to the bar’s items array. The system automatically instantiates and configures spacing items based on the identifiers you specify.

#### Configuration

You must configure each item with a unique identifier, and can optionally assign a visibility priority or tag it as a principal item.

**NSTouchBarItem identification.**NSTouchBarItem identification. You must provide a unique identifier for each item in the bar, apart from spacing items. Specify an identifier, of type `NSTouchBarItem/Identifier-swift.struct` (called an *item identifier*item identifier), for each item when you initialize it. The item identifier serves as a persistable weak reference to the item. The system uses item identifiers to populate bars and to track and record changes for user customization.

**NSTouchBarItem priority for visibility.**NSTouchBarItem priority for visibility. If the system is showing a bar in the Touch Bar, but horizontal space is constrained and the bar defines more items than will fit, the system hides some of the items. You influence this hide/show behavior by setting a value for the `NSTouchBarItem/visibilityPriority` property of each item.

Lower-visibility-priority items get hidden by the system, as needed, before higher-visibility-priority items do.

To set visibility priority, use the constants in the `NSTouchBarItem/Priority` enumeration, or assign an integer value. The value `0` indicates `NSTouchBarItem/Priority/normal` visibility priority. Visibility priority increases with increasing numerical value. The `NSTouchBarItem/Priority/low` constant provides a value of `-1000`; the `NSTouchBarItem/Priority/high` constant, a value `+1000`. You can use integers outside of this range if you need to.

The system hides or shows groups of identical-priority items (defined within a single bar) together. The one exception to this rule is for items whose visibility priority is `NSTouchBarItem/Priority/normal`; these items get hidden one-by-one, with the normal-priority item farthest to the right getting hidden first. If horizontal space later increases in the Touch Bar, and hidden, normal-priority items become eligible for display, the system first shows the most recently-hidden of those items.

**Principal Items.**Principal Items. Within a bar, you can optionally specify an item as having special significance by employing the `NSTouchBar/principalItemIdentifier` property. The system attempts to center a principal item within the Touch Bar. If you want a group of items to appear centered in the Touch Bar, designate the group item (of type `NSTouchBarItem`) as the principal item.

If more than one bar in the responder chain is eligible to be visible in the Touch Bar, and more than one of those has a principal item, the system determines which one to center in the Touch Bar.

##### Fonts, images, and colors

When using a button in a custom item, don’t attempt to set the button title’s font. In the Touch Bar, the system specifies fonts for standard controls.

If you need to specify a font, such as for custom drawing, use the `NSFont/systemFont(ofSize:)` class method (or related methods) of the `NSFont` class. Use a font size of `0` to automatically obtain appropriate sizing for the Touch Bar.

If you use an image in a button or other control in the Touch Bar, take care to employ a template image. Template images in the Touch Bar respond automatically to system white-point changes, and automatically react to user interactions. The overview in this document lists the built-in Touch Bar template images.

To use your own image assets, use Retina-resolution images, designated as `@2x` in your asset catalog and with a maximum height of 30 points (corresponding to 60 pixels).

To set colors on objects within an `NSTouchBarItem` object, use AppKit named colors and use a bezel color property (available starting in macOS 10.12.1). Named colors appear correctly in the Touch Bar, support appearance vibrancy, and respond to system white-point changes. In a button or a segmented control, employ the bezel color property to ensure appropriate appearance in the Touch Bar.

To set the background color on a button within a custom item, use code like this:

```swift
myButton.bezelColor = NSColor.controlColor 
```

To set color on text and glyphs in the Touch Bar, use the following colors from the `NSColor` class:

- `NSColor/labelColor`
- `NSColor/secondaryLabelColor`
- `NSColor/tertiaryLabelColor`
- `NSColor/quaternaryLabelColor`

The system automatically changes the relative brightness and the white-point of these colors, depending on the ambient light, and depending on other factors such as keyboard backlight level. Always use these colors, or colors that dynamically derive from these colors, for control backgrounds, text, icons, and glyphs in the Touch Bar.

##### Handling touch events

The easiest way to handle touch events in an item is to use AppKit controls, such as by adding a button, a segmented control, or a scrubber to the item. Standard AppKit controls convey touch events to your specified targets automatically, so use standard controls whenever possible in your app.

If standard controls are insufficient, you can create composite views with a combination of standard controls, custom views, and gesture recognizers that you manually add to those custom views.

If you require the lowest-level of control for touch event processing, you can use the `NSTouch` class directly. You might go this route, for example, to provide good user feedback in the case of a control placed within a scroll view.Direct use of touch methods allows fine-grained control over interaction. You can, for example, highlight a control immediately upon a user touching it, and then remove the highlight if the user then, without lifting the finger, performs a scroll gesture.

If using the `NSTouch` class directly, be sure to implement the `NSGestureRecognizer/touchesCancelled(with:)` responder method, because users can perform touch interactions that result in canceled touches.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSButtonTouchBarItem`, `NSCandidateListTouchBarItem`, `NSColorPickerTouchBarItem`, `NSCustomTouchBarItem`, `NSGroupTouchBarItem`, `NSPickerTouchBarItem`, `NSPopoverTouchBarItem`, `NSSharingServicePickerTouchBarItem`, `NSSliderTouchBarItem`, `NSStepperTouchBarItem`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS 10.12.2

## Topics

### Creating a bar item

- `init(identifier:)`
- `NSTouchBarItem.Identifier`
- `init(coder:)`

### Identifying a bar item

- `identifier`
- `NSTouchBarItem.Identifier`

### Managing item visibility

- `visibilityPriority`
- `NSTouchBarItem.Priority`
- `isVisible`

### Configuring bar customization

- `customizationLabel`

### Subclassing bar items

- `viewController`
- `view`

### Using template images

- `touchBarAddDetailTemplateName`
- `touchBarAddTemplateName`
- `touchBarAlarmTemplateName`
- `touchBarAudioInputMuteTemplateName`
- `touchBarAudioInputTemplateName`
- `touchBarAudioOutputMuteTemplateName`
- `touchBarAudioOutputVolumeHighTemplateName`
- `touchBarAudioOutputVolumeLowTemplateName`
- `touchBarAudioOutputVolumeMediumTemplateName`
- `touchBarAudioOutputVolumeOffTemplateName`
- `touchBarBookmarksTemplateName`
- `touchBarColorPickerFillName`
- `touchBarColorPickerFontName`
- `touchBarColorPickerStrokeName`
- `touchBarCommunicationAudioTemplateName`
- `touchBarCommunicationVideoTemplateName`
- `touchBarComposeTemplateName`
- `touchBarDeleteTemplateName`
- `touchBarDownloadTemplateName`
- `touchBarEnterFullScreenTemplateName`
- `touchBarExitFullScreenTemplateName`
- `touchBarFastForwardTemplateName`
- `touchBarFolderTemplateName`
- `touchBarFolderCopyToTemplateName`
- `touchBarFolderMoveToTemplateName`
- `touchBarGetInfoTemplateName`
- `touchBarGoBackTemplateName`
- `touchBarGoDownTemplateName`
- `touchBarGoForwardTemplateName`
- `touchBarGoUpTemplateName`
- `touchBarHistoryTemplateName`
- `touchBarIconViewTemplateName`
- `touchBarListViewTemplateName`
- `touchBarMailTemplateName`
- `touchBarNewFolderTemplateName`
- `touchBarNewMessageTemplateName`
- `touchBarOpenInBrowserTemplateName`
- `touchBarPauseTemplateName`
- `touchBarPlayTemplateName`
- `touchBarPlayPauseTemplateName`
- `touchBarPlayheadTemplateName`
- `touchBarQuickLookTemplateName`
- `touchBarRecordStartTemplateName`
- `touchBarRecordStopTemplateName`
- `touchBarRefreshTemplateName`
- `touchBarRewindTemplateName`
- `touchBarRotateLeftTemplateName`
- `touchBarRotateRightTemplateName`
- `touchBarSearchTemplateName`
- `touchBarShareTemplateName`
- `touchBarSidebarTemplateName`
- `touchBarSkipBackTemplateName`
- `touchBarSkipToStartTemplateName`
- `touchBarSkipBack30SecondsTemplateName`
- `touchBarSkipBack15SecondsTemplateName`
- `touchBarSkipAhead15SecondsTemplateName`
- `touchBarSkipAhead30SecondsTemplateName`
- `touchBarSkipToEndTemplateName`
- `touchBarSkipAheadTemplateName`
- `touchBarSlideshowTemplateName`
- `touchBarTagIconTemplateName`
- `touchBarTextBoxTemplateName`
- `touchBarTextListTemplateName`
- `touchBarTextBoldTemplateName`
- `touchBarTextItalicTemplateName`
- `touchBarTextUnderlineTemplateName`
- `touchBarTextStrikethroughTemplateName`
- `touchBarTextJustifiedAlignTemplateName`
- `touchBarTextLeftAlignTemplateName`
- `touchBarTextCenterAlignTemplateName`
- `touchBarTextRightAlignTemplateName`
- `touchBarUserTemplateName`
- `touchBarUserAddTemplateName`
- `touchBarUserGroupTemplateName`
- `touchBarVolumeUpTemplateName`
- `touchBarVolumeDownTemplateName`

## See Also

- `NSCandidateListTouchBarItem`
- `NSColorPickerTouchBarItem`
- `NSCustomTouchBarItem`
- `NSGroupTouchBarItem`
- `NSPopoverTouchBarItem`
- `NSSharingServicePickerTouchBarItem`
- `NSSliderTouchBarItem`
- `NSStepperTouchBarItem`
- `NSUserInterfaceCompressionOptions`
- `NSButtonTouchBarItem`
- `NSPickerTouchBarItem`
- `NSPickerTouchBarItem.ControlRepresentation`
- `NSPickerTouchBarItem.SelectionMode`
