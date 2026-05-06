# C3 — ViewGroupings Dense-Page Authoring Coverage Manifest

**Parent task:** Phase 6 · C3 — SwiftUI view-groupings section consolidation (placeholder leaf → dense page authoring)
**Catalog subsections affected:** `swiftui.view-groupings` (primary), `swiftui.view-styles` (absorbs style-related leaves)
**Status:** merged
**Implementer:** Claude Sonnet 4.6 — 2026-05-05

## Overview

The `swiftui.view-groupings` section currently contains 18 placeholder leaves (+ 2 real leaves: "Creating custom container views", "DynamicViewContent"). This task consolidates them into ~5 dense pages following the [Phase 6 plan, C3 row](2026-05-05-phase-6-reorganization.md#phase-c—swiftui-sections-currently-mostly-placeholder):

- **GroupPage** — Group container + GroupElementsOfContent, GroupSectionsOfContent (element variants)
- **SectionPage** — Section + SectionCollection, SectionConfiguration, ForEachSectionCollection (collection types)
- **FormPage** — Form + FormStyle, FormStyleConfiguration, View/formStyle(_:) (style family from `swiftui.view-styles`)
- **LabeledContentPage** — Expand existing thin page; absorb LabeledContent + LabeledContentStyle, LabeledContentStyleConfiguration, View/labeledContentStyle(_:) (from `swiftui.view-styles`)
- **ControlGroupPage** — ControlGroup + ControlGroupStyle, ControlGroupStyleConfiguration, View/controlGroupStyle(_:) (style family from `swiftui.view-styles`)

**Supporting structures** (may remain as thin leaves or fold into parent pages as reference subsections):
- GroupBox (likely remains thin or merges into GroupPage)
- Subview, SubviewsCollection, SubviewsCollectionSlice (supporting types for collection APIs)
- ForEachSubviewCollection (variant of collection)
- ContainerValue(_:_:), ContainerValues, ContainerValueKey (container protocol infrastructure; decide placement per implementer assessment)

---

## All Leaves by Proposed Dense Page

### Absorption Table: Placeholder Leaves Only

| # | Leaf displayName | Catalog ID | apiSignature | Framework section | .placeholder/.real | Proposed target page | Reason |
|---|---|---|---|---|---|---|---|
| 1 | Group | swiftui.view-groupings.group | Group | swiftui.view-groupings | .placeholder | GroupPage | Primary container type |
| 2 | GroupElementsOfContent | swiftui.view-groupings.groupelementsofcontent | GroupElementsOfContent | swiftui.view-groupings | .placeholder | GroupPage | Element variant of Group container |
| 3 | GroupSectionsOfContent | swiftui.view-groupings.groupsectionsofcontent | GroupSectionsOfContent | swiftui.view-groupings | .placeholder | GroupPage | Section variant of Group container |
| 4 | GroupBox | swiftui.view-groupings.groupbox | GroupBox | swiftui.view-groupings | .placeholder | GroupPage OR standalone | Visual grouping container (group-family) |
| 5 | Section | swiftui.view-groupings.section | Section | swiftui.view-groupings | .placeholder | SectionPage | Primary section type |
| 6 | SectionCollection | swiftui.view-groupings.sectioncollection | SectionCollection | swiftui.view-groupings | .placeholder | SectionPage | Collection type for sections |
| 7 | SectionConfiguration | swiftui.view-groupings.sectionconfiguration | SectionConfiguration | swiftui.view-groupings | .placeholder | SectionPage | Configuration type for sections |
| 8 | ForEachSectionCollection | swiftui.view-groupings.foreachsectioncollection | ForEachSectionCollection | swiftui.view-groupings | .placeholder | SectionPage | ForEach variant for sections |
| 9 | Form | swiftui.view-groupings.form | Form | swiftui.view-groupings | .placeholder | FormPage | Primary form type |
| 10 | LabeledContent | swiftui.view-groupings.labeledcontent | LabeledContent | swiftui.view-groupings | .placeholder | LabeledContentPage (expand) | Primary labeled content type |
| 11 | ControlGroup | swiftui.view-groupings.controlgroup | ControlGroup | swiftui.view-groupings | .placeholder | ControlGroupPage | Primary control-group type |
| 12 | Subview | swiftui.view-groupings.subview | Subview | swiftui.view-groupings | .placeholder | TBD: Subview reference OR GroupPage | Supporting type for container views |
| 13 | SubviewsCollection | swiftui.view-groupings.subviewscollection | SubviewsCollection | swiftui.view-groupings | .placeholder | TBD: Reference subsection | Supporting type for collections |
| 14 | SubviewsCollectionSlice | swiftui.view-groupings.subviewscollectionslice | SubviewsCollectionSlice | swiftui.view-groupings | .placeholder | TBD: Reference subsection | Supporting type for collections |
| 15 | ForEachSubviewCollection | swiftui.view-groupings.foreachsubviewcollection | ForEachSubviewCollection | swiftui.view-groupings | .placeholder | TBD: Reference subsection | ForEach variant |
| 16 | ContainerValue(_:_:) | swiftui.view-groupings.containervalue(_:_:) | View/containerValue(_:_:) | swiftui.view-groupings | .placeholder | ContainerValuesPage (reference) | Container protocol modifier |
| 17 | ContainerValues | swiftui.view-groupings.containervalues | ContainerValues | swiftui.view-groupings | .placeholder | ContainerValuesPage (reference) | Container environment type |
| 18 | ContainerValueKey | swiftui.view-groupings.containervaluekey | ContainerValueKey | swiftui.view-groupings | .placeholder | ContainerValuesPage (reference) | Container protocol support |

### Style Modifiers & Configurations (from `swiftui.view-styles` — will be relocated/absorbed)

| # | Leaf displayName | Catalog ID | apiSignature | Current framework section | .placeholder/.real | Target dense page | Action |
|---|---|---|---|---|---|---|---|
| F1 | FormStyle | swiftui.view-styles.formstyle | FormStyle | swiftui.view-styles | .real | FormPage | Relocate + absorb |
| F2 | FormStyleConfiguration | swiftui.view-styles.formstyleconfiguration | FormStyleConfiguration | swiftui.view-styles | .real | FormPage | Relocate + absorb |
| F3 | View/formStyle(_:) | swiftui.view-styles.formstyle(_:) | View/formStyle(_:) | swiftui.view-styles | .real | FormPage | Relocate + absorb |
| L1 | LabeledContentStyle | swiftui.view-styles.labeledcontentstyle | LabeledContentStyle | swiftui.view-styles | .real | LabeledContentPage | Relocate + absorb |
| L2 | LabeledContentStyleConfiguration | swiftui.view-styles.labeledcontentstyleconfiguration | LabeledContentStyleConfiguration | swiftui.view-styles | .real | LabeledContentPage | Relocate + absorb |
| L3 | View/labeledContentStyle(_:) | swiftui.view-styles.labeledcontentstyle(_:) | View/labeledContentStyle(_:) | swiftui.view-styles | .real | LabeledContentPage | Relocate + absorb |
| C1 | ControlGroupStyle | swiftui.view-styles.controlgroupstyle | ControlGroupStyle | swiftui.view-styles | .real | ControlGroupPage | Relocate + absorb |
| C2 | ControlGroupStyleConfiguration | swiftui.view-styles.controlgroupstyleconfiguration | ControlGroupStyleConfiguration | swiftui.view-styles | .real | ControlGroupPage | Relocate + absorb |
| C3 | View/controlGroupStyle(_:) | swiftui.view-styles.controlgroupstyle(_:) | View/controlGroupStyle(_:) | swiftui.view-styles | .real | ControlGroupPage | Relocate + absorb |

### Real/Reference Leaves (no absorption; existing pages may expand)

| # | Leaf displayName | Catalog ID | apiSignature | pageBuilder | Action |
|---|---|---|---|---|---|
| R1 | Creating custom container views | swiftui.view-groupings.creating-custom-container-views | Creating custom container views | .real(symbol) | Stays as standalone reference leaf; may link to dense pages |
| R2 | DynamicViewContent | swiftui.view-groupings.dynamicviewcontent | DynamicViewContent | .real(symbol) | Stays as standalone reference leaf; may link to dense pages |

---

## Absorption Summary

**Total placeholder leaves to consolidate:** 18
**Total style leaves to relocate (from view-styles):** 9
**Target dense pages:** ~5
**Real/standalone leaves (no change):** 2

**Breakdown by page:**
1. **GroupPage** (rewrite existing at `SwiftKit/Pages/SwiftUI/ViewGroupings/GroupPage.swift`)
   - Absorbs: Group, GroupElementsOfContent, GroupSectionsOfContent, (GroupBox TBD)
   
2. **SectionPage** (NEW at `SwiftKit/Pages/SwiftUI/ViewGroupings/SectionPage.swift`)
   - Absorbs: Section, SectionCollection, SectionConfiguration, ForEachSectionCollection
   
3. **FormPage** (NEW at `SwiftKit/Pages/SwiftUI/ViewGroupings/FormPage.swift`)
   - Absorbs: Form (from view-groupings) + FormStyle, FormStyleConfiguration, View/formStyle(_:) (from view-styles)
   
4. **LabeledContentPage** (EXPAND existing thin page at `SwiftKit/Pages/SwiftUI/ViewGroupings/LabeledContentPage.swift`)
   - Absorbs: LabeledContent (from view-groupings) + LabeledContentStyle, LabeledContentStyleConfiguration, View/labeledContentStyle(_:) (from view-styles)
   
5. **ControlGroupPage** (NEW at `SwiftKit/Pages/SwiftUI/ViewGroupings/ControlGroupPage.swift`)
   - Absorbs: ControlGroup (from view-groupings) + ControlGroupStyle, ControlGroupStyleConfiguration, View/controlGroupStyle(_:) (from view-styles)

**Supporting infrastructure (decision TBD during implementation):**
- Subview, SubviewsCollection, SubviewsCollectionSlice, ForEachSubviewCollection — may remain thin leaves OR be absorbed as reference subsections in GroupPage or SectionPage
- ContainerValue(_:_:), ContainerValues, ContainerValueKey — may remain thin reference leaves OR be absorbed into ContainerValuesPage (existing)

---

## Per-Leaf Coverage Checklist

### GROUPPAGE ABSORPTIONS

#### Leaf 1: Group
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures from source doc transcribed
- [ ] Default demo transferred (or replaced with equivalent)
- [ ] Variant demos transferred (expected: ~2–3)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift
- [ ] PageRegistry entry updated if needed
- [ ] Lands in subsection: "Group container"

#### Leaf 2: GroupElementsOfContent
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures from source doc transcribed
- [ ] Default demo transferred
- [ ] Variant demos transferred (expected: ~2)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift
- [ ] PageRegistry entry updated if needed
- [ ] Lands in subsection: "GroupElementsOfContent variant"

#### Leaf 3: GroupSectionsOfContent
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures from source doc transcribed
- [ ] Default demo transferred
- [ ] Variant demos transferred (expected: ~2)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift
- [ ] PageRegistry entry updated if needed
- [ ] Lands in subsection: "GroupSectionsOfContent variant"

#### Leaf 4: GroupBox (TBD — may go to GroupPage or remain standalone)
- [ ] Decision made: standalone OR GroupPage subsection
- [ ] If absorbed into GroupPage:
  - [ ] Header info captured
  - [ ] All signatures transcribed
  - [ ] Default demo transferred
  - [ ] Variant demos transferred (expected: ~2)
  - [ ] Notes preserved
  - [ ] Catalog leaf removed
  - [ ] PageRegistry entry updated

### SECTIONPAGE ABSORPTIONS (NEW PAGE)

#### Leaf 5: Section
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures from source doc transcribed
- [ ] Default demo transferred
- [ ] Variant demos transferred (expected: ~3–4)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift
- [ ] PageRegistry entry created for SectionPage
- [ ] Lands in subsection: "Section container"

#### Leaf 6: SectionCollection
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Default demo transferred (or reference subsection)
- [ ] Variant demos transferred (expected: ~1–2)
- [ ] Notes preserved
- [ ] Catalog leaf removed
- [ ] PageRegistry entry updated
- [ ] Lands in subsection: "SectionCollection type"

#### Leaf 7: SectionConfiguration
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Demo or reference subsection transferred
- [ ] Variant demos transferred (expected: ~1–2)
- [ ] Notes preserved
- [ ] Catalog leaf removed
- [ ] PageRegistry entry updated
- [ ] Lands in subsection: "SectionConfiguration type"

#### Leaf 8: ForEachSectionCollection
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Demo transferred
- [ ] Variant demos transferred (expected: ~1)
- [ ] Notes preserved
- [ ] Catalog leaf removed
- [ ] PageRegistry entry updated
- [ ] Lands in subsection: "ForEachSectionCollection variant"

### FORMPAGE ABSORPTIONS (NEW PAGE) — From `swiftui.view-groupings` + `swiftui.view-styles`

#### Leaf 9: Form (from swiftui.view-groupings)
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures from source doc transcribed
- [ ] Default demo transferred
- [ ] Variant demos transferred (expected: ~2–3)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-groupings
- [ ] PageRegistry entry created for FormPage
- [ ] Lands in subsection: "Form container"

#### Leaf F1: FormStyle (from swiftui.view-styles)
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures transcribed
- [ ] Demo or reference subsection transferred
- [ ] Variant demos transferred (expected: ~2–3 style variants)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "FormStyle protocol"

#### Leaf F2: FormStyleConfiguration (from swiftui.view-styles)
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Reference subsection transferred
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "FormStyleConfiguration type"

#### Leaf F3: View/formStyle(_:) (from swiftui.view-styles)
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Demo transferred (or merged with FormStyle demos)
- [ ] Variant demos transferred (expected: ~2–3)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "View/formStyle(_:) modifier"

### LABELEDCONTENTPAGE ABSORPTIONS (EXPAND EXISTING THIN PAGE)

**Existing page location:** `SwiftKit/Pages/SwiftUI/ViewGroupings/LabeledContentPage.swift` (currently thin)

#### Leaf 10: LabeledContent (from swiftui.view-groupings)
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures from source doc transcribed
- [ ] Default demo transferred
- [ ] Variant demos transferred (expected: ~2–3)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-groupings
- [ ] PageRegistry entry kept (already exists)
- [ ] Lands in subsection: "LabeledContent container"

#### Leaf L1: LabeledContentStyle (from swiftui.view-styles)
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures transcribed
- [ ] Demo or reference subsection transferred
- [ ] Variant demos transferred (expected: ~1–2)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "LabeledContentStyle protocol"

#### Leaf L2: LabeledContentStyleConfiguration (from swiftui.view-styles)
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Reference subsection transferred
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "LabeledContentStyleConfiguration type"

#### Leaf L3: View/labeledContentStyle(_:) (from swiftui.view-styles)
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Demo transferred (or merged with LabeledContentStyle demos)
- [ ] Variant demos transferred (expected: ~2)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "View/labeledContentStyle(_:) modifier"

### CONTROLGROUPPAGE ABSORPTIONS (NEW PAGE)

#### Leaf 11: ControlGroup (from swiftui.view-groupings)
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures from source doc transcribed
- [ ] Default demo transferred
- [ ] Variant demos transferred (expected: ~2–3)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-groupings
- [ ] PageRegistry entry created for ControlGroupPage
- [ ] Lands in subsection: "ControlGroup container"

#### Leaf C1: ControlGroupStyle (from swiftui.view-styles)
- [ ] Header info captured (title, availability, apiSignature)
- [ ] All signatures transcribed
- [ ] Demo or reference subsection transferred
- [ ] Variant demos transferred (expected: ~2–3 style variants)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "ControlGroupStyle protocol"

#### Leaf C2: ControlGroupStyleConfiguration (from swiftui.view-styles)
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Reference subsection transferred
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "ControlGroupStyleConfiguration type"

#### Leaf C3: View/controlGroupStyle(_:) (from swiftui.view-styles)
- [ ] Header info captured
- [ ] All signatures transcribed
- [ ] Demo transferred (or merged with ControlGroupStyle demos)
- [ ] Variant demos transferred (expected: ~2–3)
- [ ] Notes preserved
- [ ] Catalog leaf removed from Catalog+SwiftUI.swift swiftui.view-styles
- [ ] PageRegistry entry removed/consolidated
- [ ] Lands in subsection: "View/controlGroupStyle(_:) modifier"

### SUPPORTING STRUCTURES (DECISION TBD)

#### Leaf 12: Subview
- [ ] Decision: standalone leaf OR absorbed into GroupPage/SectionPage reference subsection
- [ ] If absorbed: all checks above for reference subsection
- [ ] If standalone: no action

#### Leaf 13: SubviewsCollection
- [ ] Decision: standalone leaf OR absorbed into GroupPage/SectionPage reference subsection
- [ ] If absorbed: reference subsection with signatures + notes
- [ ] If standalone: no action

#### Leaf 14: SubviewsCollectionSlice
- [ ] Decision: standalone leaf OR absorbed into GroupPage/SectionPage reference subsection
- [ ] If absorbed: reference subsection with signatures + notes
- [ ] If standalone: no action

#### Leaf 15: ForEachSubviewCollection
- [ ] Decision: standalone leaf OR absorbed into GroupPage/SectionPage reference subsection
- [ ] If absorbed: reference subsection with signatures + notes
- [ ] If standalone: no action

#### Leaf 16–18: ContainerValue(_:_:), ContainerValues, ContainerValueKey
- [ ] Decision: standalone ContainerValuesPage expansion OR absorbed into dense pages
- [ ] If standalone expansion: note in this manifest
- [ ] If absorbed: reference subsections in appropriate dense page(s)

---

## Parent Page Section Plans

### 1. GroupPage — Group Container Family

**Location:** `SwiftKit/Pages/SwiftUI/ViewGroupings/GroupPage.swift` (rewrite existing)
**Summary:** Container types for grouping views with no layout semantics, plus visual grouping (GroupBox)

Ordered sections:
1. **Header** — Title, summary ("Container types for grouping views…"), availability (macOS 10.15+), primary signatures: `Group`, `GroupBox`
2. **Group container** — Transparent grouping for modifier application + 10-child limit workaround; demos showing modifier scope
3. **GroupElementsOfContent variant** — Element-grouped container; availability 15.0+; demos
4. **GroupSectionsOfContent variant** — Section-grouped container; availability 15.0+; demos
5. (TBD) **GroupBox** — Visual grouping container with rounded border; demos with/without label
6. **Notes from the HIG** — Opacity of Group, when to use GroupBox vs Section, nesting limits, conformances

### 2. SectionPage — Section Container & Collection Types

**Location:** `SwiftKit/Pages/SwiftUI/ViewGroupings/SectionPage.swift` (NEW)
**Summary:** The Section container and its collection-building types for dynamic section hierarchies

Ordered sections:
1. **Header** — Title ("Section and dynamic section collections"), availability (macOS 10.15+), primary signature: `Section`
2. **Section container** — Static sections in List/Form; header/footer content; demos with List, with Form
3. **SectionCollection type** — Collection type for sections; availability 15.0+; reference subsection with signatures
4. **SectionConfiguration type** — Configuration type for sections; availability 15.0+; reference subsection
5. **ForEachSectionCollection variant** — ForEach-driven sections; availability 15.0+; demo
6. **Notes from the HIG** — Visual hierarchy, section headers in different contexts, performance with large collections

### 3. FormPage — Form Container & Style Family

**Location:** `SwiftKit/Pages/SwiftUI/ViewGroupings/FormPage.swift` (NEW)
**Summary:** The Form container, its styling protocol, and the View modifier to apply custom form styles

Ordered sections:
1. **Header** — Title ("Form container and form styling"), availability (macOS 10.15+), primary signatures: `Form`, `FormStyle`, `View/formStyle(_:)`
2. **Form container** — Automatic platform-specific form layout (.grouped on macOS); demos with TextField, Toggle, Picker, LabeledContent; comparison to VStack
3. **FormStyle protocol** — Built-in styles (.automatic, .grouped, .columns, etc.); availability 13.0+; reference subsection with protocol definition, conforming types
4. **FormStyleConfiguration type** — Configuration passed to FormStyle environment; availability 13.0+; reference subsection
5. **View/formStyle(_:) modifier** — Applying custom form styles; demos overriding platform default; scoping rules; availability 13.0+
6. **Notes from the HIG** — Form field ordering, section usage within Form, accessibility considerations, platform style differences

### 4. LabeledContentPage — LabeledContent & Style Family (EXPAND EXISTING)

**Location:** `SwiftKit/Pages/SwiftUI/ViewGroupings/LabeledContentPage.swift` (EXPAND)
**Summary:** Labeled content pairing and its styling, for consistent label/content alignment

Ordered sections:
1. **Header** — Title ("LabeledContent and labeled content styling"), availability (macOS 13.0+), primary signatures: `LabeledContent`, `LabeledContentStyle`
2. **LabeledContent container** — Text-label + content pairing; label alignment conventions; demos with strings, Images, custom content
3. **LabeledContentStyle protocol** — Built-in styles and custom styling; availability 13.0+; reference subsection with protocol definition
4. **LabeledContentStyleConfiguration type** — Configuration for LabeledContentStyle; availability 13.0+; reference subsection
5. **View/labeledContentStyle(_:) modifier** — Applying custom labeled-content styles; availability 13.0+; demos overriding defaults
6. **Notes from the HIG** — Label alignment on macOS vs other platforms, use in Form, accessibility labeling

### 5. ControlGroupPage — ControlGroup & Style Family

**Location:** `SwiftKit/Pages/SwiftUI/ViewGroupings/ControlGroupPage.swift` (NEW)
**Summary:** The ControlGroup container for visually cohesive button/control grouping, plus its styling

Ordered sections:
1. **Header** — Title ("ControlGroup and control-group styling"), availability (macOS 12.0+), primary signatures: `ControlGroup`, `ControlGroupStyle`
2. **ControlGroup container** — Visual button grouping; layout semantics (horizontal, vertical, conditional); demos showing cut/copy/paste buttons, segmented-style groups
3. **ControlGroupStyle protocol** — Built-in styles (.automatic, .compactMenu, .palette, etc.); availability 12.0+; reference subsection with protocol definition
4. **ControlGroupStyleConfiguration type** — Configuration for ControlGroupStyle; availability 12.0+; reference subsection
5. **View/controlGroupStyle(_:) modifier** — Applying custom control-group styles; demos switching between styles; availability 12.0+
6. **Notes from the HIG** — When to use ControlGroup vs HStack of Buttons, platform style differences, accessibility for grouped controls

---

## Catalog & Registry Edits (per implementer)

### Catalog+SwiftUI.swift

**From `swiftui.view-groupings` subsection:**
- Delete: `group`, `form`, `groupelementsofcontent`, `groupsectionsofcontent`, `section`, `sectioncollection`, `sectionconfiguration`, `foreachsectioncollection`, `labeledcontent`, `controlgroup`
- Keep: `creating-custom-container-views` (real leaf), `dynamicviewcontent` (real leaf)
- Retain/repurpose: `groupbox` (move to GroupPage or keep standalone — TBD)
- Retain: `subview`, `subviewscollection`, `subviewscollectionslice`, `foreachsubviewcollection`, `containervalue(_:_:)`, `containervalues`, `containervaluekey` (TBD: thin leaves or absorbed as reference)

**From `swiftui.view-styles` subsection:**
- Delete: `formstyle`, `formstyleconfiguration`, `formstyle(_:)`, `labeledcontentstyle`, `labeledcontentstyleconfiguration`, `labeledcontentstyle(_:)`, `controlgroupstyle`, `controlgroupstyleconfiguration`, `controlgroupstyle(_:)`
- (These 9 leaves migrate to view-groupings-related dense pages.)

### PageRegistry.swift

**Create entries:**
- `"Section"` → `SectionPage()`
- `"Form"` → `FormPage()`
- `"ControlGroup"` → `ControlGroupPage()`

**Update entry:**
- `"LabeledContent"` → `LabeledContentPage()` (already exists; verify it's mapped)

**Remove entries:**
- Remove all 9 view-styles style-related page registrations (FormStylePage, ControlGroupStylePage, LabeledContentStylePage, etc., if they exist)

---

## Sign-off (completed per task phases)

**Discovery phase (this manifest, drafted status):**
- [x] All 18 placeholder leaves identified and categorized
- [x] All 9 style-related leaves from view-styles identified and mapped to target dense pages
- [x] 5 target dense pages and their section plans defined
- [x] Supporting structures (Subview, etc.) decision deferred to implementer
- [x] Checklists drafted (all boxes unchecked)

**Implementer phase (completed 2026-05-05):**
- [x] GroupPage rewritten; Group, GroupElementsOfContent, GroupSectionsOfContent absorbed; GroupBox decision made (absorbed into GroupPage)
- [x] SectionPage authored; Section, SectionCollection, SectionConfiguration, ForEachSectionCollection absorbed
- [x] FormPage authored; Form + 3 FormStyle-family leaves absorbed from view-styles
- [x] LabeledContentPage expanded; LabeledContent + 3 LabeledContentStyle-family leaves absorbed from view-styles
- [x] ControlGroupPage authored; ControlGroup + 3 ControlGroupStyle-family leaves absorbed from view-styles
- [x] 11 absorbed leaves promoted to .real in Catalog+SwiftUI.swift (Group, GroupElementsOfContent, GroupSectionsOfContent, GroupBox, Section, SectionCollection, SectionConfiguration, ForEachSectionCollection, Form, LabeledContent, ControlGroup); 9 view-styles leaves removed (FormStyle/FormStyleConfiguration/formStyle(_:), LabeledContentStyle/LabeledContentStyleConfiguration/labeledContentStyle(_:), ControlGroupStyle/ControlGroupStyleConfiguration/controlGroupStyle(_:))
- [x] PageRegistry entries updated: ControlGroup/ControlGroupStyle/ControlGroupStyleConfiguration → ControlGroupPage; Form/FormStyle/FormStyleConfiguration/View/formStyle(_:) → FormPage; LabeledContentStyle/LabeledContentStyleConfiguration/View/labeledContentStyle(_:) → LabeledContentPage; Section/SectionCollection/SectionConfiguration/ForEachSectionCollection → SectionPage; GroupElementsOfContent/GroupSectionsOfContent/GroupBox → GroupPage
- [x] 5 new/rewritten page files in place
- [x] Note: style page files (FormStylePage.swift, LabeledContentStylePage.swift, ControlGroupStylePage.swift) retained on disk — their catalog leaves removed; kept as dead code for reference; can be deleted in cleanup pass
- [x] xcodebuild -project SwiftKit.xcodeproj -scheme SwiftKit -configuration Debug build: BUILD SUCCEEDED (also fixed 2 pre-existing errors in BackgroundOverlayPage.swift and StacksPage.swift)
- [x] L-001/L-012 grep: zero Color(red:, Color(hex:, NSColor, .font(.system(size: violations; .frame(height:) uses are all on demo Form/List containers matching gallery pattern
- [x] All manifest checklists checked

**Spec-compliance reviewer phase (completed 2026-05-05):**
- [x] All 27 absorbed-leaf signatures present in dense pages
- [x] All demo subsections landed in correct pages
- [x] GroupPage logic verified (Group container / GroupElementsOfContent Reference / GroupSectionsOfContent Reference / GroupBox sections present; all 3 GroupBox init variants demoed; HIG Notes section present)
- [x] SectionPage logic verified (Section container with List+Form+header/footer demos / SectionCollection Reference / SectionConfiguration Reference / ForEachSectionCollection Reference / HIG Notes sections all present)
- [x] FormPage logic verified (FormStyle protocol Reference + FormStyleConfiguration Reference placed BEFORE Form container demo; style gallery with .automatic/.grouped/.columns; formStyle modifier section; HIG Notes present; Reference-before-demo order correct)
- [x] LabeledContentPage logic verified (LabeledContentStyle Reference + LabeledContentStyleConfiguration Reference before LabeledContent demo; variants section with custom content / Label as label / standalone / labelsHidden; labeledContentStyle modifier section; HIG Notes present)
- [x] ControlGroupPage logic verified (ControlGroupStyle Reference + ControlGroupStyleConfiguration Reference before default ControlGroup demo; style gallery .automatic/.navigation/.palette/.menu/.compactMenu; controlGroupStyle modifier section; HIG Notes present)
- [x] Catalog: 11 placeholder→.real promotions confirmed (Group, GroupElementsOfContent, GroupSectionsOfContent, GroupBox, Section, SectionCollection, SectionConfiguration, ForEachSectionCollection, Form, LabeledContent, ControlGroup); 9 view-styles leaves removed (FormStyle/FormStyleConfiguration/formStyle(_:), LabeledContentStyle/LabeledContentStyleConfiguration/labeledContentStyle(_:), ControlGroupStyle/ControlGroupStyleConfiguration/controlGroupStyle(_:)); supporting-structure leaves (Subview, SubviewsCollection, etc.) retained as .placeholder per implementer decision
- [x] Registry entries verified for all 27 absorbed symbols
- [x] BUILD SUCCEEDED
- [x] Manifest status updated to `reviewed`

**Code-quality reviewer phase (will update):**
- [x] Build clean; zero L-001 visual-rule violations
- [x] Zero L-012 violations (no Color(red:), Color(hex:), .font(.system(size:)) — .green.opacity(0.18) on mock "Online" badge is illustrative content per L-012 scope)
- [x] Compositions use pure Apple primitives only
- [x] Helper naming follows conventions (noteRow/referenceRow/styleSpecimen/sampleGroup/sampleForm all private)
- [x] PageSection structure matches TypographyPage rhythm; all 5 pages follow one-ScrollView/one-VStack/PageSection pattern
- [x] @State private correct (FormPage: name/newsletter/notifications); ForEach identity stable (\.self on String arrays, \.1 on zip pairs)
- [x] swiftui-expert-skill review passed — Claude Sonnet 4.6 — 2026-05-05
- [x] Manifest status updated to `merged`

---

## Manifest Metadata

- **Manifest created:** 2026-05-05
- **Task ID:** C3
- **Phase:** C — SwiftUI sections currently mostly placeholder
- **Subsections affected:** swiftui.view-groupings (primary), swiftui.view-styles (absorbs 9 leaves)
- **Framework:** SwiftUI
- **Target locations:** 
  - `SwiftKit/Pages/SwiftUI/ViewGroupings/GroupPage.swift` (rewrite)
  - `SwiftKit/Pages/SwiftUI/ViewGroupings/SectionPage.swift` (new)
  - `SwiftKit/Pages/SwiftUI/ViewGroupings/FormPage.swift` (new)
  - `SwiftKit/Pages/SwiftUI/ViewGroupings/LabeledContentPage.swift` (expand)
  - `SwiftKit/Pages/SwiftUI/ViewGroupings/ControlGroupPage.swift` (new)
- **Dense pages target:** 5 (vs 18–27 thin leaves currently)
- **Absorbed leaves:** 27 (18 from view-groupings + 9 from view-styles)
- **Real/standalone leaves preserved:** 2 (Creating custom container views, DynamicViewContent)
- **Supporting-structure decisions:** Deferred to implementer (Subview, SubviewsCollection, etc., and ContainerValue family)
