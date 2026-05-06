import SwiftUI

// Dense SwiftUI Table gallery — consolidates 5 absorbed leaves:
//   TableColumn         (struct TableColumn)
//   TableColumnContent  (protocol TableColumnContent)
//   TableStyle          (protocol TableStyle)
//   TableStyleConfiguration (struct TableStyleConfiguration)
//   View/tableStyle(_:) (modifier)
//
// Source docs:
//   Documentation/SwiftUI/tables/table.md
//   Documentation/SwiftUI/tables/tablecolumn.md
//   Documentation/SwiftUI/tables/tablecolumncontent.md
//   Documentation/SwiftUI/view-styles/tablestyle.md
//   Documentation/SwiftUI/view-styles/tablestyle(_:).md
//   Documentation/SwiftUI/view-styles/tablestyleconfiguration.md
//
// Mirrors TypographyPage / ShapesGalleryPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

// MARK: — Shared demo data (file-private)

private struct Person: Identifiable, Hashable {
    let givenName: String
    let familyName: String
    let role: String
    let joined: Int
    let id = UUID()
    var fullName: String { givenName + " " + familyName }
}

private let people: [Person] = [
    Person(givenName: "Juan",  familyName: "Chavez",  role: "Designer",   joined: 2019),
    Person(givenName: "Mei",   familyName: "Chen",    role: "Engineer",   joined: 2021),
    Person(givenName: "Tom",   familyName: "Clark",   role: "Manager",    joined: 2017),
    Person(givenName: "Gita",  familyName: "Kumar",   role: "Engineer",   joined: 2022),
    Person(givenName: "Aiko",  familyName: "Tanaka",  role: "Researcher", joined: 2020),
    Person(givenName: "Luca",  familyName: "Rossi",   role: "Designer",   joined: 2023),
]

private struct Purchase: Identifiable, Hashable {
    let label: String
    let price: Decimal
    let id = UUID()
}

private let purchases: [Purchase] = [
    Purchase(label: "Coffee", price: 6),
    Purchase(label: "Lunch",  price: 24),
    Purchase(label: "Dinner", price: 75),
]

private struct TSRow: Identifiable, Hashable {
    let id: Int
    let title: String
    let count: Int
}

private let styleRows: [TSRow] = [
    TSRow(id: 0, title: "Engineering", count: 12),
    TSRow(id: 1, title: "Design",      count: 5),
    TSRow(id: 2, title: "Research",    count: 7),
    TSRow(id: 3, title: "Operations",  count: 3),
]

private let tableFrameWidth: CGFloat = 460
private let tableFrameHeight: CGFloat = 240
private let styleCardWidth: CGFloat = 360
private let styleCardHeight: CGFloat = 210

// MARK: — Main page

struct TablePage: View {
    // Selection state
    @State private var singleSelection: Person.ID?
    @State private var multiSelection: Set<Person.ID> = []
    // Sorting state
    @State private var sortOrder: [KeyPathComparator<Person>] = [KeyPathComparator(\Person.familyName)]
    @State private var sortableJoined: [KeyPathComparator<Person>] = [KeyPathComparator(\Person.joined, order: .reverse)]
    @State private var sortablePeople: [Person] = people

    private var sortOrderDisplay: String {
        sortOrder.map { kp -> String in
            if kp.keyPath == \Person.familyName { return "familyName" }
            if kp.keyPath == \Person.givenName  { return "givenName" }
            return "role"
        }.joined(separator: ", ")
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                referenceTableColumnSection
                referenceTableColumnContentSection
                referenceTableStyleConfigurationSection
                basicTableSection
                tableColumnVariantsSection
                tableStyleGallerySection
                selectionSection
                sortingSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Table")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A container that presents rows of data arranged in one or more columns with optional selection and sorting.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/tables/  \u{00b7}  macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Table  \u{00b7}  TableColumn  \u{00b7}  TableColumnContent  \u{00b7}  TableStyle  \u{00b7}  TableStyleConfiguration")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference — TableColumn

    private var referenceTableColumnSection: some View {
        PageSection("Reference — TableColumn",
                    subtitle: "struct TableColumn \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("A column that displays a view for each row in a table. TableColumn is the primary concrete conformer of TableColumnContent.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Initializer families")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
// Unsortable
init(_:value:)                        — String KeyPath; auto-Text rendering
init(_:content:)                      — view-builder content, no sort

// Sortable (contributes to sortOrder binding)
init(_:value:content:)                — String KeyPath + custom content
init(_:value:comparator:)             — non-String KeyPath with explicit Comparator
init(_:value:comparator:content:)
init(_:sortUsing:content:)            — KeyPathComparator-driven
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Width modifiers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
.width(_ width: CGFloat)              — fixed width
.width(min: CGFloat?, ideal: CGFloat?, max: CGFloat?)  — flexible range
.width()                              — reset to default automatic
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("customizationID(_:) modifier")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
// Enables user-driven show/hide and reorder when table has a
// TableColumnCustomization binding:
TableColumn("Family", value: \\.familyName)
    .customizationID("family")
"""
                    )
                }
            }
        }
    }

    // MARK: Reference — TableColumnContent

    private var referenceTableColumnContentSection: some View {
        PageSection("Reference — TableColumnContent",
                    subtitle: "protocol TableColumnContent \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("The type that Table accepts for its columns parameter. TableColumn is the everyday conformer; Group, ForEach (TableColumnForEach), and conditional if blocks also conform — they let you compose columns dynamically without losing type safety.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Protocol declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
protocol TableColumnContent<TableRowValue, Sort, TableColumnBody> {
    associatedtype TableRowValue : Identifiable
    associatedtype Sort : SortComparator = Never
    associatedtype TableColumnBody : TableColumnContent
    typealias TableColumnSortComparator = KeyPathComparator<TableRowValue>

    @TableColumnBuilder<TableRowValue, Sort>
    var tableColumnBody: Self.TableColumnBody { get }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Concrete conformers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
TableColumn          — primary workhorse
Group                — groups columns without affecting layout
TableColumnForEach   — dynamic column generation from a collection
// Conditional blocks (if/else, switch) also satisfy the constraint
// via the @TableColumnBuilder result builder
"""
                    )
                }

                noteRow(
                    title: "TableColumnContent is what makes @TableColumnBuilder work.",
                    detail: "Every type inside a Table's columns closure must conform to TableColumnContent. The @TableColumnBuilder result builder is what lets you write multiple columns as a trailing closure — each column contributes to the type-erased body.",
                    symbol: "rectangle.split.3x1"
                )
            }
        }
    }

    // MARK: Reference — TableStyleConfiguration

    private var referenceTableStyleConfigurationSection: some View {
        PageSection("Reference — TableStyleConfiguration",
                    subtitle: "struct TableStyleConfiguration : View \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("The configuration passed to a TableStyle conformer's makeBody(configuration:). Unlike most style configurations, TableStyleConfiguration IS itself a View — render it directly and the Table draws itself inside it. You cannot introspect rows, columns, or selection state from this type.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                codeBlock(
"""
struct TableStyleConfiguration : View {
    // No public stored properties.
    // The configuration IS the renderable type-erased Table content.
    // Render it: `configuration` or `configuration.body`
}
"""
                )

                VStack(alignment: .leading, spacing: 6) {
                    Text("Usage inside a custom TableStyle conformer")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
struct MyTableStyle: TableStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration                     // ← renders the table
            .background(.background.secondary)
            .cornerRadius(8)
    }
}
"""
                    )
                }

                noteRow(
                    title: "SwiftKit does not author custom TableStyle conformers.",
                    detail: "Per project constraint, SwiftKit documents built-in styles and protocol surface only — it never re-implements Apple primitives.",
                    symbol: "lock"
                )
            }
        }
    }

    // MARK: Basic Table

    private var basicTableSection: some View {
        PageSection("Basic Table",
                    subtitle: "Table(\u{005f}:columns:)  \u{00b7}  data-driven, no selection or sort") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Two-column, auto-Text (String KeyPath)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "Table(people) { TableColumn(\"Name\", value: \\.fullName); TableColumn(\"Role\", value: \\.role) }") {
                        Table(people) {
                            TableColumn("Name", value: \.fullName)
                            TableColumn("Role", value: \.role)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Three-column, data-driven")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "Table(people) { TableColumn(\"Given\", value: \\.givenName); TableColumn(\"Family\", value: \\.familyName); TableColumn(\"Role\", value: \\.role) }") {
                        Table(people) {
                            TableColumn("Given",  value: \.givenName)
                            TableColumn("Family", value: \.familyName)
                            TableColumn("Role",   value: \.role)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Static rows — init(of:columns:rows:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "Table(of: Purchase.self) { columns } rows: { ForEach(purchases) { TableRow($0) } }") {
                        Table(of: Purchase.self) {
                            TableColumn("Item") { Text($0.label) }
                            TableColumn("Base") { Text($0.price, format: .currency(code: "USD")) }
                            TableColumn("With 20% tip") { Text($0.price * 1.20, format: .currency(code: "USD")) }
                        } rows: {
                            ForEach(purchases) { TableRow($0) }
                        }
                    }
                }
            }
        }
    }

    // MARK: TableColumn Variants

    private var tableColumnVariantsSection: some View {
        PageSection("TableColumn Variants",
                    subtitle: "Value KeyPath · Custom content · Comparable sort · Width modifiers") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("init(_:value:) — String KeyPath, no closure (sortable)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "TableColumn(\"Family\", value: \\.familyName)  // auto-Text, String = Comparable → sortable") {
                        Table(people) {
                            TableColumn("Family", value: \.familyName)
                            TableColumn("Given",  value: \.givenName)
                            TableColumn("Role",   value: \.role)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("init(_:content:) — custom view builder, unsortable")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "TableColumn(\"Person\") { person in HStack { Image; VStack { Text; Text } } }") {
                        Table(people) {
                            TableColumn("Person") { person in
                                HStack(spacing: 8) {
                                    Image(systemName: "person.crop.circle")
                                        .foregroundStyle(.tint)
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text(person.fullName)
                                        Text(person.role)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                            TableColumn("Joined") { person in
                                Text(person.joined.formatted(.number.grouping(.never)))
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("init(_:value:content:) — sortable + custom view")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "Table(people, sortOrder: $sortOrder) { TableColumn(\"Family\", value: \\.familyName) { Label(…) } }") {
                        Table(sortablePeople, sortOrder: $sortOrder) {
                            TableColumn("Family", value: \.familyName) { person in
                                Label(person.familyName, systemImage: "person.text.rectangle")
                            }
                            TableColumn("Given", value: \.givenName)
                        }
                        .onChange(of: sortOrder) { _, newOrder in
                            sortablePeople.sort(using: newOrder)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("init(_:value:comparator:) — non-String Comparable KeyPath")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "TableColumn(\"Joined\", value: \\.joined) { Text($0.joined.description) }  // Int KeyPath → sortable") {
                        Table(sortablePeople, sortOrder: $sortableJoined) {
                            TableColumn("Family", value: \.familyName)
                            TableColumn("Joined", value: \.joined) { person in
                                Text(person.joined.formatted(.number.grouping(.never)))
                                    .monospacedDigit()
                            }
                        }
                        .onChange(of: sortableJoined) { _, newOrder in
                            sortablePeople.sort(using: newOrder)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Width modifiers — .width(_:) and .width(min:ideal:max:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "TableColumn(\"Role\", value: \\.role).width(80)  +  TableColumn(\"Family\", ...).width(min: 80, ideal: 140, max: 240)") {
                        Table(people) {
                            TableColumn("Family", value: \.familyName)
                                .width(min: 80, ideal: 140, max: 240)
                            TableColumn("Role",   value: \.role)
                                .width(80)
                            TableColumn("Given",  value: \.givenName)
                        }
                    }
                }
            }
        }
    }

    // MARK: TableStyle Gallery

    private var tableStyleGallerySection: some View {
        PageSection("TableStyle Gallery",
                    subtitle: "func tableStyle\u{003c}S: TableStyle\u{003e}(_ style: S) -> some View  \u{00b7}  macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("TableStyle protocol")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
@MainActor protocol TableStyle {
    associatedtype Body : View
    typealias Configuration = TableStyleConfiguration

    @ViewBuilder @MainActor
    func makeBody(configuration: Self.Configuration) -> Self.Body
}

// Built-in conformers on macOS:
.automatic                              — DefaultTableStyle
.bordered                               — BorderedTableStyle
.bordered(alternatesRowBackgrounds: Bool)
.inset                                  — InsetTableStyle
.inset(alternatesRowBackgrounds: Bool)
"""
                    )
                }

                Text("Built-in styles — live demos")
                    .font(.headline)
                    .foregroundStyle(.primary)

                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: styleCardWidth + 24), spacing: 24)],
                    alignment: .leading,
                    spacing: 24
                ) {
                    styleCard(title: ".automatic", api: ".tableStyle(.automatic)") {
                        AnyView(styleTable.tableStyle(.automatic))
                    }
                    styleCard(title: ".bordered", api: ".tableStyle(.bordered)") {
                        AnyView(styleTable.tableStyle(.bordered))
                    }
                    styleCard(title: ".bordered(alternatesRowBackgrounds: true)",
                              api: ".tableStyle(.bordered(alternatesRowBackgrounds: true))") {
                        AnyView(styleTable.tableStyle(.bordered(alternatesRowBackgrounds: true)))
                    }
                    styleCard(title: ".inset", api: ".tableStyle(.inset)") {
                        AnyView(styleTable.tableStyle(.inset))
                    }
                    styleCard(title: ".inset(alternatesRowBackgrounds: true)",
                              api: ".tableStyle(.inset(alternatesRowBackgrounds: true))") {
                        AnyView(styleTable.tableStyle(.inset(alternatesRowBackgrounds: true)))
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Inheritance — applies to nested Table views")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
NavigationStack {
    Table(rows) { … }
}
.tableStyle(.bordered(alternatesRowBackgrounds: true))
// The nearest enclosing modifier wins for each Table.
"""
                    )
                }
            }
        }
    }

    private var styleTable: some View {
        Table(styleRows) {
            TableColumn("Department", value: \.title)
            TableColumn("Headcount") { Text("\($0.count)") }
        }
    }

    // MARK: Selection Patterns

    private var selectionSection: some View {
        PageSection("Selection Patterns",
                    subtitle: "Optional\u{003c}ID\u{003e} for single · Set\u{003c}ID\u{003e} for multi  \u{00b7}  inferred from binding type") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Single selection — Optional<Person.ID>")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "Table(people, selection: $singleSelection) { … }  // Bind Optional<ID>") {
                        Table(people, selection: $singleSelection) {
                            TableColumn("Name", value: \.fullName)
                            TableColumn("Role", value: \.role)
                        }
                    }
                    Text(singleSelection.flatMap { id in people.first(where: { $0.id == id })?.fullName } ?? "\u{2014}")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Multi-selection — Set<Person.ID>")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(api: "Table(people, selection: $multiSelection) { … }  // Bind Set<ID>  — Cmd+click / Shift+click") {
                        Table(people, selection: $multiSelection) {
                            TableColumn("Name", value: \.fullName)
                            TableColumn("Role", value: \.role)
                        }
                    }
                    Text("\(multiSelection.count) selected")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: Sorting and Comparators

    private var sortingSection: some View {
        PageSection("Sorting and Comparators",
                    subtitle: "KeyPathComparator · sortOrder binding · developer-managed sort") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sortable table — click column headers to sort")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    tableCard(
                        api: "Table(sortablePeople, sortOrder: $sortOrder) { … }.onChange(of: sortOrder) { sortablePeople.sort(using: $1) }"
                    ) {
                        Table(sortablePeople, sortOrder: $sortOrder) {
                            TableColumn("Family", value: \.familyName)
                            TableColumn("Given",  value: \.givenName)
                            TableColumn("Role",   value: \.role)
                        }
                        .onChange(of: sortOrder) { _, newOrder in
                            sortablePeople.sort(using: newOrder)
                        }
                    }
                    Text("sortOrder = [\(sortOrderDisplay)]")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("KeyPathComparator signatures")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
// Default order (ascending)
KeyPathComparator(\\.familyName)

// Explicit order
KeyPathComparator(\\.joined, order: .reverse)

// Multi-column: array maintains priority
[KeyPathComparator(\\.familyName), KeyPathComparator(\\.givenName)]
"""
                    )
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Five initializer families cover the surface.",
                    detail: "init(_:columns:) is the data-driven base. Add `selection:` for single (Optional<ID>) or multi (Set<ID>); add `sortOrder:` for sortable headers. init(of:columns:rows:) is the static-row form. Hierarchical init(_:children:…) and column-customization init(_:columnCustomization:columns:) are also available.",
                    symbol: "switch.2"
                )
                noteRow(
                    title: "Selection type drives single vs. multi — no explicit flag.",
                    detail: "Bind to Optional<RowValue.ID> for single selection. Bind to Set<RowValue.ID> for multi-selection (Cmd-click / Shift-click on macOS). SwiftUI infers the mode from the binding's value type.",
                    symbol: "checklist"
                )
                noteRow(
                    title: "Sorting is developer-managed, not automatic.",
                    detail: "Table reflects sortOrder in its header chevrons but does NOT sort the underlying collection. Watch the binding via .onChange(of: sortOrder) and call data.sort(using: newOrder) yourself.",
                    symbol: "arrow.up.arrow.down"
                )
                noteRow(
                    title: ".bordered draws an outline; .inset is borderless.",
                    detail: ".bordered matches NSTableView with an outer border. .inset pulls rows from the edge with no outer outline. .automatic resolves to one per context. Both accept alternatesRowBackgrounds: Bool.",
                    symbol: "tablecells"
                )
                noteRow(
                    title: "Compact width collapses to first column.",
                    detail: "In horizontalSizeClass == .compact (iPhone or compact layout), Table auto-hides headers and every column after the first. Enrich the first column to keep information visible.",
                    symbol: "iphone"
                )
                noteRow(
                    title: "Hierarchical and customizable-column forms exist.",
                    detail: "init(_:children:…) drives a tree-shaped Table from a KeyPath to optional children. init(_:columnCustomization:columns:) takes a TableColumnCustomization binding so users can show/hide/reorder columns.",
                    symbol: "list.triangle"
                )
                noteRow(
                    title: "String KeyPath gets a free Text renderer.",
                    detail: "init(_:value:) on String KeyPath is sugar over init(_:value:content:) — the framework supplies Text(rowValue[keyPath:]) automatically. The instant the column needs an Image or custom formatting, use the explicit content closure form.",
                    symbol: "textformat"
                )
                noteRow(
                    title: "TableStyleConfiguration IS the renderable view.",
                    detail: "Unlike most style configurations that expose .label or .content sub-views, TableStyleConfiguration itself conforms to View — render it directly inside makeBody and the Table draws itself inside it.",
                    symbol: "rectangle"
                )
            }
        }
    }

    // MARK: View helpers

    private func tableCard<Content: View>(
        api: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: tableFrameWidth, height: tableFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    private func styleCard(
        title: String,
        api: String,
        @ViewBuilder content: () -> AnyView
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: styleCardWidth, height: styleCardHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    private func codeBlock(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

#Preview {
    TablePage()
        .frame(width: 1200, height: 1600)
}
