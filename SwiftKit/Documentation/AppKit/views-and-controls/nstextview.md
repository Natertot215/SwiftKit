---
url: https://developer.apple.com/documentation/appkit/nstextview
framework: AppKit
category: Views and controls
title: NSTextView
kind: class
captured: 2026-05-02
---

# NSTextView

A view that draws text and handles user interactions with that text.

## Declaration

```swift
class NSTextView
```

### Overview

The `NSTextView` class is the front-end class to the AppKit text system. The class draws the text managed by the back-end components and handles user events to select and modify its text, in addition to supporting rich text, attachments, input management, and key binding, and marked text attributes.

> **NOTE:**  If you need only to implement a simple editable text field, see `NSTextField`.

`NSTextView` is the principal means to obtain a text object that caters to almost all needs for displaying and managing text at the user interface level. While `NSTextView` is a subclass of the `NSText` class — which declares the most general Cocoa interface to the text system — `NSTextView` adds major features beyond the capabilities of `NSText`. You can also do more powerful and more creative text manipulation (such as displaying text in a circle) using `NSTextStorage`, `NSTextLayoutManager`, `NSTextContainer`, and related classes.

You’re more likely to use the `NSTextView` class than `NSText`. It’s also important to remember that `NSTextView` conforms to a large number of protocols, the methods of which are available to instances of the `NSTextView` class.

`NSTextView` communicates with its delegate through methods declared both by the `NSTextViewDelegate` and by its superclass’s protocol, `NSTextDelegate`. All delegation messages come from the first text view.

In macOS 12 and later, if you explicitly call the `layoutManager` property on a text view or text container, the framework reverts to a compatibility mode that uses `NSLayoutManager`. The text view also switches to this compatibility mode when it encounters text content that’s not yet supported, such as `NSTextTable`.

#### About Delegate Methods

The `NSTextView` class communicates with its delegate through methods declared both by the `NSTextViewDelegate` and by its superclass’s protocol, `NSTextDelegate`. All delegation messages come from the first text view.

#### Becoming the first responder

When the system invokes `NSResponder/becomeFirstResponder()` on a text view, if the previous first responder was not a text view on the same layout manager as the receiving text view, the receiving text view draws the selection and updates the insertion point if necessary.

To make a text view the first responder, call the containing window’s `NSWindow/makeFirstResponder(_:)` method. Never invoke a text view’s `NSResponder/becomeFirstResponder()` method directly.

#### Resigning as first responder

When the system invokes `NSResponder/resignFirstResponder()` on a text view, if the object that will become the new first responder is a text view attached to the same layout manager as the receiver, the receiving text view returns `true` with no further action. Otherwise, it sends a `NSTextDelegate/textShouldEndEditing(_:)` message to its delegate (if any). If the delegate returns `false`, the text view returns `false`. If the delegate returns `true`, the text view hides the selection highlighting and posts an `NSText/didEndEditingNotification` to the default notification center and then returns `true`.





## Relationships

**Inherits From**: `NSText`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityNavigableStaticText`, `NSAccessibilityProtocol`, `NSAccessibilityStaticText`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCandidateListTouchBarItemDelegate`, `NSChangeSpelling`, `NSCoding`, `NSColorChanging`, `NSDraggingDestination`, `NSDraggingSource`, `NSIgnoreMisspelledWords`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTextContent`, `NSTextInput`, `NSTextInputClient`, `NSTextLayoutOrientationProvider`, `NSTouchBarDelegate`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating a text view

- `init(frame:textContainer:)`
- `init(frame:)`
- `init(usingTextLayoutManager:)`
- `init(coder:)`

### Managing the text view’s content

- `delegate`
- `NSTextViewDelegate`

### Registering services information

- `registerForServices()`

### Accessing text system objects

- `stronglyReferencesTextStorage`
- `fieldEditor()`
- `textContainer`
- `replaceTextContainer(_:)`
- `textContainerInset`
- `textContainerOrigin`
- `invalidateTextContainerOrigin()`
- `textLayoutManager`
- `layoutManager`
- `textContentStorage`
- `textStorage`

### Setting graphics attributes

- `backgroundColor`
- `drawsBackground`
- `allowsDocumentBackgroundColorChange`
- `changeDocumentBackgroundColor(_:)`

### Controlling text display

- `setNeedsDisplay(_:avoidAdditionalLayout:)`
- `shouldDrawInsertionPoint`
- `drawInsertionPoint(in:color:turnedOn:)`
- `drawBackground(in:)`
- `setConstrainedFrameSize(_:)`
- `cleanUpAfterDragOperation()`
- `showFindIndicator(for:)`
- `scrollableDocumentContentTextView()`
- `scrollablePlainDocumentContentTextView()`
- `scrollableTextView()`

### Inserting text

- `allowedInputSourceLocales`
- `insertText(_:)`

### Setting behavioral attributes

- `allowsUndo`
- `isEditable`
- `isSelectable`
- `isFieldEditor`
- `isRichText`
- `importsGraphics`
- `setBaseWritingDirection(_:range:)`
- `defaultParagraphStyle`
- `outline(_:)`
- `allowsImageEditing`
- `isAutomaticQuoteSubstitutionEnabled`
- `toggleAutomaticQuoteSubstitution(_:)`
- `isAutomaticLinkDetectionEnabled`
- `toggleAutomaticLinkDetection(_:)`
- `displaysLinkToolTips`
- `isAutomaticTextCompletionEnabled`
- `toggleAutomaticTextCompletion(_:)`
- `usesAdaptiveColorMappingForDarkAppearance`
- `usesRolloverButtonForSelection`

### Using text formatting controls

- `usesRuler`
- `isRulerVisible`
- `usesInspectorBar`

### Managing the selection

- `selectedRanges`
- `setSelectedRange(_:)`
- `setSelectedRange(_:affinity:stillSelecting:)`
- `setSelectedRanges(_:affinity:stillSelecting:)`
- `selectionAffinity`
- `selectionGranularity`
- `insertionPointColor`
- `updateInsertionPointStateAndRestartTimer(_:)`
- `selectedTextAttributes`
- `markedTextAttributes`
- `linkTextAttributes`
- `characterIndexForInsertion(at:)`
- `updateCandidates()`

### Managing the pasteboard

- `preferredPasteboardType(from:restrictedToTypesFrom:)`
- `readSelection(from:)`
- `readSelection(from:type:)`
- `readablePasteboardTypes`
- `writablePasteboardTypes`
- `writeSelection(to:type:)`
- `writeSelection(to:types:)`
- `validRequestor(forSendType:returnType:)`

### Setting text attributes

- `alignJustified(_:)`
- `changeAttributes(_:)`
- `changeColor(_:)`
- `setAlignment(_:range:)`
- `typingAttributes`
- `useStandardKerning(_:)`
- `lowerBaseline(_:)`
- `raiseBaseline(_:)`
- `turnOffKerning(_:)`
- `loosenKerning(_:)`
- `tightenKerning(_:)`
- `useStandardLigatures(_:)`
- `turnOffLigatures(_:)`
- `useAllLigatures(_:)`
- `toggleTraditionalCharacterShape(_:)`

### Clicking and pasting

- `clicked(onLink:at:)`
- `pasteAsPlainText(_:)`
- `pasteAsRichText(_:)`

### Supporting undo

- `breakUndoCoalescing()`
- `isCoalescingUndo`

### Customizing subclass behaviors

- `updateFontPanel()`
- `updateRuler()`
- `acceptableDragTypes`
- `updateDragTypeRegistration()`
- `selectionRange(forProposedRange:granularity:)`
- `rangeForUserCharacterAttributeChange`
- `rangesForUserCharacterAttributeChange`
- `rangeForUserParagraphAttributeChange`
- `rangesForUserParagraphAttributeChange`
- `rangeForUserTextChange`
- `rangesForUserTextChange`
- `shouldChangeText(in:replacementString:)`
- `shouldChangeText(inRanges:replacementStrings:)`
- `didChangeText()`
- `smartInsertDeleteEnabled`
- `smartDeleteRange(forProposedRange:)`
- `smartInsert(afterStringFor:replacing:)`
- `smartInsert(beforeStringFor:replacing:)`
- `smartInsert(for:replacing:before:after:)`
- `toggleSmartInsertDelete(_:)`

### Working with the spelling checker

- `isContinuousSpellCheckingEnabled`
- `spellCheckerDocumentTag`
- `toggleContinuousSpellChecking(_:)`
- `isGrammarCheckingEnabled`
- `toggleGrammarChecking(_:)`
- `setSpellingState(_:range:)`

### Working with the sharing service picker

- `orderFrontSharingServicePicker(_:)`

### Supporting the ruler view

- `rulerView(_:didMove:)`
- `rulerView(_:willMove:toLocation:)`
- `rulerView(_:shouldMove:)`
- `rulerView(_:didRemove:)`
- `rulerView(_:shouldRemove:)`
- `rulerView(_:didAdd:)`
- `rulerView(_:shouldAdd:)`
- `rulerView(_:willAdd:atLocation:)`
- `rulerView(_:handleMouseDownWith:)`

### Dragging

- `dragImageForSelection(with:origin:)`
- `dragOperation(for:type:)`
- `dragSelection(with:offset:slideBack:)`
- `acceptsGlyphInfo`

### Speaking text

- `startSpeaking(_:)`
- `stopSpeaking(_:)`

### Working with panels

- `usesFontPanel`
- `usesFindPanel`
- `performFindPanelAction(_:)`
- `orderFrontLinkPanel(_:)`
- `orderFrontListPanel(_:)`
- `orderFrontSpacingPanel(_:)`
- `orderFrontTablePanel(_:)`
- `orderFrontSubstitutionsPanel(_:)`

### Performing text completion

- `complete(_:)`
- `completions(forPartialWordRange:indexOfSelectedItem:)`
- `insertCompletion(_:forPartialWordRange:movement:isFinal:)`
- `rangeForUserCompletion`

### Checking and substituting text

- `checkTextInDocument(_:)`
- `checkTextInSelection(_:)`
- `checkText(in:types:options:)`
- `handleTextCheckingResults(_:forRange:types:options:orthography:wordCount:)`
- `enabledTextCheckingTypes`
- `isAutomaticDashSubstitutionEnabled`
- `toggleAutomaticDashSubstitution(_:)`
- `isAutomaticDataDetectionEnabled`
- `toggleAutomaticDataDetection(_:)`
- `isAutomaticSpellingCorrectionEnabled`
- `toggleAutomaticSpellingCorrection(_:)`
- `isAutomaticTextReplacementEnabled`
- `toggleAutomaticTextReplacement(_:)`
- `performValidatedReplacement(in:with:)`

### Getting the writing tools status

- `isWritingToolsActive`

### Supporting QuickLook

- `updateQuickLookPreviewPanel()`
- `toggleQuickLookPreviewPanel(_:)`
- `quickLookPreviewableItems(inRanges:)`

### Changing layout orientation

- `changeLayoutOrientation(_:)`
- `setLayoutOrientation(_:)`

### Using the Find Bar

- `usesFindBar`
- `isIncrementalSearchingEnabled`

### Constants

- `NSSelectionGranularity`
- `NSSelectionAffinity`
- `NSFindPanelAction`
- `Input Sources Locale Identifiers`
- `Find Panel Search Metadata`
- `NSFindPanelSubstringMatchType`

### Notifications

- `didChangeSelectionNotification`
- `willChangeNotifyingTextViewNotification`
- `didChangeTypingAttributesNotification`
- `didSwitchToNSLayoutManagerNotification`
- `willSwitchToNSLayoutManagerNotification`

### Interacting with the Touch Bar

- `allowsCharacterPickerTouchBarItem`
- `candidateListTouchBarItem`
- `updateTextTouchBarItems()`
- `updateTouchBarItemIdentifiers()`

### Instance Properties

- `allowedWritingToolsResultOptions`
- `inlinePredictionType`
- `mathExpressionCompletionType`
- `textHighlightAttributes`
- `writingToolsBehavior`

### Instance Methods

- `drawTextHighlightBackground(for:origin:)`
- `highlight(_:)`

## See Also

- `NSTextField`
- `NSTextFieldDelegate`
- `NSTextViewDelegate`
- `NSTextDelegate`
- `NSText`
