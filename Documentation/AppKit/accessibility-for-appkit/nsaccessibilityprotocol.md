---
url: https://developer.apple.com/documentation/appkit/nsaccessibilityprotocol
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityProtocol
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityProtocol

The complete list of properties and methods for accessible elements.

## Declaration

```swift
protocol NSAccessibilityProtocol : NSObjectProtocol
```

### Overview

To be accessible, an app must provide information to the assistive app about its user interface and capabilities. There are three ways that apps and assistive apps interact:

- Informational properties. `NSAccessibilityProtocol` defines a number of properties that provide information about your view or control. If you’re working with a subclass of a standard AppKit view or control, you can either set the desired property or override its getters and setters. By default, overriding only the getter tells the assistive app that it has read-only access to the property. Overriding the setter tells the assistive app that it also has write access to the property.
- Action methods. `NSAccessibilityProtocol` also defines a number of methods that simulate button presses, mouse clicks, and selections in your view or control. By implementing these methods, you give assistive apps the ability to drive your view or control.
- Notifications. Your view or control may need to let the assistive app know when changes occur. `NSAccessibility-swift.struct/Notification` defines a number of notifications that you can send using the `NSAccessibility-swift.struct/post(element:notification:)` method. The role-specific protocols don’t include these notifications; however, standard AppKit controls already send appropriate messages for their standard usage patterns. You typically need to send your own notifications only when you’re creating a custom control or when you’re using a standard control in a nonstandard way.

If you’re using standard AppKit user interface elements, much of the work has been done for you. AppKit views and controls adopt the `NSAccessibilityProtocol` protocol by default. In particular, `NSView`, `NSWindow`, `NSCell`, and `NSDrawer` provide a default implementation for all the properties and methods in this protocol. In some cases, you may need to modify these default values to better represent your app, to provide additional context, or to modify the user’s flow through the app.

If you’re using custom view or control subclasses, you need to add the appropriate informational properties, action methods, and notifications. You do this by adopting a role-specific protocol instead of `NSAccessibilityProtocol`. See `custom-controls`.

If you’re using custom user interface elements that don’t inherit from `NSView` or one of the other accessibility-enabled AppKit classes, subclass the `NSAccessibilityElement-swift.class` class instead of adopting instead of `NSAccessibilityProtocol`.

#### Customizing User Interface Elements

Often, you can adjust how an assistive app interacts with your user interface element without creating a custom subclass. If a user interface element inherits from `NSView` or one of the other accessibility-enabled AppKit classes, you can customize it by:

- Setting its accessibility values using any of the setter methods in the `NSAccessibilityProtocol` protocol.
- Overriding any of the properties or methods in the `NSAccessibilityProtocol` protocol with a custom implementation.

If you override a getter method, the system lets assistive apps call your getter. This can be particularly useful when managing dynamic properties because you can calculate their current value on demand instead of trying to update the property in response to a change.

If you override a setter method, the system lets assistive apps both read and modify that property.

You can control which accessor methods the assistive app can use by overriding `NSAccessibilityProtocol/isAccessibilitySelectorAllowed(_:)`. Return `true` if the assistive app can call the selector; otherwise, return `false`.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSAccessibilityElement`, `NSActionCell`, `NSApplication`, `NSBackgroundExtensionView`, `NSBox`, `NSBrowser`, `NSBrowserCell`, `NSButton`, `NSButtonCell`, `NSCell`, `NSClipView`, `NSCollectionView`, `NSColorPanel`, `NSColorWell`, `NSComboBox`, `NSComboBoxCell`, `NSComboButton`, `NSControl`, `NSDatePicker`, `NSDatePickerCell`, `NSDrawer`, `NSFontPanel`, `NSForm`, `NSFormCell`, `NSGlassEffectContainerView`, `NSGlassEffectView`, `NSGridView`, `NSImageCell`, `NSImageView`, `NSLevelIndicator`, `NSLevelIndicatorCell`, `NSMatrix`, `NSMenu`, `NSMenuItem`, `NSMenuItemCell`, `NSOpenGLView`, `NSOpenPanel`, `NSOutlineView`, `NSPanel`, `NSPathCell`, `NSPathComponentCell`, `NSPathControl`, `NSPopUpButton`, `NSPopUpButtonCell`, `NSPopover`, `NSPredicateEditor`, `NSProgressIndicator`, `NSRuleEditor`, `NSRulerView`, `NSSavePanel`, `NSScrollView`, `NSScroller`, `NSScrubber`, `NSScrubberArrangedView`, `NSScrubberImageItemView`, `NSScrubberItemView`, `NSScrubberSelectionView`, `NSScrubberTextItemView`, `NSSearchField`, `NSSearchFieldCell`, `NSSecureTextField`, `NSSecureTextFieldCell`, `NSSegmentedCell`, `NSSegmentedControl`, `NSSlider`, `NSSliderAccessory`, `NSSliderCell`, `NSSplitView`, `NSStackView`, `NSStatusBarButton`, `NSStepper`, `NSStepperCell`, `NSSwitch`, `NSTabView`, `NSTableCellView`, `NSTableHeaderCell`, `NSTableHeaderView`, `NSTableRowView`, `NSTableView`, `NSText`, `NSTextAttachmentCell`, `NSTextField`, `NSTextFieldCell`, `NSTextInsertionIndicator`, `NSTextView`, `NSTokenField`, `NSTokenFieldCell`, `NSView`, `NSVisualEffectView`, `NSWindow`

## Availability

- macOS ?

## Topics

### Configuring accessibility

- `isAccessibilityElement()`
- `setAccessibilityElement(_:)`
- `isAccessibilityEnabled()`
- `setAccessibilityEnabled(_:)`
- `accessibilityFrame()`
- `setAccessibilityFrame(_:)`
- `accessibilityHelp()`
- `setAccessibilityHelp(_:)`
- `accessibilityLabel()`
- `setAccessibilityLabel(_:)`
- `accessibilityTitle()`
- `setAccessibilityTitle(_:)`
- `accessibilityValue()`
- `setAccessibilityValue(_:)`
- `isAccessibilitySelectorAllowed(_:)`

### Setting content and values

- `accessibilityContents()`
- `setAccessibilityContents(_:)`
- `accessibilityCriticalValue()`
- `setAccessibilityCriticalValue(_:)`
- `accessibilityIdentifier()`
- `setAccessibilityIdentifier(_:)`
- `accessibilityMaxValue()`
- `setAccessibilityMaxValue(_:)`
- `accessibilityMinValue()`
- `setAccessibilityMinValue(_:)`
- `accessibilityOrientation()`
- `setAccessibilityOrientation(_:)`
- `isAccessibilityProtectedContent()`
- `setAccessibilityProtectedContent(_:)`
- `isAccessibilitySelected()`
- `setAccessibilitySelected(_:)`
- `accessibilityURL()`
- `setAccessibilityURL(_:)`
- `accessibilityValueDescription()`
- `setAccessibilityValueDescription(_:)`
- `accessibilityWarningValue()`
- `setAccessibilityWarningValue(_:)`
- `NSAccessibilityOrientation`

### Determining relationships

- `accessibilityChildren()`
- `setAccessibilityChildren(_:)`
- `accessibilityChildrenInNavigationOrder()`
- `setAccessibilityChildrenInNavigationOrder(_:)`
- `accessibilityParent()`
- `setAccessibilityParent(_:)`
- `accessibilitySelectedChildren()`
- `setAccessibilitySelectedChildren(_:)`
- `accessibilityTopLevelUIElement()`
- `setAccessibilityTopLevelUIElement(_:)`
- `accessibilityVisibleChildren()`
- `setAccessibilityVisibleChildren(_:)`

### Setting the focus

- `accessibilityApplicationFocusedUIElement()`
- `setAccessibilityApplicationFocusedUIElement(_:)`
- `isAccessibilityFocused()`
- `setAccessibilityFocused(_:)`
- `accessibilityFocusedWindow()`
- `setAccessibilityFocusedWindow(_:)`
- `accessibilitySharedFocusElements()`
- `setAccessibilitySharedFocusElements(_:)`

### Assigning roles

- `isAccessibilityRequired()`
- `setAccessibilityRequired(_:)`
- `accessibilityRole()`
- `setAccessibilityRole(_:)`
- `accessibilityRoleDescription()`
- `setAccessibilityRoleDescription(_:)`
- `accessibilitySubrole()`
- `setAccessibilitySubrole(_:)`
- `NSAccessibility.Role`
- `NSAccessibility.Subrole`

### Assigning actions

- `accessibilityCustomActions()`
- `setAccessibilityCustomActions(_:)`
- `NSAccessibilityCustomAction`

### Assigning rotors

- `accessibilityCustomRotors()`
- `setAccessibilityCustomRotors(_:)`
- `NSAccessibilityCustomRotor`

### Configuring text elements

- `accessibilityInsertionPointLineNumber()`
- `setAccessibilityInsertionPointLineNumber(_:)`
- `accessibilityNumberOfCharacters()`
- `setAccessibilityNumberOfCharacters(_:)`
- `accessibilityPlaceholderValue()`
- `setAccessibilityPlaceholderValue(_:)`
- `accessibilitySelectedText()`
- `setAccessibilitySelectedText(_:)`
- `accessibilitySelectedTextRange()`
- `setAccessibilitySelectedTextRange(_:)`
- `accessibilitySelectedTextRanges()`
- `setAccessibilitySelectedTextRanges(_:)`
- `accessibilitySharedCharacterRange()`
- `setAccessibilitySharedCharacterRange(_:)`
- `accessibilitySharedTextUIElements()`
- `setAccessibilitySharedTextUIElements(_:)`
- `accessibilityVisibleCharacterRange()`
- `setAccessibilityVisibleCharacterRange(_:)`
- `accessibilityString(for:)`
- `accessibilityAttributedString(for:)`
- `accessibilityRTF(for:)`
- `accessibilityFrame(for:)`
- `accessibilityLine(for:)`
- `accessibilityRange(for:)`
- `accessibilityStyleRange(for:)`
- `accessibilityRange(forLine:)`
- `accessibilityRange(for:)`

### Configuring windows

- `accessibilityActivationPoint()`
- `setAccessibilityActivationPoint(_:)`
- `isAccessibilityAlternateUIVisible()`
- `setAccessibilityAlternateUIVisible(_:)`
- `accessibilityCancelButton()`
- `setAccessibilityCancelButton(_:)`
- `accessibilityCloseButton()`
- `setAccessibilityCloseButton(_:)`
- `accessibilityDefaultButton()`
- `setAccessibilityDefaultButton(_:)`
- `accessibilityFullScreenButton()`
- `setAccessibilityFullScreenButton(_:)`
- `accessibilityGrowArea()`
- `setAccessibilityGrowArea(_:)`
- `isAccessibilityMain()`
- `setAccessibilityMain(_:)`
- `accessibilityMinimizeButton()`
- `setAccessibilityMinimizeButton(_:)`
- `isAccessibilityMinimized()`
- `setAccessibilityMinimized(_:)`
- `isAccessibilityModal()`
- `setAccessibilityModal(_:)`
- `accessibilityProxy()`
- `setAccessibilityProxy(_:)`
- `accessibilityShownMenu()`
- `setAccessibilityShownMenu(_:)`
- `accessibilityToolbarButton()`
- `setAccessibilityToolbarButton(_:)`
- `accessibilityWindow()`
- `setAccessibilityWindow(_:)`
- `accessibilityZoomButton()`
- `setAccessibilityZoomButton(_:)`

### Managing apps

- `accessibilityExtrasMenuBar()`
- `setAccessibilityExtrasMenuBar(_:)`
- `isAccessibilityFrontmost()`
- `setAccessibilityFrontmost(_:)`
- `isAccessibilityHidden()`
- `setAccessibilityHidden(_:)`
- `accessibilityMainWindow()`
- `setAccessibilityMainWindow(_:)`
- `accessibilityMenuBar()`
- `setAccessibilityMenuBar(_:)`
- `accessibilityWindows()`
- `setAccessibilityWindows(_:)`

### Configuring grid views

- `accessibilityColumnCount()`
- `setAccessibilityColumnCount(_:)`
- `isAccessibilityOrderedByRow()`
- `setAccessibilityOrderedByRow(_:)`
- `accessibilityRowCount()`
- `setAccessibilityRowCount(_:)`

### Configuring scroll views

- `accessibilityHorizontalScrollBar()`
- `setAccessibilityHorizontalScrollBar(_:)`
- `accessibilityVerticalScrollBar()`
- `setAccessibilityVerticalScrollBar(_:)`

### Configuring table and outline views

- `accessibilityColumnHeaderUIElements()`
- `setAccessibilityColumnHeaderUIElements(_:)`
- `accessibilityColumns()`
- `setAccessibilityColumns(_:)`
- `accessibilityColumnTitles()`
- `setAccessibilityColumnTitles(_:)`
- `isAccessibilityExpanded()`
- `setAccessibilityExpanded(_:)`
- `accessibilityHeader()`
- `setAccessibilityHeader(_:)`
- `accessibilityIndex()`
- `setAccessibilityIndex(_:)`
- `accessibilityRowHeaderUIElements()`
- `setAccessibilityRowHeaderUIElements(_:)`
- `accessibilityRows()`
- `setAccessibilityRows(_:)`
- `accessibilitySelectedColumns()`
- `setAccessibilitySelectedColumns(_:)`
- `accessibilitySelectedRows()`
- `setAccessibilitySelectedRows(_:)`
- `accessibilitySortDirection()`
- `setAccessibilitySortDirection(_:)`
- `accessibilityVisibleColumns()`
- `setAccessibilityVisibleColumns(_:)`
- `accessibilityVisibleRows()`
- `setAccessibilityVisibleRows(_:)`
- `NSAccessibilitySortDirection`

### Configuring outline rows

- `isAccessibilityDisclosed()`
- `setAccessibilityDisclosed(_:)`
- `accessibilityDisclosedByRow()`
- `setAccessibilityDisclosedByRow(_:)`
- `accessibilityDisclosedRows()`
- `setAccessibilityDisclosedRows(_:)`
- `accessibilityDisclosureLevel()`
- `setAccessibilityDisclosureLevel(_:)`

### Configuring cell-based tables

- `accessibilityColumnIndexRange()`
- `setAccessibilityColumnIndexRange(_:)`
- `accessibilityRowIndexRange()`
- `setAccessibilityRowIndexRange(_:)`
- `accessibilitySelectedCells()`
- `setAccessibilitySelectedCells(_:)`
- `accessibilityVisibleCells()`
- `setAccessibilityVisibleCells(_:)`
- `accessibilityCell(forColumn:row:)`

### Configuring layout

- `accessibilityHandles()`
- `setAccessibilityHandles(_:)`
- `accessibilityHorizontalUnits()`
- `setAccessibilityHorizontalUnits(_:)`
- `accessibilityHorizontalUnitDescription()`
- `setAccessibilityHorizontalUnitDescription(_:)`
- `accessibilityVerticalUnits()`
- `setAccessibilityVerticalUnits(_:)`
- `accessibilityVerticalUnitDescription()`
- `setAccessibilityVerticalUnitDescription(_:)`
- `accessibilityLayoutPoint(forScreenPoint:)`
- `accessibilityLayoutSize(forScreenSize:)`
- `accessibilityScreenPoint(forLayoutPoint:)`
- `accessibilityScreenSize(forLayoutSize:)`

### Configuring sliders

- `accessibilityAllowedValues()`
- `setAccessibilityAllowedValues(_:)`
- `accessibilityLabelUIElements()`
- `setAccessibilityLabelUIElements(_:)`
- `accessibilityLabelValue()`
- `setAccessibilityLabelValue(_:)`

### Configuring split views

- `accessibilityNextContents()`
- `setAccessibilityNextContents(_:)`
- `accessibilityPreviousContents()`
- `setAccessibilityPreviousContents(_:)`
- `accessibilitySplitters()`
- `setAccessibilitySplitters(_:)`

### Configuring tabs and toolbars

- `accessibilityOverflowButton()`
- `setAccessibilityOverflowButton(_:)`
- `accessibilityTabs()`
- `setAccessibilityTabs(_:)`

### Configuring ruler views

- `accessibilityMarkerGroupUIElement()`
- `setAccessibilityMarkerGroupUIElement(_:)`
- `accessibilityMarkerTypeDescription()`
- `setAccessibilityMarkerTypeDescription(_:)`
- `accessibilityMarkerUIElements()`
- `setAccessibilityMarkerUIElements(_:)`
- `accessibilityMarkerValues()`
- `setAccessibilityMarkerValues(_:)`
- `accessibilityRulerMarkerType()`
- `setAccessibilityRulerMarkerType(_:)`
- `accessibilityUnits()`
- `setAccessibilityUnits(_:)`
- `accessibilityUnitDescription()`
- `setAccessibilityUnitDescription(_:)`
- `NSAccessibilityRulerMarkerType`
- `NSAccessibilityUnits`

### Managing documents and editing

- `accessibilityDocument()`
- `setAccessibilityDocument(_:)`
- `isAccessibilityEdited()`
- `setAccessibilityEdited(_:)`
- `accessibilityFilename()`
- `setAccessibilityFilename(_:)`

### Configuring linkage elements

- `accessibilityLinkedUIElements()`
- `setAccessibilityLinkedUIElements(_:)`
- `accessibilityServesAsTitleForUIElements()`
- `setAccessibilityServesAsTitleForUIElements(_:)`
- `accessibilityTitleUIElement()`
- `setAccessibilityTitleUIElement(_:)`

### Configuring search fields

- `accessibilityClearButton()`
- `setAccessibilityClearButton(_:)`
- `accessibilitySearchButton()`
- `setAccessibilitySearchButton(_:)`
- `accessibilitySearchMenu()`
- `setAccessibilitySearchMenu(_:)`

### Confirming and canceling operations

- `accessibilityPerformCancel()`
- `accessibilityPerformConfirm()`

### Selecting elements

- `accessibilityPerformPick()`
- `accessibilityPerformPress()`

### Searching elements

- `NSAccessibilitySearchCurrentElementKey`
- `NSAccessibilitySearchCurrentRangeKey`
- `NSAccessibilitySearchDirectionKey`
- `NSAccessibilitySearchDirectionNext`
- `NSAccessibilitySearchDirectionPrevious`
- `NSAccessibilitySearchKey`

### Showing user interface elements

- `accessibilityPerformShowAlternateUI()`
- `accessibilityPerformShowDefaultUI()`
- `accessibilityPerformShowMenu()`
- `accessibilityPerformRaise()`

### Incrementing, decrementing, and deleting values

- `accessibilityIncrementButton()`
- `setAccessibilityIncrementButton(_:)`
- `accessibilityDecrementButton()`
- `setAccessibilityDecrementButton(_:)`
- `accessibilityPerformIncrement()`
- `accessibilityPerformDecrement()`
- `accessibilityPerformDelete()`

### Managing notifications

- `post(element:notification:)`
- `post(element:notification:userInfo:)`
- `NSAccessibility.Notification`
- `NSAccessibility.NotificationUserInfoKey`

### Handling errors

- `ErrorCodeExceptionInfo`

### Supporting types

- `NSAccessibility`

### Instance methods

- `accessibilityAttributedUserInputLabels()`
- `accessibilityUserInputLabels()`
- `setAccessibilityAttributedUserInputLabels(_:)`
- `setAccessibilityUserInputLabels(_:)`

## See Also

- `NSAccessibility`
