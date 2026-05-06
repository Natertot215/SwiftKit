# B7 — TextPage / TextFieldPage / TextEditorPage Coverage Manifest

**Parent pages:**
- SwiftKit/Pages/SwiftUI/TextInputAndOutput/TextPage.swift
- SwiftKit/Pages/SwiftUI/TextInputAndOutput/TextFieldPage.swift
- SwiftKit/Pages/SwiftUI/TextInputAndOutput/TextEditorPage.swift

**Parent leaves (Catalog+SwiftUI.swift):**
- TextPage: line 568, symbol `swiftui.text-input-and-output.text`
- TextField: line 571, symbol `swiftui.text-input-and-output.textfield`
- TextEditor: line 573, symbol `swiftui.text-input-and-output.texteditor`

**Absorbed style-related leaves (Catalog+SwiftUI.swift):**
- TextFieldStyle: line 448 — DELETED
- View/textFieldStyle(_:): line 447 — DELETED
- TextEditorStyle: line 450 — DELETED
- View/textEditorStyle(_:): line 449 — DELETED
- TextEditorStyleConfiguration: line 451 — DELETED

**Absorbed page files:**
- SwiftKit/Pages/SwiftUI/TextFieldStylePage.swift — DELETED
- SwiftKit/Pages/SwiftUI/TextEditorStylePage.swift — DELETED

**Status:** implementing

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | availability | Page type | Consolidates into |
|---|---|---|---|---|---|---|
| 1 | TextFieldStyle | TextFieldStylePage.swift | TextFieldStyle | macOS 10.15 | real | TextFieldPage "Reference" |
| 2 | View/textFieldStyle(_:) | TextFieldStylePage.swift | View/textFieldStyle(_:) | macOS 10.15 | real | TextFieldPage "Styling" |
| 3 | TextEditorStyle | TextEditorStylePage.swift | TextEditorStyle | macOS 14.0 | real | TextEditorPage "Reference" |
| 4 | View/textEditorStyle(_:) | TextEditorStylePage.swift | View/textEditorStyle(_:) | macOS 14.0 | real | TextEditorPage "Styling" |
| 5 | TextEditorStyleConfiguration | TextEditorStylePage.swift | TextEditorStyleConfiguration | macOS 14.0 | real | TextEditorPage "Reference" |

## Per-leaf coverage checklist

### TextFieldStyle (Catalog line 448)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from TextFieldStylePage.swift transcribed
- [x] Marker protocol documentation preserved
- [x] Notes: "TextFieldStyle is a marker protocol; required methods are SPI"
- [x] Source page file deleted
- [x] Catalog leaf removed
- [x] PageRegistry entries removed
- [x] No child elements absorbed
- [x] Lands in subsection: "TextFieldStyle (Reference)"
- [x] Marked as merged

### View/textFieldStyle(_:) (Catalog line 447)
- [x] Header info captured
- [x] All overload signatures transcribed
- [x] Default demo (.automatic) transferred
- [x] Variant demos transferred (4 styles: automatic, roundedBorder, squareBorder, plain)
- [x] States demos transferred (disabled propagation)
- [x] Notes paragraphs preserved (5 notes from TextFieldStylePage)
- [x] Source page deleted
- [x] Catalog leaf removed
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Styling gallery"

### TextEditorStyle (Catalog line 450)
- [x] Header info captured
- [x] Marker protocol documentation preserved
- [x] Notes: "TextEditorStyle is the protocol; TextEditorStyleConfiguration is the data shape"
- [x] Source page file deleted
- [x] Catalog leaf removed
- [x] PageRegistry entries removed
- [x] No child elements absorbed
- [x] Lands in subsection: "TextEditorStyle (Reference)"
- [x] Marked as merged

### View/textEditorStyle(_:) (Catalog line 449)
- [x] Header info captured
- [x] All overload signatures transcribed
- [x] Default demo (.automatic) transferred
- [x] Variant demos transferred (3 styles: automatic, plain, roundedBorder iOS-only notation)
- [x] States demos transferred (disabled propagation)
- [x] Notes paragraphs preserved (5 notes from TextEditorStylePage)
- [x] Source page deleted
- [x] Catalog leaf removed
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Styling gallery"

### TextEditorStyleConfiguration (Catalog line 451)
- [x] Header info captured
- [x] Configuration struct definition and members documented
- [x] Note preserved: "SwiftKit does NOT author custom TextEditorStyle conformers"
- [x] Source page reference dissolved into parent
- [x] Catalog leaf removed
- [x] PageRegistry entry removed
- [x] Lands in subsection: "TextEditorStyleConfiguration (Reference)"
- [x] Marked as merged

## Parent page section plans

### TextFieldPage (existing at TextInputAndOutput/TextFieldPage.swift)

Rewrite to dense-page format. Existing content reused and consolidated with TextFieldStyle/View/textFieldStyle(_:).

1. Header — TextField type, description, availability (macOS 10.15+)
2. Reference — TextFieldStyle protocol + signature (moved from TextFieldStylePage)
3. Default demo — "Basic TextField"
4. Variants — TextField overloads and shapes:
   - "Plain label + binding"
   - "Prompt as Text"
   - "With value format — numeric"
   - "axis: .vertical — expands like TextEditor"
   - "Styling gallery" subsection:
     - ".automatic"
     - ".roundedBorder"
     - ".squareBorder"
     - ".plain"
5. States:
   - "Disabled"
   - "Autocorrection disabled"
   - "With onSubmit"
   - "Disabled with style propagation" (from TextFieldStylePage states)
6. Notes — consolidated from both pages (9 total notes from TextFieldPage + TextFieldStylePage)

### TextEditorPage (existing at TextInputAndOutput/TextEditorPage.swift)

Rewrite to dense-page format. Existing content reused and consolidated with TextEditorStyle/View/textEditorStyle(_:)/TextEditorStyleConfiguration.

1. Header — TextEditor type, description, availability (macOS 11.0+)
2. Reference — TextEditorStyle protocol + TextEditorStyleConfiguration struct (moved from TextEditorStylePage)
3. Default demo — "Basic TextEditor"
4. Variants — TextEditor features and shapes:
   - "With custom font"
   - "With scrollContentBackground hidden"
   - "With line spacing"
   - "Styling gallery" subsection:
     - ".automatic"
     - ".plain"
     - ".roundedBorder — iOS-only notation"
5. States:
   - "Disabled"
   - "Foreground style"
   - "Disabled with style propagation" (from TextEditorStylePage states)
6. Notes — consolidated from both pages (9 total notes from TextEditorPage + TextEditorStylePage)

### TextPage (existing at TextInputAndOutput/TextPage.swift)

No absorption needed. TextPage remains unchanged and stands alone.

## Excluded leaves (NOT absorbed per specification)

Per the plan: "font modifiers stay on FontModifiersPage/TypographyPage (don't absorb those)."

Font and text-layout modifiers in the text-input-and-output section remain separate:
- View/font(_:) — line 581
- View/fontDesign(_:) — line 582
- View/fontWeight(_:) — line 583
- View/fontWidth(_:) — line 584
- Font — line 585
- View/textScale(_:isEnabled:) — line 586
- View/dynamicTypeSize(_:) — line 587
- DynamicTypeSize — line 588
- ScaledMetric — line 589
- View/bold(_:) — line 593
- View/italic(_:) — line 594
- View/underline(_:pattern:color:) — line 595
- View/strikethrough(_:pattern:color:) — line 596
- View/textCase(_:) — line 597
- View/monospaced(_:) — line 598
- View/monospacedDigit() — line 599
- View/baselineOffset(_:) — line 606
- View/kerning(_:) — line 607
- View/tracking(_:) — line 608

Also NOT absorbed:
- SecureFieldPage — separate control type
- Text layout/line modifiers (lineLimit, lineSpacing, multilineTextAlignment)
- Text selection leaves (stay in TextInputAndOutput)
- Input behavior leaves (autocorrection, keyboard, textContentType, etc.) — reserved for future TextField/TextEditor behavior subsections or TextInputBehaviorPage

## Sign-off

- [x] Implementer: all source pages read, manifest complete, all absorbed leaves cataloged
- [ ] Spec-compliance reviewer: manifest verified against source pages, ready for implementer
- [ ] Code-quality reviewer: dense pages approved, no L-001/L-012 violations
- [x] Manifest committed alongside code commit

**Manifest metadata:**
- Task: B7 — Text/TextField/TextEditor consolidation (Phase B)
- Parent plan: 2026-05-05-phase-6-reorganization.md, row B7
- Created: 2026-05-05
- Implemented: 2026-05-05
- Implementer: Claude Sonnet 4.6
- Absorbed file count: 2 pages (TextFieldStylePage.swift, TextEditorStylePage.swift)
- Absorbed catalog leaves: 5 leaves
- Consolidated Catalog entries: 3 parents retained, 5 leaves deleted
- PageRegistry deletions: 5 entries updated to point to parent pages
- TextFieldPage.swift: 377 lines
- TextEditorPage.swift: 349 lines
