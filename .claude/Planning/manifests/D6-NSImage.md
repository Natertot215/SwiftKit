# D6 — NSImageViewPage Expansion Manifest

**Parent page:** SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSImageViewPage.swift (rewrite in place)
**Parent leaf location:** Catalog+AppKit.swift, `appkit.views-and-controls.controls`, line 124 (NSImageView, `.real(symbol: "NSImageView")`) — stays as parent
**Absorbed leaves:** NSImage (images-and-pdf, line 523), NSImageDelegate (images-and-pdf, line 524), NSImageRep (images-and-pdf, line 525) → routed to NSImageViewPage; NSAccessibilityImage (accessibility-for-appkit, line 468) → removed from catalog; NSScrubberImageItemView (touch-bar, line 429) → removed from catalog
**Status:** pending

## Absorbed Leaves

| # | Leaf displayName | Catalog section / line | apiSignature | Doc path | Treatment |
|---|---|---|---|---|---|
| 1 | NSImage | images-and-pdf.images, line 523 | class NSImage : NSObject | Documentation/AppKit/images-and-pdf/nsimage.md | Full reference section + demo |
| 2 | NSImageDelegate | images-and-pdf.images, line 524 | protocol NSImageDelegate | Documentation/AppKit/images-and-pdf/nsimagedelegate.md | Reference subsection (describe-only) |
| 3 | NSImageRep | images-and-pdf.images, line 525 | class NSImageRep : NSObject | Documentation/AppKit/images-and-pdf/nsimagerep.md | Reference subsection (describe-only) |
| 4 | NSAccessibilityImage | accessibility-for-appkit.custom-view-subclasses, line 468 | protocol NSAccessibilityImage | Documentation/AppKit/accessibility-for-appkit/nsaccessibilityimage.md | Describe-only reference row; removed from catalog |
| 5 | NSScrubberImageItemView | touch-bar.scrubber-items, line 429 | class NSScrubberImageItemView : NSScrubberItemView | Documentation/AppKit/touch-bar/nsscrubberimageitemview.md | Describe-only reference row; removed from catalog |

## Parent Page Section Plan

1. **Header** — Title: "NSImageView / NSImage"; class : NSControl (NSImageView) and class : NSObject (NSImage); doc paths; brief summary
2. **Reference — NSImage API** — Class definition; key constructors (init(named:), init(systemSymbolName:accessibilityDescription:), init(data:), init(contentsOfFile:)); key properties (size, representations, isTemplate, capInsets, resizingMode); drawing methods (draw(in:from:operation:fraction:))
3. **Reference — NSImageDelegate protocol** — Single optional method: image(_:didLoadRepresentation:withStatus:); usage for async load monitoring
4. **Reference — NSImageRep class** — Abstract base for image representations; subclasses (NSBitmapImageRep, NSCIImageRep, NSPDFImageRep, NSEPSImageRep, NSCustomImageRep); key properties (size, colorSpaceName, bitsPerSample, pixelsWide, pixelsHigh)
5. **Reference — NSAccessibilityImage** — Describe-only; protocol provides accessibilityLabel(); conformed to by NSImageView automatically; custom views adopt when displaying images
6. **Reference — NSScrubberImageItemView** — Describe-only; macOS 10.12.2+; class : NSScrubberItemView; imageView property (NSImageView); used in Touch Bar scrubbers
7. **NSImage Creation + Named System Images** — Live demo: NSImage(systemSymbolName:) with several SF Symbols; snippet showing init variants; NSImage.Name constants (NSImageNameApplicationIcon etc.); isTemplate flag
8. **NSImageView Display Modes + Scaling** — Live NSViewRepresentable bridge (existing demo preserved); controls for imageScaling, imageAlignment, imageFrameStyle, contentTintColor; snippet for all FrameStyle values
9. **Image Accessibility** — Snippet: NSImageView auto-conforms NSAccessibilityImage; set accessibilityDescription on NSImage at creation time; contentTintColor does not affect accessibility; VoiceOver reads the description
10. **Notes** — NSImageView vs SwiftUI Image/AsyncImage; isTemplate for tinting; symbolConfiguration for SF Symbols; NSImageDelegate for async load; NSImageRep internals rarely needed directly

## Catalog Edits

**images-and-pdf.images:**
- `appkit.images-and-pdf.images.nsimage` (line 523): `.placeholder` → `.real(symbol: "NSImageView")`
- `appkit.images-and-pdf.images.nsimagedelegate` (line 524): `.placeholder` → `.real(symbol: "NSImageView")`
- `appkit.images-and-pdf.images.nsimagerep` (line 525): `.placeholder` → `.real(symbol: "NSImageView")`

**accessibility-for-appkit.custom-view-subclasses:**
- `appkit.accessibility-for-appkit.custom-view-subclasses.nsaccessibilityimage` (line 468): DELETE leaf entirely (trivial; folded into page reference)

**touch-bar.scrubber-items:**
- `appkit.touch-bar.scrubber-items.nsscrubberimageitemview` (line 429): DELETE leaf entirely (trivial; folded into page reference)

**Unchanged:** `appkit.views-and-controls.controls.nsimageview` (line 124) — parent leaf, `.real(symbol: "NSImageView")` stays

## Registry Edits

**Add 3 entries** (point absorbed image-section leaves to NSImageViewPage):
- `"NSImage"` → NSImageViewPage()
- `"NSImageDelegate"` → NSImageViewPage()
- `"NSImageRep"` → NSImageViewPage()

**NSAccessibilityImage and NSScrubberImageItemView:** not added to registry (catalog leaves deleted)

**Keep:** `"NSImageView"` → NSImageViewPage() (already present)

## Manifest Metadata

- **Task ID:** D6
- **Parent type:** NSImageView (expanded to cover NSImage family)
- **Framework:** AppKit
- **Section:** views-and-controls / controls (primary); images-and-pdf; accessibility-for-appkit; touch-bar (source sections)
- **Absorbed leaf count:** 5 total (3 rerouted, 2 deleted from catalog)
- **Pages to delete:** none (all previously placeholder, no existing Describe pages)
- **Created:** 2026-05-05
