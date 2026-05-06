# D1 — NSTextView Family Consolidation Manifest

**Parent page:** SwiftKit/Pages/AppKit/ViewsAndControls/ContentViews/NSTextViewPage.swift
**Status:** merged

## Absorbed leaves

| # | Type | Kind | Absorbed Into |
|---|------|------|---------------|
| 1 | NSText | abstract class | Reference A — Abstract base |
| 2 | NSTextContainer | class | Reference A — Layout types |
| 3 | NSTextLayoutManager | class (macOS 12.0+) | Reference A — Layout types |
| 4 | NSTextContentStorage | class (macOS 12.0+) | Reference A — Layout types |
| 5 | NSTextSelection | class (macOS 12.0+) | Reference A — Layout types |
| 6 | NSTextFinder | class (macOS 10.7+) | Reference B — Find infrastructure |
| 7 | NSTextFinderClient | protocol (macOS 10.7+) | Reference B — Find infrastructure |
| 8 | NSTextFinderBarContainer | protocol (macOS 10.7+) | Reference B — Find infrastructure |

**Excluded per spec:** NSTextField, NSSecureTextField (separate controls). NSTextStorage, NSLayoutManager (TextKit D7 scope).

## Per-leaf coverage checklist

### Leaf 1: NSText
- [x] Header info captured (abstract class, macOS 10.0+)
- [x] All signatures transcribed (string, isEditable, isSelectable, delegate, font, alignment, textColor)
- [x] Notification names listed (didBeginEditing, didChange, didEndEditing)
- [x] Documented as never-instantiated-directly — use NSTextView
- [x] Catalog leaf removed from Catalog+AppKit.swift
- [x] No registry entry existed — no action needed
- [x] Lands in subsection: Reference A

### Leaf 2: NSTextContainer
- [x] Header info captured (class, macOS 10.0+)
- [x] All signatures transcribed (size, lineFragmentPadding, widthTracksTextView, heightTracksTextView, exclusionPaths)
- [x] Code example: container construction + exclusion path
- [x] Catalog leaf removed from Catalog+AppKit.swift (textkit section)
- [x] No registry entry existed — no action needed
- [x] Lands in subsection: Reference A

### Leaf 3: NSTextLayoutManager
- [x] Header info captured (class, macOS 12.0+, TextKit 2)
- [x] All signatures transcribed (enumerateTextLayoutFragments, NSTextViewportLayoutController)
- [x] Caution note: calling layoutManager forces downgrade to TextKit 1
- [x] Opt-in init documented (usingTextLayoutManager: true)
- [x] Catalog leaf removed from Catalog+AppKit.swift (textkit section)
- [x] No registry entry existed — no action needed
- [x] Lands in subsection: Reference A

### Leaf 4: NSTextContentStorage
- [x] Header info captured (class : NSTextContentManager, macOS 12.0+)
- [x] All signatures transcribed (textStorage, enumerateTextElements, NSTextParagraph)
- [x] Custom backend note documented
- [x] Catalog leaf removed from Catalog+AppKit.swift (textkit section)
- [x] No registry entry existed — no action needed
- [x] Lands in subsection: Reference A

### Leaf 5: NSTextSelection
- [x] Header info captured (class, macOS 12.0+)
- [x] All signatures transcribed (textRanges, affinity, granularity, isTransient, anchorPositionOffset)
- [x] Clarification: most AppKit work uses selectedRanges (NSRange-based); NSTextSelection is for custom layout
- [x] Catalog leaf removed from Catalog+AppKit.swift (textkit section)
- [x] No registry entry existed — no action needed
- [x] Lands in subsection: Reference A

### Leaf 6: NSTextFinder
- [x] Header info captured (class, macOS 10.7+)
- [x] All signatures transcribed (client, findBarContainer, isIncrementalSearchingEnabled, performAction, validateAction)
- [x] One-line adoption (usesFindBar = true) documented
- [x] Manual construction example documented
- [x] Menu item wiring (performTextFinderAction tag) documented
- [x] Catalog leaf removed from Catalog+AppKit.swift (controls section)
- [x] Registry entry "NSTextFinder" removed from PageRegistry.swift
- [x] Describe page deleted from disk
- [x] Lands in subsection: Reference B

### Leaf 7: NSTextFinderClient
- [x] Header info captured (protocol, macOS 10.7+)
- [x] All signatures transcribed (string, string(at:effectiveRange:endsWithSearchBoundary:), visibleCharacterRanges, scrollRangeToVisible, shouldReplaceCharacters, replaceCharacters, didReplaceCharacters)
- [x] NSTextView already conforms — noted
- [x] Catalog leaf removed from Catalog+AppKit.swift (controls section)
- [x] Registry entry "NSTextFinderClient" removed from PageRegistry.swift
- [x] Describe page deleted from disk
- [x] Lands in subsection: Reference B

### Leaf 8: NSTextFinderBarContainer
- [x] Header info captured (protocol, macOS 10.7+)
- [x] All signatures transcribed (findBarView, isFindBarVisible, findBarViewDidChangeHeight, contentView, findBarPosition)
- [x] NSScrollView already conforms — noted
- [x] Catalog leaf removed from Catalog+AppKit.swift (controls section)
- [x] Registry entry "NSTextFinderBarContainer" removed from PageRegistry.swift
- [x] Describe page deleted from disk
- [x] Lands in subsection: Reference B

## Page section plan

1. **Header** — NSTextView, subtitle, inheritance, availability, doc path
2. **Reference A** — NSText, NSTextContainer, NSTextLayoutManager, NSTextContentStorage, NSTextSelection; each with kind/availability badge + blurb + API snippet
3. **Reference B** — NSTextFinder, NSTextFinderClient, NSTextFinderBarContainer; same format
4. **Default — NSTextView** — Editable rich text inside NSScrollView via NSViewRepresentable bridge; isEditable/spellChecking/autoCorrect toggles; reset button; construction snippet
5. **Text Formatting** — font/color/paragraph style via NSTextStorage; isRichText, importsGraphics, dark-mode adaptation
6. **Selection and Ranges** — setSelectedRange, selectedRanges, selectionGranularity, insertionPointColor, selectedTextAttributes; notification names
7. **Find & Replace** — usesFindBar, isIncrementalSearchingEnabled, NSTextFinder manual wiring
8. **Editing** — isEditable, isFieldEditor, allowsUndo, auto-substitution properties, Writing Tools (macOS 15+), inspector/ruler accessories
9. **Notes** — TextKit 2 guidance, scrollable pair, find bar, NSTextField advisory, TextKit downgrade caution

## Code quality review

- [x] L-001 clean: zero hits for `Color(red:` or `.system(size:`
- [x] Bridges use NSViewRepresentable only (NSScrollView wrapping NSTextView)
- [x] No custom wrapper structs — only AppKit primitives
- [x] @State properties are private
- [x] Coordinator pattern correct (lastSeed: Int to debounce seed resets)
- [x] updateNSView guarded against redundant seedRichText calls
- [x] Semantic color tokens only (NSColor.labelColor, .controlAccentColor, .findHighlightColor)
- [x] ScrollView + VStack + PageSection rhythm followed
- [x] Reference sections appear above demos
- [x] galleryReadableContentWidth applied
- [x] Build: SUCCEEDED

## Sign-off

- Implementer: Claude Sonnet 4.6 — 2026-05-05
- Code-quality reviewer: Claude Sonnet 4.6 — 2026-05-05

## Manifest metadata

- **Task ID:** D1
- **Parent type:** NSTextView
- **Framework:** AppKit
- **Section:** views-and-controls / content-views
- **Absorbed leaves:** 8 (NSText, NSTextContainer, NSTextLayoutManager, NSTextContentStorage, NSTextSelection, NSTextFinder, NSTextFinderClient, NSTextFinderBarContainer)
- **Registry entries removed:** NSTextFinder, NSTextFinderClient, NSTextFinderBarContainer
- **Describe pages deleted:** NSTextFinderDescribePage.swift, NSTextFinderClientDescribePage.swift, NSTextFinderBarContainerDescribePage.swift
- **Created:** 2026-05-05
