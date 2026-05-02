---
url: https://developer.apple.com/documentation/appkit/nslayoutmanager
framework: AppKit
category: TextKit
title: NSLayoutManager
kind: class
captured: 2026-05-02
---

# NSLayoutManager

An object that coordinates the layout and display of text characters.

## Declaration

```swift
class NSLayoutManager
```

### Overview

`NSLayoutManager` maps Unicode character codes to glyphs, sets the glyphs in a series of `NSTextContainer` objects, and displays them in a series of `NSTextView` objects. In addition to its core function of laying out text, a layout manager object coordinates its text view objects, provides services to those text views to support `NSRulerView` instances for editing paragraph styles, and handles the layout and display of text attributes not inherent in glyphs (such as underline or strikethrough). You can create a subclass of `NSLayoutManager` to handle additional text attributes, whether inherent or not.

#### Text Antialiasing

`NSLayoutManager` provides the threshold for text antialiasing. It looks at the `AppleAntiAliasingThreshold` default value. If the font size is smaller than or equal to this threshold size, the text is rendered aliased by `NSLayoutManager`. In macOS, you can change the threshold value from the Appearance pane of System Preferences.

#### Thread Safety of NSLayoutManager

Generally speaking, a specific layout manager (and associated objects) should not be used in more than one block, operation, or thread at a time. Most layout managers are used on the main thread, since it is the main thread on which their text views are displayed, and since background layout occurs on the main thread.

If you want to use a layout manager on a background thread, first make sure that text views associated with that layout manager (if any) are not displayed while the layout manager is being used on the background thread, and, second, turn off background layout for that layout manager while it is being used on the background thread. The most effective way to ensure that no text view is displayed, without knowing deep implementation, is just not to connect a text view to the layout manager.

#### Noncontiguous Layout

Noncontiguous layout is an optional layout manager behavior. Previously, both glyph generation and layout were always performed, in order, from the beginning to the end of the document. When noncontiguous layout is turned on, however, the layout manager gains the option of performing glyph generation or layout for one portion of the document without having done so for previous sections. This can provide significant performance improvements for large documents.

Noncontiguous layout is not turned on automatically because direct clients of `NSLayoutManager` typically have relied on the previous behavior—for example, by forcing layout for a specific glyph range, and then assuming that previous glyphs would therefore be laid out. Clients who use `NSLayoutManager` only indirectly—for example, those who use `NSTextView` without directly calling the underlying layout manager—can usually turn on noncontiguous layout without difficulty. Clients using `NSLayoutManager` directly need to examine their usage before turning on noncontiguous layout.

Enable noncontiguous layout using the `NSLayoutManager/allowsNonContiguousLayout` property. In addition, see the other methods in `NSLayoutManager#Causing-glyph-generation-and-layout`, many of which enable you to ensure that glyph generation and layout are performed for specified portions of the text. The behavior of a number of other layout manager methods is affected by the state of noncontiguous layout, as noted in the discussion sections of those method descriptions.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSGlyphStorage`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 10.7

## Topics

### Creating a layout manager

- `init()`
- `init(coder:)`

### Managing the layout process

- `delegate`
- `NSLayoutManagerDelegate`

### Accessing the text storage

- `textStorage`
- `replaceTextStorage(_:)`

### Configuring the global layout manager options

- `allowsNonContiguousLayout`
- `hasNonContiguousLayout`
- `showsInvisibleCharacters`
- `showsControlCharacters`
- `usesFontLeading`
- `backgroundLayoutEnabled`
- `limitsLayoutForSuspiciousContents`
- `usesDefaultHyphenation`

### Managing the text containers

- `textContainers`
- `addTextContainer(_:)`
- `insertTextContainer(_:at:)`
- `removeTextContainer(at:)`
- `setTextContainer(_:forGlyphRange:)`
- `textContainerChangedGeometry(_:)`
- `textContainerChangedTextView(_:)`
- `textContainer(forGlyphAt:effectiveRange:)`
- `textContainer(forGlyphAt:effectiveRange:withoutAdditionalLayout:)`
- `usedRect(for:)`

### Invalidating glyphs and layout

- `invalidateDisplay(forCharacterRange:)`
- `invalidateDisplay(forGlyphRange:)`
- `invalidateGlyphs(forCharacterRange:changeInLength:actualCharacterRange:)`
- `invalidateLayout(forCharacterRange:actualCharacterRange:)`
- `processEditing(for:edited:range:changeInLength:invalidatedRange:)`

### Causing glyph generation and layout

- `ensureGlyphs(forCharacterRange:)`
- `ensureGlyphs(forGlyphRange:)`
- `ensureLayout(forBoundingRect:in:)`
- `ensureLayout(forCharacterRange:)`
- `ensureLayout(forGlyphRange:)`
- `ensureLayout(for:)`
- `glyphGenerator`

### Accessing glyphs

- `getGlyphs(in:glyphs:properties:characterIndexes:bidiLevels:)`
- `cgGlyph(at:)`
- `cgGlyph(at:isValidIndex:)`
- `setGlyphs(_:properties:characterIndexes:font:forGlyphRange:)`
- `characterIndexForGlyph(at:)`
- `glyphIndexForCharacter(at:)`
- `isValidGlyphIndex(_:)`
- `numberOfGlyphs`
- `propertyForGlyph(at:)`
- `NSLayoutManager.GlyphProperty`

### Setting layout information

- `setAttachmentSize(_:forGlyphRange:)`
- `setDrawsOutsideLineFragment(_:forGlyphAt:)`
- `setExtraLineFragmentRect(_:usedRect:textContainer:)`
- `setLineFragmentRect(_:forGlyphRange:usedRect:)`
- `setLocation(_:forStartOfGlyphRange:)`
- `setNotShownAttribute(_:forGlyphAt:)`

### Getting layout information

- `attachmentSize(forGlyphAt:)`
- `drawsOutsideLineFragment(forGlyphAt:)`
- `extraLineFragmentRect`
- `extraLineFragmentTextContainer`
- `extraLineFragmentUsedRect`
- `firstUnlaidCharacterIndex()`
- `firstUnlaidGlyphIndex()`
- `getFirstUnlaidCharacterIndex(_:glyphIndex:)`
- `lineFragmentRect(forGlyphAt:effectiveRange:)`
- `lineFragmentRect(forGlyphAt:effectiveRange:withoutAdditionalLayout:)`
- `lineFragmentUsedRect(forGlyphAt:effectiveRange:)`
- `lineFragmentUsedRect(forGlyphAt:effectiveRange:withoutAdditionalLayout:)`
- `location(forGlyphAt:)`
- `notShownAttribute(forGlyphAt:)`
- `truncatedGlyphRange(inLineFragmentForGlyphAt:)`

### Performing advanced layout queries

- `boundingRect(forGlyphRange:in:)`
- `characterIndex(for:in:fractionOfDistanceBetweenInsertionPoints:)`
- `characterRange(forGlyphRange:actualGlyphRange:)`
- `enumerateEnclosingRects(forGlyphRange:withinSelectedGlyphRange:in:using:)`
- `enumerateLineFragments(forGlyphRange:using:)`
- `fractionOfDistanceThroughGlyph(for:in:)`
- `getLineFragmentInsertionPoints(forCharacterAt:alternatePositions:inDisplayOrder:positions:characterIndexes:)`
- `glyphIndex(for:in:)`
- `glyphIndex(for:in:fractionOfDistanceThroughGlyph:)`
- `glyphRange(forBoundingRect:in:)`
- `glyphRange(forBoundingRectWithoutAdditionalLayout:in:)`
- `glyphRange(for:)`
- `glyphRange(forCharacterRange:actualCharacterRange:)`
- `range(ofNominallySpacedGlyphsContaining:)`

### Drawing

- `drawBackground(forGlyphRange:at:)`
- `drawGlyphs(forGlyphRange:at:)`
- `drawStrikethrough(forGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:)`
- `drawUnderline(forGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:)`
- `fillBackgroundRectArray(_:count:forCharacterRange:color:)`
- `showCGGlyphs(_:positions:count:font:textMatrix:attributes:in:)`
- `strikethroughGlyphRange(_:strikethroughType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:)`
- `underlineGlyphRange(_:underlineType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:)`

### Handling layout for text blocks

- `setLayoutRect(_:for:glyphRange:)`
- `layoutRect(for:glyphRange:)`
- `setBoundsRect(_:for:glyphRange:)`
- `boundsRect(for:glyphRange:)`
- `layoutRect(for:at:effectiveRange:)`
- `boundsRect(for:at:effectiveRange:)`

### Managing attachments

- `defaultAttachmentScaling`
- `showAttachmentCell(_:in:characterIndex:)`

### Handling Rulers

- `rulerAccessoryView(for:paragraphStyle:ruler:enabled:)`
- `rulerMarkers(for:paragraphStyle:ruler:)`

### Managing the responder chain

- `layoutManagerOwnsFirstResponder(in:)`
- `firstTextView`
- `textViewForBeginningOfSelection`

### Managing the typesetter

- `typesetter`
- `typesetterBehavior`
- `NSLayoutManager.TypesetterBehavior`
- `defaultLineHeight(for:)`
- `defaultBaselineOffset(for:)`

### Managing temporary attribute support

- `addTemporaryAttributes(_:forCharacterRange:)`
- `addTemporaryAttribute(_:value:forCharacterRange:)`
- `setTemporaryAttributes(_:forCharacterRange:)`
- `removeTemporaryAttribute(_:forCharacterRange:)`
- `temporaryAttribute(_:atCharacterIndex:effectiveRange:)`
- `temporaryAttribute(_:atCharacterIndex:longestEffectiveRange:in:)`
- `temporaryAttributes(atCharacterIndex:effectiveRange:)`
- `temporaryAttributes(atCharacterIndex:longestEffectiveRange:in:)`

### Supporting types

- `NSLayoutManager.TextLayoutOrientation`

### Deprecated

- `Deprecated Symbols`

## See Also

- `NSTextStorage`
- `NSATSTypesetter`
- `NSTypesetter`
