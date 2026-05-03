import SwiftUI

// SwiftUI `Table` reference page.
// Source: Documentation/SwiftUI/tables/table.md
// Five families of initializers documented:
//   init(_:columns:)                             — data-driven, no selection / no sort
//   init(_:selection:columns:)                   — data-driven, single or multi selection
//   init(_:sortOrder:columns:)                   — data-driven, sortable
//   init(_:selection:sortOrder:columns:)         — data-driven, sortable + selection
//   init(of:columns:rows:)                       — explicit rows via TableRow
// Plus hierarchical (`init(_:children:…)`) and column-customization variants.
// macOS 12.0+. Compose Apple primitives directly per L-001 / L-007 / framework hard constraints.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 260

private struct Person: Identifiable, Hashable {
    let givenName: String
    let familyName: String
    let role: String
    let joined: Int
    let id = UUID()

    var fullName: String { givenName + " " + familyName }
}

private let people: [Person] = [
    Person(givenName: "Juan",  familyName: "Chavez",  role: "Designer",  joined: 2019),
    Person(givenName: "Mei",   familyName: "Chen",    role: "Engineer",  joined: 2021),
    Person(givenName: "Tom",   familyName: "Clark",   role: "Manager",   joined: 2017),
    Person(givenName: "Gita",  familyName: "Kumar",   role: "Engineer",  joined: 2022),
    Person(givenName: "Aiko",  familyName: "Tanaka",  role: "Researcher", joined: 2020),
    Person(givenName: "Luca",  familyName: "Rossi",   role: "Designer",  joined: 2023)
]

private struct Purchase: Identifiable, Hashable {
    let label: String
    let price: Decimal
    let id = UUID()
}

private let purchases: [Purchase] = [
    Purchase(label: "Coffee", price: 6),
    Purchase(label: "Lunch",  price: 24),
    Purchase(label: "Dinner", price: 75)
]

struct TablePage: View {
    @State private var singleSelection: Person.ID?
    @State private var multiSelection: Set<Person.ID> = []
    @State private var sortOrder: [KeyPathComparator<Person>] = [
        KeyPathComparator(\Person.familyName)
    ]
    @State private var sortablePeople: [Person] = people

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Table")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A container that presents rows of data arranged in one or more columns, optionally providing the ability to select one or more members.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/tables/table.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Table(people) { TableColumn(\"Name\", value: \\.fullName); TableColumn(\"Role\", value: \\.role) }") {
            Table(people) {
                TableColumn("Name", value: \.fullName)
                TableColumn("Role", value: \.role)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Data-driven — init(_:columns:)") {
                DemoCard(api: "Table(people) { TableColumn(\"Given\", value: \\.givenName); TableColumn(\"Family\", value: \\.familyName); TableColumn(\"Role\", value: \\.role) }") {
                    Table(people) {
                        TableColumn("Given",  value: \.givenName)
                        TableColumn("Family", value: \.familyName)
                        TableColumn("Role",   value: \.role)
                    }
                }
            }

            VariantBlock(title: "Static rows — init(of:columns:rows:)") {
                DemoCard(api: "Table(of: Purchase.self) { TableColumn(\"Item\") { Text($0.label) }; TableColumn(\"Price\") { … } } rows: { TableRow(p) … }") {
                    Table(of: Purchase.self) {
                        TableColumn("Item") { purchase in
                            Text(purchase.label)
                        }
                        TableColumn("Base") { purchase in
                            Text(purchase.price, format: .currency(code: "USD"))
                        }
                        TableColumn("With 20% tip") { purchase in
                            Text(purchase.price * 1.20, format: .currency(code: "USD"))
                        }
                    } rows: {
                        ForEach(purchases) { purchase in
                            TableRow(purchase)
                        }
                    }
                }
            }

            VariantBlock(title: "Custom column content closures") {
                DemoCard(api: "TableColumn(\"Name\") { person in HStack { Image; Text(person.fullName) } } — init(_:content:)") {
                    Table(people) {
                        TableColumn("Name") { person in
                            HStack(spacing: 8) {
                                Image(systemName: "person.crop.circle")
                                    .foregroundStyle(.tint)
                                Text(person.fullName)
                            }
                        }
                        TableColumn("Joined") { person in
                            Text(person.joined.formatted(.number.grouping(.never)))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Single selection — Optional<Person.ID>") {
                DemoCard(api: "Table(people, selection: $singleSelection) { … } — selection: Person.ID?") {
                    Table(people, selection: $singleSelection) {
                        TableColumn("Name", value: \.fullName)
                        TableColumn("Role", value: \.role)
                    }
                }
                Text(singleSelection.flatMap { id in people.first(where: { $0.id == id })?.fullName } ?? "—")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            VariantBlock(title: "Multi-selection — Set<Person.ID>") {
                DemoCard(api: "Table(people, selection: $multiSelection) { … } — selection: Set<Person.ID>") {
                    Table(people, selection: $multiSelection) {
                        TableColumn("Name", value: \.fullName)
                        TableColumn("Role", value: \.role)
                    }
                }
                Text("\(multiSelection.count) selected")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            VariantBlock(title: "Sortable — sortOrder: [KeyPathComparator]") {
                DemoCard(api: "Table(sortablePeople, sortOrder: $sortOrder) { … }.onChange(of: sortOrder) { sortablePeople.sort(using: $1) }") {
                    Table(sortablePeople, sortOrder: $sortOrder) {
                        TableColumn("Family", value: \.familyName)
                        TableColumn("Given",  value: \.givenName)
                        TableColumn("Role",   value: \.role)
                    }
                    .onChange(of: sortOrder) { _, newOrder in
                        sortablePeople.sort(using: newOrder)
                    }
                }
                Text("sortOrder = \(sortOrder.map { $0.keyPath == \Person.familyName ? "familyName" : $0.keyPath == \Person.givenName ? "givenName" : "role" }.joined(separator: ", "))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            VariantBlock(title: "Empty data — header still renders") {
                DemoCard(api: "Table([Person]()) { TableColumn(\"Name\", value: \\.fullName) }",
                         height: 160) {
                    Table([Person]()) {
                        TableColumn("Name", value: \.fullName)
                        TableColumn("Role", value: \.role)
                    }
                }
            }

            stylesGrid
        }
    }

    private var stylesGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Table styles available on macOS")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Apply via .tableStyle(_:). The default is .automatic; .inset and .bordered offer alternating row backgrounds.")
                .font(.caption)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                styleSample(title: ".automatic", api: ".tableStyle(.automatic)") {
                    AnyView(stylableTable.tableStyle(.automatic))
                }
                styleSample(title: ".inset", api: ".tableStyle(.inset)") {
                    AnyView(stylableTable.tableStyle(.inset))
                }
                styleSample(title: ".bordered", api: ".tableStyle(.bordered)") {
                    AnyView(stylableTable.tableStyle(.bordered))
                }
            }
        }
    }

    private var stylableTable: some View {
        Table(people) {
            TableColumn("Family", value: \.familyName)
            TableColumn("Given",  value: \.givenName)
            TableColumn("Role",   value: \.role)
        }
    }

    private func styleSample(title: String, api: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    // MARK: Notes

    private struct TableNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TableNote] = [
        .init(title: "Five initializer families cover the surface.",
              detail: "init(_:columns:) is the data-driven base. Add `selection:` for single (Optional<ID>) or multi (Set<ID>) selection; add `sortOrder:` for sortable headers. init(of:columns:rows:) is the static-row form when you'd rather hand-roll TableRow values.",
              symbol: "switch.2"),
        .init(title: "Selection type drives single vs multi.",
              detail: "Bind to Optional<RowValue.ID> for single selection. Bind to Set<RowValue.ID> for multi-selection (Cmd-click / Shift-click on macOS). Apple infers the mode from the binding's value type — there is no explicit `multiple:` flag.",
              symbol: "checklist"),
        .init(title: "Sorting is your responsibility, not the table's.",
              detail: "Table reflects the sortOrder binding in its header chevrons but does not mutate the underlying collection. Watch the binding via .onChange(of: sortOrder) and call data.sort(using: newOrder) yourself.",
              symbol: "arrow.up.arrow.down"),
        .init(title: ".tableStyle(_:) — .automatic, .inset, .bordered on macOS.",
              detail: "Default is .automatic. .inset and .bordered each accept an `alternatesRowBackgrounds:` overload (e.g. .inset(alternatesRowBackgrounds: true)) for striped rows; the unparameterized form keeps platform default striping. Other styles documented for SwiftUI tables (e.g. iOS-only) fall back on macOS.",
              symbol: "tablecells"),
        .init(title: "Compact width hides headers + extra columns.",
              detail: "On iPhone or in a horizontalSizeClass == .compact environment, Table auto-hides headers and every column after the first. Conditionally enrich the first column to keep useful information visible — see the doc's CompactableTable example.",
              symbol: "iphone"),
        .init(title: "Hierarchical and customizable-column forms exist.",
              detail: "init(_:children:…) drives a tree-shaped Table from a KeyPath to optional children. init(_:columnCustomization:columns:) takes a TableColumnCustomization binding so users can show/hide/reorder columns. Both are listed under the doc's `Topics` and follow the same selection/sort patterns.",
              symbol: "list.triangle")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: height)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

private struct StateColumn<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    TablePage()
        .frame(width: 1200, height: 900)
}
