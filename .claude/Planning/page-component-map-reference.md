# Page-Component Map — Reference

Source: 5 canonical reference pages on disk at `SwiftKit/SwiftKit/Pages/Reference/`. Tiles below mirror the existing `VariantTile` and `ReferenceTile` declarations in those pages — they are the authoritative content shape for the Reference heading.

Page-list adjustments: **none.** PlanningTree's 5 Reference leaves (Typography, Color, Materials, Motion, SF Symbols) all map to canonical content already on disk.

---

## Reference > Typography

26 tiles. Source: [`TypographyGalleryPage.swift`](../../../SwiftKit/SwiftKit/Pages/Reference/TypographyGalleryPage.swift).

Font.TextStyle ramp (11):
- `.font(.largeTitle)` — Largest documented macOS text style for primary hero text
- `.font(.title)` — Primary title weight for major headings
- `.font(.title2)` — Secondary title weight one step down from `.title`
- `.font(.title3)` — Tertiary title weight one step down from `.title2`
- `.font(.headline)` — Emphasized weight for inline headings
- `.font(.body)` — Default reading weight for paragraph text
- `.font(.callout)` — Slightly smaller emphasis weight beneath body
- `.font(.subheadline)` — De-emphasized supporting text below body
- `.font(.footnote)` — Annotation weight smaller than subheadline
- `.font(.caption)` — Captioning weight for figure labels and timestamps
- `.font(.caption2)` — Smallest documented caption weight

Font.Weight (8):
- `.fontWeight(.ultraLight)` — Lightest documented stroke weight
- `.fontWeight(.light)` — Light stroke weight one step heavier than ultraLight
- `.fontWeight(.regular)` — Default body stroke weight
- `.fontWeight(.medium)` — Medium emphasis weight
- `.fontWeight(.semibold)` — Semibold emphasis weight common for headings
- `.fontWeight(.bold)` — Bold emphasis weight
- `.fontWeight(.heavy)` — Heavy stroke weight one step lighter than black
- `.fontWeight(.black)` — Heaviest documented stroke weight

Font.Design (4):
- `.fontDesign(.default)` — SF Pro, the system default sans-serif
- `.fontDesign(.serif)` — New York, the system serif design
- `.fontDesign(.rounded)` — SF Rounded design for friendlier surfaces
- `.fontDesign(.monospaced)` — SF Mono for fixed-width contexts

Reference (3):
- `Font.TextStyle` — Enum surfacing the 11 documented macOS text styles
- `Apple guidance` — Reminders about avoiding ultralight/light at body size and matching SF Symbol weight
- `DynamicTypeSize` — Note that macOS doesn't honor system-wide Dynamic Type

---

## Reference > Color

15 tiles. Source: [`ReferenceColorGalleryPage.swift`](../../../SwiftKit/SwiftKit/Pages/Reference/ReferenceColorGalleryPage.swift).

Hierarchical foreground levels (4):
- `.foregroundStyle(.primary)` — Primary content tone in any context
- `.foregroundStyle(.secondary)` — Muted tone for de-emphasized content
- `.foregroundStyle(.tertiary)` — Further-muted tone below secondary
- `.foregroundStyle(.quaternary)` — Most-muted documented level

Accent and tint (3):
- `.fill(.tint)` — Inherited tint propagating from a parent `.tint(_:)` modifier
- `.fill(Color.accentColor)` — Direct reference to the system accent color
- `.fill(.tint.opacity(0.5))` — Tint with reduced alpha

Surfaces and separators (4):
- `.fill(.background)` — Window-background-aware surface fill
- `Color(nsColor: .controlBackgroundColor)` — AppKit control-background fill
- `Color(nsColor: .windowBackgroundColor)` — AppKit window-background fill
- `Rectangle().fill(.separator)` — Hairline separator color

Color scheme swatches (2):
- `.preferredColorScheme(.light)` — Background swatch in forced light scheme
- `.preferredColorScheme(.dark)` — Background swatch in forced dark scheme

Reference (2):
- `HierarchicalShapeStyle` — `.primary` / `.secondary` / `.tertiary` / `.quaternary` semantic levels
- `Apple guidance` — Avoid hard-coded color values; use Color or NSColor APIs

---

## Reference > Materials

12 tiles. Source: [`MaterialsGalleryPage.swift`](../../../SwiftKit/SwiftKit/Pages/Reference/MaterialsGalleryPage.swift).

Standard Material variants (6):
- `.background(.ultraThinMaterial, in: Capsule())` — Most translucent documented material
- `.background(.thinMaterial, in: Capsule())` — Thin material one step heavier than ultraThin
- `.background(.regularMaterial, in: Capsule())` — Default material weight
- `.background(.thickMaterial, in: Capsule())` — Thick material one step heavier than regular
- `.background(.ultraThickMaterial, in: Capsule())` — Heaviest documented material
- `.background(.bar, in: Capsule())` — Toolbar/sidebar bar-material variant

Liquid Glass — macOS 26 (3):
- `.glassEffect()` — Default Liquid Glass treatment
- `.glassEffect(.regular, in: Capsule())` — Regular Liquid Glass clipped to a Capsule
- `.glassEffect(.regular.interactive())` — Interactive Liquid Glass that responds to hit-state

Reference (3):
- `Material` — Enum surfacing the 6 standard materials as `ShapeStyle`
- `Liquid Glass` — `View.glassEffect(_:in:)` summary, badged macOS 26
- `Apple guidance` — Materials track vibrancy and Dark Mode automatically — don't fake it

---

## Reference > Motion

19 tiles. Source: [`MotionGalleryPage.swift`](../../../SwiftKit/SwiftKit/Pages/Reference/MotionGalleryPage.swift).

Animation curves — tap a tile to play (10):
- `.animation(.default, value:)` — System-default animation curve
- `.animation(.linear, value:)` — Linear timing curve
- `.animation(.easeIn, value:)` — Ease-in curve accelerating into motion
- `.animation(.easeOut, value:)` — Ease-out curve decelerating out of motion
- `.animation(.easeInOut, value:)` — Symmetric ease curve
- `.animation(.spring, value:)` — Default spring physics
- `.animation(.smooth, value:)` — Smooth spring preset with low bounce
- `.animation(.snappy, value:)` — Snappy spring preset with quick settle
- `.animation(.bouncy, value:)` — Bouncy spring preset with overshoot
- `.animation(.interactiveSpring(), value:)` — Spring tuned for follow-the-finger gestures

Transitions — tap a tile to insert/remove (5):
- `.transition(.opacity)` — Cross-fade transition
- `.transition(.scale)` — Scale-in/scale-out transition
- `.transition(.slide)` — Slide-from-edge transition
- `.transition(.move(edge: .top))` — Move-from-edge transition with explicit direction
- `.transition(.asymmetric(insertion: .scale, removal: .opacity))` — Different curves for insert vs remove

Reduce-motion accessibility (1):
- `@Environment(\.accessibilityReduceMotion)` — Capsule that switches to a cross-fade when reduce-motion is on

Reference (3):
- `Animation` — Drives implicit `.animation(_:value:)` and explicit `withAnimation { … }`
- `AnyTransition` — Combine via `.combined(with:)` or split via `.asymmetric(insertion:removal:)`
- `accessibilityReduceMotion` — Read in animation paths to honor system motion preferences

---

## Reference > SF Symbols

21 tiles. Source: [`SFSymbolsGalleryPage.swift`](../../../SwiftKit/SwiftKit/Pages/Reference/SFSymbolsGalleryPage.swift).

Image(systemName:) basics (4):
- `Image(systemName: "heart")` — Outline heart symbol
- `Image(systemName: "star.fill")` — Filled star symbol
- `Image(systemName: "gearshape")` — Gear shape symbol
- `Image(systemName: "person.crop.circle")` — Person silhouette in circle crop

Rendering modes (4):
- `.symbolRenderingMode(.monochrome)` — Single-color rendering
- `.symbolRenderingMode(.hierarchical)` — Hierarchical opacity layers in a single hue
- `.symbolRenderingMode(.palette)` — Per-layer foreground styling via tuple
- `.symbolRenderingMode(.multicolor)` — Symbol's intrinsic multicolor palette

Symbol variants (4):
- `.symbolVariant(.none)` — Force the unfilled outline variant
- `.symbolVariant(.fill)` — Force the filled variant
- `.symbolVariant(.circle)` — Force the circle-enclosed variant
- `.symbolVariant(.slash)` — Force the slash-overlay variant

Weights (4):
- `.fontWeight(.ultraLight)` — Lightest stroke for symbols
- `.fontWeight(.regular)` — Default symbol stroke weight
- `.fontWeight(.bold)` — Bold symbol stroke
- `.fontWeight(.heavy)` — Heavy symbol stroke

Image scale (3):
- `.imageScale(.small)` — Small symbol scale within a Label or text run
- `.imageScale(.medium)` — Medium symbol scale (default)
- `.imageScale(.large)` — Large symbol scale within a Label or text run

Reference (2):
- `SymbolRenderingMode` — `.monochrome` / `.hierarchical` / `.palette` / `.multicolor` enum
- `Apple guidance` — Browse with the SF Symbols app; mind newer-symbol OS-target requirements

---

## Unmapped / needs decision

None for the Reference heading — every tile maps to existing canonical content on disk. Phase 0b orphan-component cross-check items handled here:

- `SymbolEffect`, `SymbolScale` (HIG orphans) — flagged for SF Symbols Phase 3 enrichment, but not promoted to tiles for the MVP scaffold. Add as variant tiles only if they have macOS support; otherwise keep deferred.
- `RequestReviewAction` (HIG orphan) — out of scope for Reference; belongs in SwiftUI > Presentation if anywhere. Routed to the SwiftUI sort agent's deferred list.
- `LinearGradient` (SwiftUI orphan candidate) — already has a documented type-doc; the SwiftUI sort agent will route it. Out of scope here.
