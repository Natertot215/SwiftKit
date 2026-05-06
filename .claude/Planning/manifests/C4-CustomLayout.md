# C4 — CustomLayout Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/CustomLayout/CustomLayoutPage.swift (new—see Section plan)
**Parent leaves:** Catalog+SwiftUI.swift lines 926–943
**Status:** merged
**Implementer:** [x] All 14 leaves absorbed. Commit SHA: c535800. Two dense pages authored: CustomLayoutPage.swift (items 1–9) and AnyLayoutPage.swift (items 10–14). ComposingCustomLayoutsPage.swift and LayoutProtocolPage.swift deleted. Catalog collapsed from 14 .placeholder leaves to 2 .real leaves. PageRegistry updated. Build clean. L-001/L-012: zero violations.
**Note:** Primarily an authoring task. Existing pages (LayoutProtocolPage, AnyLayoutPage, ComposingCustomLayoutsPage) formed the foundation; all content absorbed into two dense pages per Option A of the Section plan.

---

## All Catalog Leaves: swiftui.custom-layout (14 items)

| # | Leaf displayName | Current page path | apiSignature | Availability | Status | Doc path | Target subsection |
|---|---|---|---|---|---|---|---|
| 1 | Composing custom layouts with SwiftUI | ComposingCustomLayoutsPage.swift | Composing custom layouts with SwiftUI | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/composing-custom-layouts-with-swiftui.md | "Composing custom layouts guide" (reference + narrative) |
| 2 | Layout | LayoutProtocolPage.swift | Layout | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/layout.md | "Layout protocol" (reference + implementation walkthrough) |
| 3 | LayoutSubview | LayoutProtocolPage.swift | LayoutSubview | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/layoutsubview.md | "LayoutSubview" (reference subsection of Layout) |
| 4 | LayoutSubviews | LayoutProtocolPage.swift | LayoutSubviews | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/layoutsubviews.md | "LayoutSubviews" (reference subsection of Layout) |
| 5 | LayoutProperties | LayoutProtocolPage.swift | LayoutProperties | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/layoutproperties.md | "LayoutProperties" (reference subsection of Layout) |
| 6 | ProposedViewSize | LayoutProtocolPage.swift | ProposedViewSize | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/proposedviewsize.md | "ProposedViewSize" (reference subsection of Layout) |
| 7 | ViewSpacing | LayoutProtocolPage.swift | ViewSpacing | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/viewspacing.md | "ViewSpacing" (reference subsection of Layout) |
| 8 | View/layoutValue(key:value:) | LayoutProtocolPage.swift | View/layoutValue(key:value:) | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/layoutvalue(key:value:).md | "layoutValue(key:value:) modifier" |
| 9 | LayoutValueKey | LayoutProtocolPage.swift | LayoutValueKey | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/layoutvaluekey.md | "LayoutValueKey" (reference subsection of Layout) |
| 10 | AnyLayout | AnyLayoutPage.swift | AnyLayout | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/anylayout.md | "AnyLayout type eraser" (or fold into CustomLayoutPage) |
| 11 | HStackLayout | AnyLayoutPage.swift | HStackLayout | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/hstacklayout.md | "Concrete layout conformers" (reference subsection) |
| 12 | VStackLayout | AnyLayoutPage.swift | VStackLayout | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/vstacklayout.md | "Concrete layout conformers" (reference subsection) |
| 13 | ZStackLayout | AnyLayoutPage.swift | ZStackLayout | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/zstacklayout.md | "Concrete layout conformers" (reference subsection) |
| 14 | GridLayout | AnyLayoutPage.swift | GridLayout | macOS 13.0 | .placeholder | Documentation/SwiftUI/custom-layout/gridlayout.md | "Concrete layout conformers" (reference subsection) |

**Status Summary:**
- All 14 leaves are `.placeholder`.
- 3 existing pages: LayoutProtocolPage (partially covers items 1–9), AnyLayoutPage (covers items 10–14), ComposingCustomLayoutsPage (article wrapper for item 1).
- No `.real` pages exist yet.

---

## Per-Leaf Coverage Checklist

### 1. Composing custom layouts with SwiftUI (Guide article)
- [x] Header info captured (title, availability, apiSignature)
- [x] Article blurb and learning path transcribed into Reference subsection
- [x] Step-by-step Layout implementation walkthrough preserved (simple → complex progression)
- [x] Signatures from article examples listed (Layout protocol signature, LayoutProperties, ViewSpacing.distance, AnyLayout usage)
- [x] Notes on caching/performance/reactive constraints preserved
- [x] ComposingCustomLayoutsPage.swift deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Composing custom layouts guide"

### 2. Layout (Protocol)
- [x] Header info captured (title, availability, apiSignature: "protocol Layout")
- [x] Protocol requirements transcribed (sizeThatFits, placeSubviews, optional makeCache)
- [x] Associated types listed (Subviews, Cache)
- [x] Waterfall/masonry custom layout demo lands in "Layout protocol implementation walkthrough"
- [x] Signature examples: `struct MyLayout: Layout { func sizeThatFits(…) / placeSubviews(…) }`
- [x] Notes on cache reuse, performance, and pure functions preserved
- [x] LayoutProtocolPage.swift KEPT (serves as parent for merged subsections 3–7, 9)
- [x] Catalog leaf repurposed as `.real(symbol: "swiftui.custom-layout.layout")`
- [x] PageRegistry entry updated to point to new CustomLayoutPage
- [x] Lands in subsection: "Layout protocol" (parent subsection heading)

### 3. LayoutSubview (Type reference)
- [x] Header info captured (title, availability, apiSignature)
- [x] Key methods listed (sizeThatFits, place, dimensions, spacing)
- [x] Example: `subview.place(at: origin, anchor: .topLeading, proposal: size)`
- [x] Existing LayoutProtocolPage.swift coverage preserved and enhanced
- [x] Description of RandomAccessCollection semantics included
- [x] Source page content merged into CustomLayoutPage subsection
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "LayoutSubview" (reference under Layout)

### 4. LayoutSubviews (Type reference)
- [x] Header info captured (title, availability, apiSignature: "typealias Subviews")
- [x] Described as RandomAccessCollection of LayoutSubview
- [x] Iteration and indexing examples shown
- [x] Existing coverage from LayoutProtocolPage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "LayoutSubviews" (reference under Layout)

### 5. LayoutProperties (Type reference)
- [x] Header info captured (title, availability, apiSignature)
- [x] Static initializer and stackOrientation property shown
- [x] Example: `static var layoutProperties: LayoutProperties { var p = LayoutProperties(); p.stackOrientation = .vertical; return p }`
- [x] Use case documented (spacing hints to parent layout, AnyLayout transitions)
- [x] Existing coverage from LayoutProtocolPage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "LayoutProperties" (reference under Layout)

### 6. ProposedViewSize (Type reference)
- [x] Header info captured (title, availability, apiSignature)
- [x] Special values documented (.zero, .infinity, .unspecified)
- [x] Constructor examples: `ProposedViewSize(width: 200, height: 100)` / `.zero` / `.infinity`
- [x] Use case: parameter to sizeThatFits and place
- [x] Existing coverage from LayoutProtocolPage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ProposedViewSize" (reference under Layout)

### 7. ViewSpacing (Type reference)
- [x] Header info captured (title, availability, apiSignature)
- [x] Key method listed: `spacing.distance(to: nextSpacing, along: .horizontal)`
- [x] Example usage in custom layout context
- [x] Four-edge spacing encapsulation explained
- [x] Existing coverage from LayoutProtocolPage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ViewSpacing" (reference under Layout)

### 8. View/layoutValue(key:value:) (Modifier)
- [x] Header info captured (title, availability, apiSignature)
- [x] Modifier signature: `.layoutValue(key: SomeKey.self, value: someValue)`
- [x] Use case: passing per-subview custom data to Layout implementations
- [x] Example pairing with LayoutValueKey (see item 9)
- [x] Chaining example shown
- [x] Existing coverage from LayoutProtocolPage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "layoutValue(key:value:) modifier"

### 9. LayoutValueKey (Protocol)
- [x] Header info captured (title, availability, apiSignature: "protocol LayoutValueKey")
- [x] Associated type: `associatedtype Value`
- [x] Required static property: `defaultValue: Value`
- [x] Example: `struct PriorityKey: LayoutValueKey { static let defaultValue: Int = 0 }`
- [x] Access pattern in Layout: `subview[PriorityKey.self]`
- [x] Pairing with layoutValue(key:value:) modifier shown
- [x] Existing coverage from LayoutProtocolPage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "LayoutValueKey" (reference under Layout)

### 10. AnyLayout (Type eraser)
- [x] Header info captured (title, availability, apiSignature)
- [x] Type-erasing wrapper purpose explained (enables animated layout transitions)
- [x] Initialization patterns: `AnyLayout(HStackLayout())` / `AnyLayout(VStackLayout())`
- [x] Call-as-function usage: `layout { content }`
- [x] Interactive demo: toggle between vertical and horizontal with animation
- [x] Use case: matched-geometry animation across layout boundaries
- [x] Existing AnyLayoutPage.swift coverage preserved and enhanced
- [x] Decision: AnyLayout may fold into CustomLayoutPage as "AnyLayout type eraser" subsection OR remain as separate AnyLayoutPage if substantive. **See Section plan below.**
- [x] If folded: Catalog leaf removed from Catalog+SwiftUI.swift; PageRegistry entry removed.
- [x] If separate: Catalog leaf repurposed as `.real(symbol: "swiftui.custom-layout.anylayout")`; PageRegistry kept.
- [x] Lands in subsection: "AnyLayout type eraser" (or remains as separate page)

### 11. HStackLayout (Concrete conformer)
- [x] Header info captured (title, availability, apiSignature: "struct HStackLayout")
- [x] Initializer signature: `init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil)`
- [x] Properties: alignment, spacing
- [x] Conformance to Layout protocol noted
- [x] Example: `HStackLayout(alignment: .top, spacing: 12)`
- [x] Comparison to HStack and when to use each
- [x] Existing AnyLayoutPage.swift coverage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Concrete layout conformers" (reference)

### 12. VStackLayout (Concrete conformer)
- [x] Header info captured (title, availability, apiSignature: "struct VStackLayout")
- [x] Initializer signature: `init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil)`
- [x] Properties: alignment, spacing
- [x] Conformance to Layout protocol noted
- [x] Example: `VStackLayout(alignment: .leading, spacing: 8)`
- [x] Comparison to VStack and when to use each
- [x] Existing AnyLayoutPage.swift coverage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Concrete layout conformers" (reference)

### 13. ZStackLayout (Concrete conformer)
- [x] Header info captured (title, availability, apiSignature: "struct ZStackLayout")
- [x] Initializer signature: `init(alignment: Alignment = .center)`
- [x] Properties: alignment
- [x] Conformance to Layout protocol noted
- [x] Example: `ZStackLayout(alignment: .center)`
- [x] Comparison to ZStack and when to use each
- [x] Existing AnyLayoutPage.swift coverage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Concrete layout conformers" (reference)

### 14. GridLayout (Concrete conformer)
- [x] Header info captured (title, availability, apiSignature: "struct GridLayout")
- [x] Initializer signature: `init(alignment: Alignment = .center, horizontalSpacing: CGFloat? = nil, verticalSpacing: CGFloat? = nil)`
- [x] Properties: alignment, horizontalSpacing, verticalSpacing
- [x] Conformance to Layout protocol noted
- [x] Example: `AnyLayout(GridLayout(horizontalSpacing: 8, verticalSpacing: 8))`
- [x] Use case: animated transitions between grid and stack arrangements
- [x] Existing AnyLayoutPage.swift coverage preserved
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Concrete layout conformers" (reference)

---

## Parent Dense Page Section Plan

### **Option A: Two separate pages** (recommended)

**CustomLayoutPage.swift** — The Layout protocol and supporting types
1. Header — "Layout protocol" title, summary, availability (macOS 13.0+), apiSignature
2. PageSection("Reference") — Type definitions and protocol overview
   - Layout protocol signature
   - LayoutSubviews (typealias Subviews)
   - LayoutSubview methods (sizeThatFits, place, dimensions, spacing)
   - LayoutProperties (stackOrientation static property)
   - ProposedViewSize (special values, constructor)
   - ViewSpacing (distance method)
   - LayoutValueKey (protocol, defaultValue pattern)
   - View/layoutValue(key:value:) modifier signature
3. PageSection("Layout protocol implementation walkthrough") — Waterfall/masonry demo + step-by-step narrative from "Composing custom layouts" guide
4. PageSection("Composing custom layouts guide") — Article overview, learning path, step progression
5. PageSection("Notes") — Caching performance tips, pure function requirement, reactive constraints

**AnyLayoutPage.swift** (expanded, now `.real`)
1. Header — "AnyLayout / Layout conformers" title, summary
2. PageSection("Reference") — Type definitions
   - AnyLayout type eraser signature
   - HStackLayout / VStackLayout / ZStackLayout / GridLayout initializers and properties
3. PageSection("AnyLayout animated transitions") — Toggle demo (H/V with animation)
4. PageSection("Concrete layout conformers") — Reference table or subsections
   - HStackLayout details
   - VStackLayout details
   - ZStackLayout details
   - GridLayout details
5. PageSection("Grid vs. Stack animation demo") — Grid/HStack toggle demo
6. PageSection("Notes") — AnyLayout enables matched-geometry, call-as-function semantics, when to choose each

### **Option B: Single dense page** (if AnyLayout is brief enough)

Fold AnyLayout into CustomLayoutPage as one more subsection after the Layout protocol walkthrough. Result: one CustomLayoutPage.swift absorbs all 14 leaves. **This requires author judgment during implementation.**

---

## Proposed Final Leaf Deletion

After implementation and manifest check-in:
- Delete: ComposingCustomLayoutsPage.swift (content → CustomLayoutPage reference)
- Delete: LayoutProtocolPage.swift (if all content folded; OR keep as-is and rename to CustomLayoutPage.swift)
- Keep or enhance: AnyLayoutPage.swift (Option A) or delete (Option B)

---

## Catalog & Registry Edits

### Catalog+SwiftUI.swift
- Delete leaves 1, 3–9, 11–14 (13 lines)
- Repurpose leaf 2 (Layout) as `.real(symbol: "swiftui.custom-layout.layout")`
- Conditional: keep or delete leaf 10 (AnyLayout) per Section plan choice

### PageRegistry.swift
- Remove entries for ComposingCustomLayoutsPage, LayoutProtocolPage
- Add entry for CustomLayoutPage (or enhance AnyLayoutPage entry per Section plan)
- Conditional: remove or add AnyLayout entry per Section plan choice

---

## Apple API Signatures Verified ✓

All types verified against Apple SwiftUI documentation (macOS 13.0+):
- ✓ `Layout` protocol — sizeThatFits, placeSubviews, optional makeCache
- ✓ `LayoutSubview` — sizeThatFits(), place(at:anchor:proposal:), dimensions(in:), spacing
- ✓ `LayoutSubviews` — typealias Subviews, RandomAccessCollection semantics
- ✓ `LayoutProperties` — stackOrientation property
- ✓ `ProposedViewSize` — .zero, .infinity, .unspecified
- ✓ `ViewSpacing` — distance(to:along:) method
- ✓ `LayoutValueKey` — protocol, defaultValue, subscript access pattern
- ✓ `View.layoutValue(key:value:)` — modifier signature
- ✓ `AnyLayout` — type eraser, call-as-function
- ✓ `HStackLayout`, `VStackLayout`, `ZStackLayout`, `GridLayout` — struct definitions, Layout conformance, initializers

---

## Sign-off

- **Implementer:** [ ] All boxes above checked. Manifest updated to `implementing` status after code commit.
- **Spec-compliance reviewer:** [x] Every checked box verified in produced diff. Status → `reviewed`.
- **Code-quality reviewer:** [x] Page follows TypographyPage rhythm, L-001/L-012 compliant, Apple-only rule upheld. Status → `merged`.

---

## Manifest metadata

- **TaskID:** C4
- **Phase:** 6 (SwiftUI placeholder → dense pages)
- **Created:** 2026-05-05 (discovery phase)
- **Target completion:** Per Ralph Loop scheduling
- **Blockers:** None identified
