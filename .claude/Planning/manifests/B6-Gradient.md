# B6 — GradientPage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/DrawingAndGraphics/GradientPage.swift
**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.drawing-and-graphics` subsection (Gradient leaf — only surviving leaf)
**Status:** reviewed
**Implementer:** Claude Sonnet 4.6 (2026-05-05)
**Reviewer:** Claude Sonnet 4.6 (spec-compliance, 2026-05-05)

## Absorbed leaves

| # | Leaf displayName | Current page path | Current status | apiSignature | Doc path | Subsection target |
|---|---|---|---|---|---|---|
| 1 | Gradient | GradientPage.swift | .real | struct Gradient | Documentation/SwiftUI/drawing-and-graphics/gradient.md | "Reference" |
| 2 | MeshGradient | MeshGradientPage.swift | .real | struct MeshGradient | Documentation/SwiftUI/drawing-and-graphics/meshgradient.md | "MeshGradient" |
| 3 | AnyGradient | AnyGradientDescribePage.swift | .real (describe) | struct AnyGradient | Documentation/SwiftUI/drawing-and-graphics/anygradient.md | "Reference" / "AnyGradient type" |
| 4 | LinearGradient | (inline in GradientPage) | .real (implicit) | struct LinearGradient | (documented in gradient.md) | "LinearGradient" |
| 5 | RadialGradient | (inline in GradientPage) | .real (implicit) | struct RadialGradient | (documented in gradient.md) | "RadialGradient" |
| 6 | AngularGradient | (inline in GradientPage) | .real (implicit) | struct AngularGradient | (documented in gradient.md) | "AngularGradient / EllipticalGradient" |
| 7 | EllipticalGradient | (inline in GradientPage) | .real (implicit) | struct EllipticalGradient | (documented in gradient.md) | "AngularGradient / EllipticalGradient" |
| 8 | Gradient.Stop | (inline in GradientPage) | .real (implicit) | typealias Gradient.Stop | (documented in gradient.md) | "Gradient.Stop" |

**Note on absorption status:**
- **GradientPage.swift** is now the fully consolidated page (560 lines). Rewritten from GalleryPageScaffold to TypographyPage/ShapesGalleryPage ScrollView + VStack + PageSection rhythm.
- **MeshGradientPage.swift** deleted from filesystem (absorbed into GradientPage "MeshGradient" section).
- **AnyGradientDescribePage.swift** deleted from filesystem (absorbed into GradientPage "Reference" and "AnyGradient" sections).
- **LinearGradient, RadialGradient, AngularGradient, EllipticalGradient, Gradient.Stop** already inline — preserved in their own PageSection subsections.

## Per-leaf coverage checklist

### Leaf 1: Gradient (parent type)
- [x] Header info captured (title, availability, apiSignature)
- [x] All Gradient type signatures from GradientPage extracted and confirmed
- [x] Gradient default demo exists (LinearGradient example)
- [x] Gradient variant demos exist (LinearGradient, RadialGradient, AngularGradient, EllipticalGradient, Gradient.Stop custom stops)
- [x] AnyGradient demos exist (now in dedicated AnyGradient section)
- [x] Notes paragraphs preserved (color flexibility, Color.tint.gradient, AngularGradient conic use, EllipticalGradient aspect adaptation)
- [x] Source page validated as comprehensive parent
- [x] Catalog leaf retained as single parent entry
- [x] PageRegistry entry retained

### Leaf 2: MeshGradient
- [x] Header info captured (title, availability: macOS 15.0+, apiSignature)
- [x] MeshGradient signatures transcribed (width, height, points, colors, smoothsColors noted)
- [x] Default demo transferred (3x3 grid with rainbow colors)
- [x] Variant demos transferred (2x2 grid, 3x3 cool palette, distorted control points — count: 3)
- [x] States demos transferred (use as ShapeStyle on Circle/RoundedRectangle — count: 1)
- [x] Notes paragraphs preserved (both View and ShapeStyle, grid definition, Bézier interpolation, distortion, macOS 15+ availability — count: 5)
- [x] Source page (MeshGradientPage.swift) deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry redirected to GradientPage()
- [x] Lands in subsection: "MeshGradient"

### Leaf 3: AnyGradient (type-erased gradient)
- [x] Header info captured (title, availability: macOS 13.0+, apiSignature)
- [x] AnyGradient blurb transferred (type erasure, Color.gradient property, vertical linear gradient as ShapeStyle)
- [x] Signatures transcribed (Color.accentColor.gradient, shape.fill(.accentColor.gradient), foregroundStyle/backgroundStyle usage)
- [x] Demos transferred (Color.accentColor.gradient on Circle, Color.blue.gradient on RoundedRectangle — count: 2; plus .fill(.purple.gradient) and .foregroundStyle(.orange.gradient))
- [x] Notes paragraphs preserved (type-erased nature, default vertical linear gradient, returned by .gradient property on Color and semantic styles)
- [x] Source page (AnyGradientDescribePage.swift) deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry redirected to GradientPage()
- [x] Lands in subsection: "AnyGradient"

### Leaf 4: LinearGradient
- [x] Header info captured (available within Gradient subsection)
- [x] All LinearGradient signatures confirmed (colors, startPoint, endPoint, stops variants)
- [x] Variant demos exist (→ leading→trailing, ↓ top→bottom, ↘ topLeading→bottomTrailing — count: 3)
- [x] Already consolidated in GradientPage (no separate page to delete)
- [x] Lands in subsection: "LinearGradient"

### Leaf 5: RadialGradient
- [x] Header info captured (available within Gradient subsection)
- [x] All RadialGradient signatures confirmed (colors, center, startRadius, endRadius)
- [x] Variant demos exist (count: 2 — center with symmetric radii, topLeading offset)
- [x] Already consolidated in GradientPage (no separate page to delete)
- [x] Lands in subsection: "RadialGradient"

### Leaf 6: AngularGradient
- [x] Header info captured (available within Gradient subsection)
- [x] All AngularGradient signatures confirmed (colors, center, startAngle, endAngle)
- [x] Variant demos exist (count: 2 — full wheel rainbow, half-circle with angle bounds)
- [x] Notes on conic sweeping and use cases preserved
- [x] Already consolidated in GradientPage (no separate page to delete)
- [x] Lands in subsection: "AngularGradient"

### Leaf 7: EllipticalGradient
- [x] Header info captured (available within Gradient subsection)
- [x] All EllipticalGradient signatures confirmed (colors, center, startRadius, endRadius are automatic; aspect-adaptive)
- [x] Variant demos exist (count: 1 — accentColor to transparent centered demo)
- [x] Notes on aspect-ratio adaptation preserved
- [x] Already consolidated in GradientPage (no separate page to delete)
- [x] Lands in subsection: "EllipticalGradient"

### Leaf 8: Gradient.Stop
- [x] Header info captured (available within Gradient subsection)
- [x] Signature confirmed (typealias Gradient.Stop or init(color:location:))
- [x] Demo exists (custom stop position gradient with 0, 0.4, 0.6, 1 stops — blue→blue→pink→pink)
- [x] Notes on normalized location (0–1 range) available
- [x] Already consolidated in GradientPage (no separate page to delete)
- [x] Lands in subsection: "Gradient.Stop — Custom Stop Positions"

## Parent page section plan

Ordered list of `PageSection` or subsection titles in the final consolidated GradientPage — **IMPLEMENTED**:

1. **Header** — "Gradient · MeshGradient · AnyGradient" title, summary covering linear/radial/angular/elliptical/mesh fills, availability (macOS 10.15+), all 8 type names listed ✓
2. **Reference** — AnyGradient type-erased definition, .gradient property on Color, vertical linear default behavior, 4 signature callouts, 3 notes ✓
3. **LinearGradient** — type definition, default demo, 3 direction variant demos, usage note ✓
4. **RadialGradient** — type definition, 2 variant demos (center + topLeading), notes ✓
5. **AngularGradient** — type definition, full wheel + angle-bounded demos, conic use note ✓
6. **EllipticalGradient** — type definition, centered demo, aspect-ratio adaptation note ✓
7. **Gradient.Stop — Custom Stop Positions** — stop positions demo, 2 notes ✓
8. **MeshGradient** — type definition (macOS 15.0+), default demo, 2 grid variants, distorted mesh, ShapeStyle demo, 5 notes ✓
9. **AnyGradient** — type-erased demo, 2 additional demos (.fill + .foregroundStyle), 2 notes ✓
10. **Notes** — 6 consolidated gradient guidance notes ✓

## Sign-off

- [x] Discovery agent confirms all gradient leaves enumerated from Catalog+SwiftUI.swift `swiftui.drawing-and-graphics` section
- [x] Implementer verifies MeshGradientPage.swift and AnyGradientDescribePage.swift content integrated into GradientPage
- [x] Spec-compliance reviewer audits consolidated GradientPage against manifest checklist — all boxes ✅ (2026-05-05)
- [ ] Code-quality reviewer approves dense page composition
- [ ] Manifest committed in `merged` state alongside code commit

## Manifest metadata

**Absorbed leaves count:** 8 (1 parent [Gradient] + 2 separate pages deleted [MeshGradient, AnyGradient] + 5 already inline [LinearGradient, RadialGradient, AngularGradient, EllipticalGradient, Gradient.Stop])
**Current state:** IMPLEMENTED — GradientPage fully consolidated (560 lines). MeshGradientPage and AnyGradientDescribePage deleted. Catalog and Registry cleaned up. Build succeeds.
**Net result:** 3 gradient-related catalog leaves (Gradient, MeshGradient, AnyGradient) collapsed to 1 leaf (Gradient parent). 2 page files deleted. GradientPage.swift expanded from 218 → 560 lines.
**Target deliverable:** ✓ Single scrollable GradientPage covering all 8 absorbed types/stops as inline subsections per section plan above.
