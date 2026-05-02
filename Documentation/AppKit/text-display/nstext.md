---
url: https://developer.apple.com/documentation/appkit/nstext
framework: AppKit
category: Text display
title: NSText
kind: class
captured: 2026-05-02
---

# NSText

The most general programmatic interface for objects that manage text.

## Declaration

```swift
class NSText
```

### Overview

`NSText` draws text for user interface objects, provides text editing capabilities, and controls text attributes such as type size, font, and color.

`NSText` initialization creates an instance of a concrete subclass, such as `NSTextView` (generically called a text object). In general, you’re more likely to use the `NSTextView` subclass, because it extends the interface declared by `NSText` and provides much more sophisticated functionality than that declared in `NSText`.

AppKit uses text objects wherever text appears in interface objects. For example, a text object draws the title of a window, the commands in a menu, the title of a button, and the items in a browser. Your app can also create text objects for its own purposes.





## Relationships

**Inherits From**: `NSView`

**Inherited By**: `NSTextView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSChangeSpelling`, `NSCoding`, `NSDraggingDestination`, `NSIgnoreMisspelledWords`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating a Text Object

- `init(coder:)`
- `init(frame:)`

### Getting the characters

- `string`

### Setting graphics attributes

- `backgroundColor`
- `drawsBackground`

### Setting behavioral attributes

- `isEditable`
- `isSelectable`
- `isFieldEditor`
- `isRichText`
- `importsGraphics`

### Using the Font panel and menu

- `usesFontPanel`

### Using the ruler

- `toggleRuler(_:)`
- `isRulerVisible`

### Changing the selection

- `selectedRange`

### Replacing text

- `replaceCharacters(in:withRTF:)`
- `replaceCharacters(in:withRTFD:)`
- `replaceCharacters(in:with:)`

### Action methods for editing

- `selectAll(_:)`
- `copy(_:)`
- `cut(_:)`
- `paste(_:)`
- `copyFont(_:)`
- `pasteFont(_:)`
- `copyRuler(_:)`
- `pasteRuler(_:)`
- `delete(_:)`

### Changing the font

- `changeFont(_:)`
- `font`
- `setFont(_:range:)`

### Setting text alignment

- `alignment`
- `alignCenter(_:)`
- `alignLeft(_:)`
- `alignRight(_:)`

### Setting text color

- `textColor`
- `setTextColor(_:range:)`

### Writing direction

- `baseWritingDirection`

### Setting superscripting and subscripting

- `superscript(_:)`
- `subscript(_:)`
- `unscript(_:)`

### Underlining text

- `underline(_:)`

### Reading and writing RTF files

- `readRTFD(fromFile:)`
- `writeRTFD(toFile:atomically:)`
- `rtfd(from:)`
- `rtf(from:)`

### Checking spelling

- `checkSpelling(_:)`
- `showGuessPanel(_:)`

### Constraining size

- `maxSize`
- `minSize`
- `isVerticallyResizable`
- `isHorizontallyResizable`
- `sizeToFit()`

### Scrolling

- `scrollRangeToVisible(_:)`

### Setting the delegate

- `delegate`

### Constants

- `NSTextAlignment`
- `NSWritingDirection`
- `Movement Codes`
- `Common Unicode Characters`

### Notifications

- `didBeginEditingNotification`
- `didChangeNotification`
- `didEndEditingNotification`
- `movementUserInfoKey`
- `NSTextMovement`

## See Also

- `NSTextField`
- `NSTextFieldDelegate`
- `NSTextView`
- `NSTextViewDelegate`
- `NSTextDelegate`
