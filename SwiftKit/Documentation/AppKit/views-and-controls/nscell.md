---
url: https://developer.apple.com/documentation/appkit/nscell
framework: AppKit
category: Views and controls
title: NSCell
kind: class
captured: 2026-05-02
---

# NSCell

A mechanism for displaying text or images in a view object without the overhead of a full `NSView` subclass.

## Declaration

```swift
@MainActor class NSCell
```

### Overview

Cells are used by most of the `NSControl` classes to implement their internal workings.

#### Designated Initializers

When subclassing `NSCell` you must implement all of the designated initializers. Those methods include `NSCell/init()`, `NSCell/init(coder:)`, `NSCell/init(textCell:)`, and `NSCell/init(imageCell:)`.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSActionCell`, `NSBrowserCell`, `NSImageCell`, `NSTextAttachmentCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`

## Availability

- macOS ?

## Topics

### Initializing a Cell

- `init(imageCell:)`
- `init(textCell:)`

### Managing Cell Values

- `objectValue`
- `hasValidObjectValue`
- `intValue`
- `integerValue`
- `stringValue`
- `doubleValue`
- `floatValue`

### Managing Cell Attributes

- `setCellAttribute(_:to:)`
- `cellAttribute(_:)`
- `type`
- `isEnabled`
- `allowsUndo`

### Managing Display Attributes

- `isBezeled`
- `isBordered`
- `isOpaque`
- `controlTint`
- `backgroundStyle`
- `interiorBackgroundStyle`
- `NSView.BackgroundStyle`

### Managing Cell State

- `allowsMixedState`
- `nextState`
- `setNextState()`
- `state`
- `NSControl.StateValue`

### Modifying Textual Attributes

- `isEditable`
- `isSelectable`
- `isScrollable`
- `alignment`
- `font`
- `lineBreakMode`
- `truncatesLastVisibleLine`
- `wraps`
- `baseWritingDirection`
- `attributedStringValue`
- `allowsEditingTextAttributes`
- `importsGraphics`
- `setUpFieldEditorAttributes(_:)`
- `title`

### Managing the Target and Action

- `action`
- `target`
- `isContinuous`
- `sendAction(on:)`

### Managing the Image

- `image`

### Managing the Tag

- `tag`

### Formatting and Validating Data

- `formatter`

### Managing Menus

- `defaultMenu`
- `menu`
- `menu(for:in:of:)`

### Comparing Cells

- `compare(_:)`

### Respond to Keyboard Events

- `acceptsFirstResponder`
- `showsFirstResponder`
- `refusesFirstResponder`
- `performClick(_:)`

### Deriving Values

- `takeObjectValueFrom(_:)`
- `takeIntegerValueFrom(_:)`
- `takeIntValueFrom(_:)`
- `takeStringValueFrom(_:)`
- `takeDoubleValueFrom(_:)`
- `takeFloatValueFrom(_:)`

### Representing an Object

- `representedObject`

### Tracking the Mouse

- `trackMouse(with:in:of:untilMouseUp:)`
- `startTracking(at:in:)`
- `continueTracking(last:current:in:)`
- `stopTracking(last:current:in:mouseIsUp:)`
- `mouseDownFlags`
- `prefersTrackingUntilMouseUp`
- `getPeriodicDelay(_:interval:)`

### Hit Testing

- `hitTest(for:in:of:)`

### Managing the Cursor

- `resetCursorRect(_:in:)`

### Handling Keyboard Alternatives

- `keyEquivalent`

### Dragging Cells

- `draggingImageComponents(withFrame:in:)`

### Managing Focus Rings

- `drawFocusRingMask(withFrame:in:)`
- `focusRingMaskBounds(forFrame:in:)`
- `defaultFocusRingType`
- `focusRingType`

### Determining Cell Size

- `calcDrawInfo(_:)`
- `cellSize`
- `cellSize(forBounds:)`
- `drawingRect(forBounds:)`
- `imageRect(forBounds:)`
- `titleRect(forBounds:)`
- `controlSize`

### Drawing and Highlighting

- `draw(withFrame:in:)`
- `highlightColor(withFrame:in:)`
- `drawInterior(withFrame:in:)`
- `controlView`
- `highlight(_:withFrame:in:)`
- `isHighlighted`

### Editing and Selecting Text

- `edit(withFrame:in:editor:delegate:event:)`
- `select(withFrame:in:editor:delegate:start:length:)`
- `sendsActionOnEndEditing`
- `endEditing(_:)`
- `wantsNotificationForMarkedText`
- `fieldEditor(for:)`
- `usesSingleLineMode`

### Managing Expansion Frames

- `expansionFrame(withFrame:in:)`
- `draw(withExpansionFrame:in:)`

### User Interface Layout Direction

- `userInterfaceLayoutDirection`

### Constants

- `NSCell.CellType`
- `NSCell.Attribute`
- `NSControl.ImagePosition`
- `NSImageScaling`
- `NSCell.StateValue`
- `NSCell.StyleMask`
- `NSControlTint`
- `NSControl.ControlSize`
- `NSCell.HitResult`
- `NSView.BackgroundStyle`
- `Deprecated Scaling Constants`
- `Data Entry Types`

### Notifications

- `currentControlTintDidChangeNotification`

### Initializers

- `init()`
- `init(coder:)`

## See Also

- `NSView`
- `NSControl`
- `NSActionCell`
