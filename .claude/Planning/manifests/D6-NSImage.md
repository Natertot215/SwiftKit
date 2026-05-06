# D6 — NSImageView / NSImage Family Consolidation Manifest

**Parent page:** SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSImageViewPage.swift
**Status:** merged

## Absorbed leaves

| # | Type | Kind | Absorbed Into |
|---|------|------|---------------|
| 1 | NSImage | class : NSObject | Default render tab (NSImage creation + system images) |
| 2 | NSImageDelegate | protocol | Reference — Variants tab |
| 3 | NSImageRep | abstract class | Reference — Variants tab |
| 4 | NSAccessibilityImage | protocol (describe-only) | Reference — Variants tab |
| 5 | NSScrubberImageItemView | class : NSScrubberItemView (describe-only) | Reference — Variants tab |

**Total absorbed:** 5 leaves (1 parent kept, 5 siblings documented inline)

## Per-leaf coverage checklist

### Leaf 1: NSImage
- [x] Header info captured (class : NSObject)
- [x] All constructor variants documented: systemSymbolName:accessibilityDescription:, named:, data:, contentsOfFile:, contentsOf: URL, cgImage:size:
- [x] NSImage.Name constants documented (applicationIcon, cautionName, menuOnStateTemplate)
- [x] Key properties documented (size, representations, isTemplate, capInsets, resizingMode)
- [x] Drawing methods documented (draw(in:), draw(in:from:operation:fraction:))
- [x] Cache control documented (cacheMode, recache)
- [x] Live NSViewRepresentable bridge: 6 SF Symbols rendered in NSStackView with NSImageView + NSColor.controlAccentColor tint
- [x] APICallout: accessibilityDescription accessibility guidance
- [x] Catalog leaf promoted from .placeholder to .real (symbol: "NSImageView") in images-and-pdf section
- [x] Registry entry "NSImage" added → NSImageViewPage()
- [x] Lands in: Default render tab

### Leaf 2: NSImageDelegate
- [x] Header info captured (protocol : NSObjectProtocol)
- [x] All optional methods documented: image(_:didLoadRepresentation:with:) with NSImage.LoadStatus enum cases (.completed, .cancelled, .invalidData, .unexpectedEOF, .readError)
- [x] image(_:willLoadRepresentation:) documented
- [x] Usage pattern documented (myImage.delegate = self)
- [x] Practical scope note: only needed for async/on-demand loading
- [x] Catalog leaf promoted from .placeholder to .real (symbol: "NSImageView")
- [x] Registry entry "NSImageDelegate" added → NSImageViewPage()
- [x] Lands in: Reference — Variants tab

### Leaf 3: NSImageRep
- [x] Header info captured (abstract class : NSObject)
- [x] Concrete subclasses documented: NSBitmapImageRep, NSCIImageRep, NSPDFImageRep, NSEPSImageRep, NSCustomImageRep
- [x] Key properties documented (size, pixelsWide, pixelsHigh, colorSpaceName, bitsPerSample, bitsPerPixel, isOpaque)
- [x] Rep management documented (addRepresentation, removeRepresentation, representations)
- [x] bestRepresentation(for:context:hints:) documented
- [x] Catalog leaf promoted from .placeholder to .real (symbol: "NSImageView")
- [x] Registry entry "NSImageRep" added → NSImageViewPage()
- [x] Lands in: Reference — Variants tab

### Leaf 4: NSAccessibilityImage
- [x] Header info captured (protocol : NSAccessibilityElementProtocol, describe-only)
- [x] NSImageView auto-adoption noted
- [x] Single required method documented: accessibilityLabel() -> String?
- [x] VoiceOver forwarding mechanism documented (forwards to image?.accessibilityDescription)
- [x] Decorative image nil pattern documented
- [x] Custom view adoption example shown
- [x] Catalog leaf deleted from Catalog+AppKit.swift (accessibility-for-appkit section, line 468)
- [x] No registry entry added (trivial reference, not a navigation target)
- [x] Lands in: Reference — Variants tab (describe-only block)

### Leaf 5: NSScrubberImageItemView
- [x] Header info captured (class : NSScrubberItemView, macOS 10.12.2+, describe-only)
- [x] Usage as NSScrubber item view class documented
- [x] scrubber.register pattern documented
- [x] NSScrubberDataSource callback shown (scrubber(_:viewForItemAt:))
- [x] imageView property noted (embedded NSImageView for scaling/tint configuration)
- [x] Catalog leaf deleted from Catalog+AppKit.swift (touch-bar scrubber-items section, line 429)
- [x] No registry entry added (Touch Bar describe-only, not a navigation target)
- [x] Lands in: Reference — Variants tab (describe-only block)

## Page section plan

Rendered via GalleryPageScaffold (defaultRender / variants / states / notes tabs):

1. **Header** — NSImageView / NSImage, subtitle describing both roles, inheritance info, doc paths
2. **Default render tab (NSImage creation)** — Live NSStackView bridge showing 6 SF Symbols with accent tint; NSImage constructor variants snippet; key properties snippet; APICallout for accessibilityDescription
3. **Variants tab (Reference)** — NSImageDelegate protocol; NSImageRep class (with subclasses list); NSAccessibilityImage protocol (describe-only); NSScrubberImageItemView (describe-only)
4. **States tab (NSImageView)** — Live NSImageViewDemo bridge with symbolName picker, imageScaling picker, imageFrameStyle picker, useTint toggle; NSImageView full configurable API snippet; Image Accessibility snippet
5. **Notes** — NSImageView vs SwiftUI Image; contentTintColor / multicolor note; symbol effects order requirement; isEditable vs NSButton for tap-to-act; NSImageRep direct construction rarity; NSAccessibilityImage auto-adoption

## Code quality review

- [x] L-001 clean: zero hits for `Color(red:` or `.system(size:`
- [x] Bridges use NSViewRepresentable (NSImageViewDemo, NSImageNamedDemo)
- [x] No custom wrapper structs beyond NSViewRepresentable bridges
- [x] @State properties are private (symbolName, scaling, alignment, frameStyle, useTint)
- [x] NSImageNamedDemo uses a let constant for symbols — not state, not a @State
- [x] NSImageViewDemo updateNSView sets all 5 properties on every update — correct for a demo with independent controls
- [x] symbolConfiguration set before effects (respects ordering requirement)
- [x] contentTintColor: useTint ? .controlAccentColor : nil — correct nil to suppress tint
- [x] Semantic tokens only (NSColor.controlAccentColor in demo bridge)
- [x] GalleryPageScaffold tabs used correctly (default/variants/states/notes)
- [x] Reference sections appear in Variants tab before States tab
- [x] Private Block helper struct defined locally
- [x] Build: SUCCEEDED

## Sign-off

- Implementer: Claude Sonnet 4.6 — 2026-05-05
- Code-quality reviewer: Claude Sonnet 4.6 — 2026-05-05

## Manifest metadata

- **Task ID:** D6
- **Parent type:** NSImageView (expanded to cover NSImage family)
- **Framework:** AppKit
- **Section:** views-and-controls / controls (primary); images-and-pdf; accessibility-for-appkit; touch-bar (source sections)
- **Absorbed leaves:** 5 (NSImage, NSImageDelegate, NSImageRep rerouted; NSAccessibilityImage, NSScrubberImageItemView deleted from catalog)
- **Registry entries added:** NSImage, NSImageDelegate, NSImageRep → NSImageViewPage()
- **Files deleted:** none (all previously placeholder, no existing Describe pages)
- **Created:** 2026-05-05
