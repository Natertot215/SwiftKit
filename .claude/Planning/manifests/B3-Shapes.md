# B3 — ShapesGalleryPage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/Shapes/ShapesGalleryPage.swift (expand CircleEllipseCapsulePage in place, rename to ShapesGalleryPage)
**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.shapes` subsection, line ~759 (section root) — current empty subsection. New parent leaf will be `swiftui.shapes.gallery` (displayName: "Shapes Gallery", pageBuilder: .real(symbol: "ShapesGallery"))
**Status:** merged
**Implementer:** Claude Sonnet 4.6 — 2026-05-05
**Reviewer:** Claude Sonnet 4.6 — 2026-05-05

## Absorbed leaves

| # | Leaf displayName | Current page path | Current status | apiSignature | Doc path | Subsection target |
|---|---|---|---|---|---|---|
| 1 | Circle | CircleEllipseCapsulePage.swift (consolidated) | .placeholder | struct Circle : Shape | Documentation/SwiftUI/shapes/circle.md | "Circle" |
| 2 | Ellipse | CircleEllipseCapsulePage.swift (consolidated) | .placeholder | struct Ellipse : Shape | Documentation/SwiftUI/shapes/ellipse.md | "Ellipse" |
| 3 | Capsule | CircleEllipseCapsulePage.swift (consolidated) | .placeholder | struct Capsule : Shape | Documentation/SwiftUI/shapes/capsule.md | "Capsule" |
| 4 | Rectangle | RectanglePage.swift | .placeholder | struct Rectangle : Shape | Documentation/SwiftUI/shapes/rectangle.md | "Rectangle" |
| 5 | RoundedRectangle | RoundedRectanglePage.swift | .placeholder | struct RoundedRectangle : Shape | Documentation/SwiftUI/shapes/roundedrectangle.md | "RoundedRectangle" |
| 6 | RoundedCornerStyle | Catalog only | .placeholder | enum RoundedCornerStyle | Documentation/SwiftUI/shapes/roundedcornerstyle.md | "RoundedRectangle — corner styles" |
| 7 | RoundedRectangularShape | Catalog only | .placeholder | struct RoundedRectangularShape : Shape | Documentation/SwiftUI/shapes/roundedrectangularshape.md | "RoundedRectangle — modern API" |
| 8 | RoundedRectangularShapeCorners | Catalog only | .placeholder | enum RoundedRectangularShapeCorners | Documentation/SwiftUI/shapes/roundedrectangularshapecorners.md | "RoundedRectangle — modern API corners" |
| 9 | UnevenRoundedRectangle | UnevenRoundedRectanglePage.swift | .placeholder | struct UnevenRoundedRectangle : Shape | Documentation/SwiftUI/shapes/unevenroundedrectangle.md | "UnevenRoundedRectangle" |
| 10 | RectangleCornerRadii | Catalog only | .placeholder | struct RectangleCornerRadii | Documentation/SwiftUI/shapes/rectanglecornerradii.md | "UnevenRoundedRectangle — corner radii" |
| 11 | RectangleCornerInsets | Catalog only | .placeholder | struct RectangleCornerInsets | Documentation/SwiftUI/shapes/rectanglecornerinsets.md | "UnevenRoundedRectangle — corner insets" |
| 12 | ConcentricRectangle | Catalog only | .placeholder | struct ConcentricRectangle : Shape | Documentation/SwiftUI/shapes/concentricrectangle.md | "UnevenRoundedRectangle — concentric nesting" |
| 13 | AnyShape | Catalog only | .placeholder | struct AnyShape : Shape | Documentation/SwiftUI/shapes/anyshape.md | "AnyShape" |
| 14 | ShapeRole | Catalog only | .placeholder | enum ShapeRole | Documentation/SwiftUI/shapes/shaperole.md | "ShapeRole" |

**Note on non-absorption:**
- **Path** (catalog line ~775, placeholder) — STAYS SEPARATE. Path is a rich, standalone topic covering low-level drawing, custom shapes, bezier curves, arcs. Already has PathPage.swift. Keep as dedicated leaf.
- **Shape** (catalog line ~777, placeholder) — STAYS SEPARATE. Shape protocol is a foundational concept that underpins all shapes, not a concrete primitive. Keep as describe leaf or merge into ShapeModifiersPage if that becomes populated.
- **ShapeStyle, StrokeStyle, FillStyle, InsettableShape, ScaledShape, RotatedShape, OffsetShape, TransformedShape, ContainerRelativeShape, ShapeView, StrokeShapeView, StrokeBorderShapeView, FillShapeView, View/containerShape(_:)** — STAY SEPARATE. These are modifiers, style types, and container shapes — not primitive shapes. They are covered by ShapeModifiersPage.swift (if populated) or remain as placeholder leaves.

## Per-leaf coverage checklist

For each absorbed primitive shape leaf:

### Leaf 1: Circle
- [x] Header info captured (title, availability, apiSignature)
- [x] All Circle signatures from CircleEllipseCapsulePage transcribed
- [x] Circle default demo transferred (current: single filled circle demo)
- [x] Circle variant demos transferred (count expected: 4 — fill, stroke, strokeBorder, RadialGradient)
- [x] Circle states/usage demos transferred (count expected: 1 — nested concentric pattern)
- [x] Notes paragraphs preserved (count expected: 2 — square frame fit, InsettableShape)
- [x] Lands in subsection: "Circle"

### Leaf 2: Ellipse
- [x] Header info captured (title, availability, apiSignature)
- [x] All Ellipse signatures from CircleEllipseCapsulePage transcribed
- [x] Ellipse default demo transferred (current: single filled ellipse demo)
- [x] Ellipse variant demos transferred (count expected: 3 — fill, stroke, fill+stroke overlay)
- [x] Ellipse states/usage demos transferred (count expected: 0)
- [x] Notes paragraphs preserved (count expected: 0 — brief mention in Circle notes)
- [x] Lands in subsection: "Ellipse"

### Leaf 3: Capsule
- [x] Header info captured (title, availability, apiSignature)
- [x] All Capsule signatures from CircleEllipseCapsulePage transcribed
- [x] Capsule default demo transferred (current: single filled capsule demo)
- [x] Capsule variant demos transferred (count expected: 3 — fill, stroke, style: .circular)
- [x] Capsule states/usage demos transferred (count expected: 0)
- [x] Notes paragraphs preserved (count expected: 2 — smallest dimension radius, InsettableShape)
- [x] Lands in subsection: "Capsule"

### Leaf 4: Rectangle
- [x] Header info captured (title, availability, apiSignature)
- [x] All Rectangle signatures from RectanglePage transcribed
- [x] Rectangle default demo transferred (current: single filled rectangle demo)
- [x] Rectangle variant demos transferred (count expected: 4 — fill, stroke, trim, fill+stroke overlay)
- [x] Rectangle states/usage demos transferred (count expected: 2 — scale/rotation, clipShape)
- [x] Notes paragraphs preserved (count expected: 4)
- [x] Lands in subsection: "Rectangle"

### Leaf 5: RoundedRectangle
- [x] Header info captured (title, availability, apiSignature)
- [x] All RoundedRectangle signatures from RoundedRectanglePage transcribed
- [x] RoundedRectangle default demo transferred (current: single rounded rect with cornerRadius: 16)
- [x] RoundedRectangle variant demos transferred (count expected: 4 — radius sweep, style variants, strokeBorder, gradient)
- [x] RoundedRectangle states/usage demos transferred (count expected: 1 — interactive corner radius slider)
- [x] Notes paragraphs preserved (count expected: 4)
- [x] Lands in subsection: "RoundedRectangle"

### Leaf 6: RoundedCornerStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] RoundedCornerStyle enum cases documented (.circular, .continuous)
- [x] Demos showing visual difference between styles (extracted from RoundedRectanglePage)
- [x] Notes on .continuous preference (Apple modern style)
- [x] Lands in subsection: "RoundedRectangle — corner styles" (embedded in RoundedRectangle section)

### Leaf 7: RoundedRectangularShape
- [x] Header info captured (title, availability, apiSignature)
- [x] RoundedRectangularShape protocol documented (macOS 26.0 new API)
- [x] Relationship to RoundedRectangle clarified
- [x] Basic demo showing usage
- [x] Lands in subsection: "RoundedRectangle — Modern API"

### Leaf 8: RoundedRectangularShapeCorners
- [x] Header info captured (title, availability, apiSignature)
- [x] Enum cases documented (all 9 cases documented)
- [x] Usage in RoundedRectangularShape context shown
- [x] Lands in subsection: "RoundedRectangle — Modern API" (embedded)

### Leaf 9: UnevenRoundedRectangle
- [x] Header info captured (title, availability, apiSignature)
- [x] All UnevenRoundedRectangle signatures from UnevenRoundedRectanglePage transcribed
- [x] UnevenRoundedRectangle default demo transferred
- [x] UnevenRoundedRectangle variant demos transferred (count expected: 3 — corner combinations, strokeBorder, concentric nesting)
- [x] UnevenRoundedRectangle states/usage demos transferred (count expected: 1 — per-corner interactive sliders)
- [x] Notes paragraphs preserved (count expected: 4)
- [x] Lands in subsection: "UnevenRoundedRectangle"

### Leaf 10: RectangleCornerRadii
- [x] Header info captured (title, availability, apiSignature)
- [x] RectangleCornerRadii struct documented (holds topLeading, topTrailing, bottomLeading, bottomTrailing)
- [x] Constructor documentation shown
- [x] Demo showing usage with UnevenRoundedRectangle
- [x] Lands in subsection: "UnevenRoundedRectangle" (embedded)

### Leaf 11: RectangleCornerInsets
- [x] Header info captured (title, availability, apiSignature)
- [x] RectangleCornerInsets struct documented (macOS 26.0 new API)
- [x] Constructor and usage documented
- [x] Lands in subsection: "UnevenRoundedRectangle — Modern API"

### Leaf 12: ConcentricRectangle
- [x] Header info captured (title, availability, apiSignature)
- [x] ConcentricRectangle struct documented (macOS 26.0 new API)
- [x] Demo showing nested concentric usage (extracted from UnevenRoundedRectanglePage)
- [x] Lands in subsection: "UnevenRoundedRectangle — Modern API" (embedded)

### Leaf 13: AnyShape
- [x] Header info captured (title, availability, apiSignature)
- [x] AnyShape type erasure purpose documented
- [x] Demo showing AnyShape usage (wrapping different shape types)
- [x] Notes on type-erased Shape pattern
- [x] Lands in subsection: "AnyShape"

### Leaf 14: ShapeRole
- [x] Header info captured (title, availability, apiSignature)
- [x] ShapeRole enum cases documented (.fill, .stroke, .separator)
- [x] Purpose and usage context explained
- [x] Demo showing role variants if applicable
- [x] Lands in subsection: "ShapeRole"

## Parent page section plan

Ordered list of `PageSection` titles in the new dense ShapesGalleryPage:

1. **Header** — "Shapes Gallery" title, summary, availability (macOS 10.15+), apiSignature: "Primitive Shape types"
2. **Circle** — Circle type, variants (fill, stroke, strokeBorder, gradient), notes (1:1 ratio, InsettableShape)
3. **Ellipse** — Ellipse type, variants (fill, stroke, overlay), notes
4. **Capsule** — Capsule type, variants (fill, stroke, .circular style), notes (radius based on smallest dimension)
5. **Rectangle** — Rectangle type, variants (fill, stroke, trim, overlay), states (scale, rotation, clipShape), notes (fills frame, InsettableShape, trim animation)
6. **RoundedRectangle** — RoundedRectangle type, corner radius sweep variants, RoundedCornerStyle (.circular vs .continuous), strokeBorder, gradient fill, states (interactive radius), notes (.continuous for Apple style, InsettableShape, animatable radius, clipShape)
7. **RoundedRectangle — Modern API** — RoundedRectangularShape type, RoundedRectangularShapeCorners enum, usage examples (macOS 26.0+)
8. **UnevenRoundedRectangle** — UnevenRoundedRectangle type, RectangleCornerRadii struct, corner combinations demo, strokeBorder, ConcentricRectangle nesting pattern, states (per-corner interactive sliders), notes (RectangleCornerRadii constructor, style applies per-corner, InsettableShape, macOS 13.0+ minimum)
9. **UnevenRoundedRectangle — Modern API** — RectangleCornerInsets struct usage (macOS 26.0+)
10. **AnyShape** — AnyShape type erasure, demo showing wrapped shapes, notes (protocol hiding)
11. **ShapeRole** — ShapeRole enum, cases and usage context, demos
12. **Notes and guidelines** — Summary of InsettableShape, trim() animation patterns, clipShape usage, HIG notes on shape choice

## Sign-off

- [x] Discovery agent confirms all primitive shape leaves enumerated from Catalog+SwiftUI.swift `swiftui.shapes` section
- [x] Implementer verifies no placeholder leaf is missed
- [x] Spec-compliance reviewer audits consolidated ShapesGalleryPage against manifest checklist — ✅ APPROVED (commit b7d9ff5, reviewed 2026-05-05)
- [x] Code-quality reviewer approves dense page composition, reuse of PageSection, conformance to TypographyPage rhythm — ✅ APPROVED (Phase 6 B3, 2026-05-05): L-001/L-012 zero hits; build clean; Apple-only compliant; TypographyPage rhythm matched; named colors in gradient demos are illustration precedent, not system-chrome violations.

## Manifest metadata

**Absorbed leaves count:** 14 (3 consolidated from existing pages + 11 converted from .placeholder catalog leaves)
**Placeholder conversions:** All 14 absorbed leaves are currently .placeholder in Catalog — they will be populated inline within the dense ShapesGalleryPage and the individual placeholder leaves removed from the catalog structure.
**Net result:** 29 shapes catalog leaves (~758–791 in Catalog+SwiftUI.swift) collapse to 3 leaves: ShapesGallery (.real), Path (.placeholder or .real), ShapeStyle/ShapeModifiers (.placeholder or .real if ShapeModifiersPage becomes populated).

