# B5 — Table Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/Tables/TablePage.swift (rewrite in place)

**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.tables` subsection, line 1039

**Status:** merged

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | TableColumn | (inline in TablePage.swift) | struct TableColumn | Documentation/SwiftUI/tables/tablecolumn.md | gallery | "TableColumn variants" |
| 2 | TableColumnContent | (inline in TablePage.swift) | protocol TableColumnContent | Documentation/SwiftUI/tables/tablecolumncontent.md | gallery | "Reference — TableColumnContent" |
| 3 | TableStyle | (inline in TablePage.swift) | protocol TableStyle | Documentation/SwiftUI/view-styles/tablestyle.md | gallery | "TableStyle gallery" |
| 4 | TableStyleConfiguration | (inline in TablePage.swift) | struct TableStyleConfiguration | Documentation/SwiftUI/view-styles/tablestyleconfiguration.md | gallery | "Reference — TableStyleConfiguration" |
| 5 | View/tableStyle(_:) | (inline in TablePage.swift) | View/tableStyle(_:) | Documentation/SwiftUI/view-styles/tablestyle(_:).md | gallery | "TableStyle gallery" |

## Per-leaf coverage checklist

### Leaf 1: TableColumn
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: value-based, custom-content, computed keypath forms)
- [x] States demos transferred (count expected: customizationID, sorting integration)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (if standalone)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 1040)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "TableColumn variants"

### Leaf 2: TableColumnContent
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: protocol reference only)
- [x] States demos transferred (count expected: 0 — protocol reference)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 1041)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — TableColumnContent"

### Leaf 3: TableStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .automatic, .inset, .bordered per existing TablePage)
- [x] States demos transferred (count expected: alternatesRowBackgrounds variants)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (if standalone)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (via view-styles section or tables section reference)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "TableStyle gallery"

### Leaf 4: TableStyleConfiguration
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 0 — structure reference only)
- [x] States demos transferred (count expected: 0 — configuration reference)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (view-styles section)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — TableStyleConfiguration"

### Leaf 5: View/tableStyle(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — merged into TableStyle gallery)
- [x] States demos transferred (count expected: alternatesRowBackgrounds state)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (if standalone)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (view-styles section, line 454)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "TableStyle gallery"

## Parent page section plan

Ordered list of `PageSection` titles in the new dense page:

1. **Header** — Title: "Table"; summary: "A container that presents rows of data arranged in one or more columns with optional selection and sorting."; availability: macOS 12.0+; APIs: Table, TableColumn, TableColumnContent, TableStyle, TableStyleConfiguration
2. **Reference — TableColumn** — TableColumn struct, initializers (value-based, custom content), customizationID modifier, sorting integration
3. **Reference — TableColumnContent protocol** — Protocol shape with Label and Content generics
4. **Reference — TableStyleConfiguration** — Configuration struct for custom TableStyle (read-only, no SwiftKit custom implementations note)
5. **Basic Table demo** — Simple data-driven table, multi-column, no selection/sort
6. **TableColumn variants** — Value keypath form, custom content closure, computed properties, header formatting
7. **TableStyle gallery** — Three built-in styles: .automatic (default), .inset, .bordered; alternatesRowBackgrounds parameter
8. **Selection patterns** — Single selection (Optional<ID>), multi-selection (Set<ID>), selection type inference
9. **Sorting and comparators** — KeyPathComparator, sortOrder binding, multi-column sort, onChange integration
10. **TableColumnCustomization** — TableColumnCustomization state, customizationID per column, user-driven reorder/visibility, @AppStorage persistence
11. **Disclosure rows and hierarchical tables** — DisclosureTableRow, children: keypath shorthand, expansion state, nesting
12. **Notes** — Five initializer families; selection type drives single vs multi; sorting is developer-managed; compact width collapses to first column; hierarchical and customizable column forms; hierarchical demo external link to DisclosureTableRowPage

## Sign-off

- Implementer: Claude Sonnet 4.6 — 2026-05-05
- Spec-compliance reviewer: Claude Sonnet 4.6 — 2026-05-05 ✅ APPROVED (after fix in f1a6cfd — Sections 10 & 11 confirmed present and complete)
- Code-quality reviewer: Claude Sonnet 4.6 — 2026-05-05 ✅ APPROVED (no Critical/Important; AnyView in style gallery and shared sortablePeople array are Suggestion-only; L-001/L-012 clean; BUILD SUCCEEDED)

## Manifest metadata

- **Task ID:** B5
- **Parent type:** Table (rewritten in place)
- **Framework:** SwiftUI
- **Sections affected:** tables (primary), view-styles (TableStyle, TableStyleConfiguration)
- **Affected Catalog+SwiftUI.swift lines:** 1039 (Table, remains), 1040 (TableColumn — absorb), 1041 (TableColumnContent — absorb), view-styles section line 454 (View/tableStyle(_:) — absorb)
- **Catalog leaves to delete from swiftui.tables:** TableColumn (line 1040), TableColumnContent (line 1041)
- **Catalog leaves to delete from view-styles:** View/tableStyle(_:) (line 454), plus any TableStyle/TableStyleConfiguration entries if they exist as separate leaves
- **PageRegistry entries affected:** TableColumn, TableColumnContent, View/tableStyle(_:), (TableStyle, TableStyleConfiguration if registered separately)
- **Pages to delete:** (none — leaves are currently gallery/real, not separate page files based on discovery)
- **Pages to rewrite in place:** TablePage.swift (under SwiftUI/Tables/)
- **Related but NOT absorbed:** DisclosureTableRow (placeholder, separate page link), TableColumnCustomization (placeholder, separate page link), BuildingGreatMacAppPage (separate article reference), TableColumnCustomizationPage (separate gallery page), DisclosureTableRowPage (separate gallery page)
- **Created:** 2026-05-05
- **Implemented:** 2026-05-05
- **Spec-reviewed:** 2026-05-05

## Discovery notes

- **File structure:** Three existing page files in SwiftKit/Pages/SwiftUI/Tables/: BuildingGreatMacAppPage.swift, DisclosureTableRowPage.swift, TableColumnCustomizationPage.swift. None directly correspond to absorbed types (TableColumn, TableColumnContent, TableStyle, TableStyleConfiguration, View/tableStyle(_:)). These are reference/configuration pages, not primary type pages.
- **Catalog structure:** 21 total `swiftui.tables` leaves (lines 1038–1057 in Catalog+SwiftUI.swift). Of these, 5 are absorbed (TableColumn, TableColumnContent, and the three tableStyle/View/tableStyle(_:) entries). The remaining 16 are builder/content protocols (TableColumnBuilder, TableColumnForEach, TableRow, TableRowContent, TableHeaderRowContent, TupleTableRowContent, TableForEachContent, EmptyTableRowContent, DynamicTableRowContent, TableRowBuilder, TableOutlineGroupContent) and gallery pages (Building a great Mac app, DisclosureTableRow, TableColumnCustomization).
- **Real vs placeholder status:** TableColumn and TableColumnContent are `.real` leaves with symbol references. View/tableStyle(_:) in view-styles section is `.real`. TableColumnCustomization and DisclosureTableRow are `.placeholder` leaves pointing to dedicated gallery pages.
- **No separate type pages for absorbed leaves:** Unlike B4 (Menu) where MenuStyle and MenuStyleConfiguration had dedicated pages, the absorbed Table types are currently reference content only or embedded in the existing TablePage. Absorption is a restructuring of existing TablePage content, not a merging of separate page files.
- **Out of scope for B5:** The remaining 16 table-family leaves are builder/content/structure types that feed into Table construction. They are documented but not absorbed into TablePage as part of B5 scope. They remain as `.real` reference leaves in the catalog. (Per Phase 6 plan section C5: "Roll into TablePage" suggests potential future consolidation, but B5 scope is TableColumn, TableColumnContent, TableStyle, TableStyleConfiguration, View/tableStyle(_:) only.)
