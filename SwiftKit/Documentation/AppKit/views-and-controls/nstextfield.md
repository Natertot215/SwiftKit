---
url: https://developer.apple.com/documentation/appkit/nstextfield
framework: AppKit
category: Views and controls
title: NSTextField
kind: class
captured: 2026-05-02
---

# NSTextField

Text the user can select or edit to send an action message to a target when the user presses the Return key.

## Declaration

```swift
class NSTextField
```

### Overview

The `NSTextField` class uses the `NSTextFieldCell` class to implement its user interface. Text fields display text either as a static label or as an editable input field. The content of a text field is either plain text or a rich-text attributed string. Text fields also support line wrapping to display multiline text, and a variety of truncation styles if the content doesn’t fit the available space.

The parent class, `NSControl`, provides the methods for setting the values of the text field, such as `NSControl/stringValue` and `NSControl/doubleValue`. There are corresponding methods to retrieve values.

In macOS 12 and later, if you explicitly call the `layoutManager` property on your text field, the framework will revert to a compatibility mode that uses `NSLayoutManager`. The text view also switches to this compatibility mode when it encounters text content that’s not yet supported.





## Relationships

**Inherits From**: `NSControl`

**Inherited By**: `NSComboBox`, `NSSearchField`, `NSSecureTextField`, `NSTokenField`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityNavigableStaticText`, `NSAccessibilityProtocol`, `NSAccessibilityStaticText`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTextContent`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating Text Fields

- `init(labelWithAttributedString:)`
- `init(labelWithString:)`
- `init(string:)`
- `init(wrappingLabelWithString:)`

### Controlling Selection and Editing

- `isSelectable`
- `isEditable`

### Controlling Rich Text Behavior

- `allowsEditingTextAttributes`
- `importsGraphics`

### Setting Placeholder Text

- `placeholderString`
- `placeholderAttributedString`

### Configuring Line Wrapping

- `lineBreakStrategy`
- `allowsDefaultTighteningForTruncation`
- `maximumNumberOfLines`

### Sizing with Auto Layout

- `preferredMaxLayoutWidth`

### Setting the Text Color

- `textColor`

### Controlling the Background

- `backgroundColor`
- `drawsBackground`
- `isBezeled`
- `bezelStyle`
- `NSTextField.BezelStyle`

### Setting a Border

- `isBordered`

### Selecting the Text

- `selectText(_:)`

### Working with the Responder Chain

- `acceptsFirstResponder`

### Using Keyboard Interface Control

- `allowsCharacterPickerTouchBarItem`

### Supporting Text Completion and Suggestions

- `isAutomaticTextCompletionEnabled`
- `NSTextSuggestionsDelegate`
- `NSSuggestionItem`
- `NSSuggestionItemResponse`
- `NSSuggestionItemSection`

### Setting the Delegate

- `delegate`

### Implementing Delegate Methods

- `textShouldBeginEditing(_:)`
- `textDidBeginEditing(_:)`
- `textDidChange(_:)`
- `textShouldEndEditing(_:)`
- `textDidEndEditing(_:)`

### Instance Properties

- `allowsCharacterPickerTouchBarItem`
- `allowsWritingTools`
- `allowsWritingToolsAffordance`
- `placeholderAttributedStrings`
- `placeholderStrings`
- `resolvesNaturalAlignmentWithBaseWritingDirection`
- `suggestionsDelegate`

## See Also

- `NSTextFieldDelegate`
- `NSTextView`
- `NSTextViewDelegate`
- `NSTextDelegate`
- `NSText`
