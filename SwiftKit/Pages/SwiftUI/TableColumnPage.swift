import SwiftUI

// SwiftUI `TableColumn` reference page.
// Source: Documentation/SwiftUI/tables/tablecolumn.md
// Six documented initializers across two families plus three width modifiers:
//   Unsortable:
//     init(_:value:)                  — String key path; auto-Text rendering
//     init(_:content:)                — view-builder content, no sort
//   Sortable:
//     init(_:value:content:)          — String key path + custom content
//     init(_:value:comparator:)       — non-String key path with explicit Comparator
//     init(_:value:comparator:content:)
//     init(_:sortUsing:content:)      — KeyPathComparator-driven
//   Width:
//     .width(_:)            — fixed width
//     .width(min:ideal:max:) — flexible width
//     .width()              — reset to default
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

struct TableColumnPage: View {
    @State private var sortOrder: [KeyPathComparator<Person>] = [
        KeyPathComparator(\Person.familyName)
    ]
    @State private var sortableJoined: [KeyPathComparator<Person>] = [
        KeyPathComparator(\Person.joined, order: .reverse)
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
            Text("TableColumn")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A column that displays a view for each row in a table.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/tables/tablecolumn.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "TableColumn(\"Given name\", value: \\.givenName) — auto-Text from String KeyPath") {
            Table(people) {
                TableColumn("Given name",  value: \.givenName)
                TableColumn("Family name", value: \.familyName)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init(_:value:) — String KeyPath, no closure") {
                DemoCard(api: "TableColumn(\"Family\", value: \\.familyName)") {
                    Table(people) {
                        TableColumn("Family", value: \.familyName)
                        TableColumn("Given",  value: \.givenName)
                        TableColumn("Role",   value: \.role)
                    }
                }
            }

            VariantBlock(title: "init(_:content:) — custom view, unsortable") {
                DemoCard(api: "TableColumn(\"Person\") { person in HStack { Image; VStack { Text; Text } } }") {
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

            VariantBlock(title: "init(_:value:content:) — sortable + custom view") {
                DemoCard(api: "Table(people, sortOrder: $sortOrder) { TableColumn(\"Family\", value: \\.familyName) { person in Label(person.familyName, systemImage:) } }") {
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

            VariantBlock(title: "init(_:value:comparator:) — Comparable non-String KeyPath") {
                DemoCard(api: "TableColumn(\"Joined\", value: \\.joined, comparator: NumericComparator()) { Text($0.joined.description) }") {
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
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".width(_:) — fixed-width column") {
                DemoCard(api: "TableColumn(\"Role\", value: \\.role).width(80)") {
                    Table(people) {
                        TableColumn("Family", value: \.familyName)
                        TableColumn("Role",   value: \.role)
                            .width(80)
                        TableColumn("Given",  value: \.givenName)
                    }
                }
            }

            VariantBlock(title: ".width(min:ideal:max:) — flexible column") {
                DemoCard(api: "TableColumn(\"Family\", value: \\.familyName).width(min: 80, ideal: 140, max: 240)") {
                    Table(people) {
                        TableColumn("Family", value: \.familyName)
                            .width(min: 80, ideal: 140, max: 240)
                        TableColumn("Given",  value: \.givenName)
                        TableColumn("Role",   value: \.role)
                    }
                }
            }

            VariantBlock(title: "Side-by-side — auto Text vs. custom content") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "init(_:value:) — auto Text", api: "TableColumn(\"Family\", value: \\.familyName)") {
                        Table(people) {
                            TableColumn("Family", value: \.familyName)
                            TableColumn("Role",   value: \.role)
                        }
                    }
                    StateColumn(label: "init(_:content:) — custom view", api: "TableColumn(\"Family\") { person in Label(person.familyName, systemImage:) }") {
                        Table(people) {
                            TableColumn("Family") { person in
                                Label(person.familyName, systemImage: "person.text.rectangle")
                            }
                            TableColumn("Role") { person in
                                Text(person.role)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct ColumnNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ColumnNote] = [
        .init(title: "Two init families: unsortable and sortable.",
              detail: "Unsortable forms — init(_:value:) and init(_:content:) — never participate in sortOrder bindings. Sortable forms — init(_:value:content:), init(_:value:comparator:), init(_:value:comparator:content:), init(_:sortUsing:content:) — render the chevron header and write into the table's [KeyPathComparator] binding.",
              symbol: "switch.2"),
        .init(title: "String KeyPath gets a free Text renderer.",
              detail: "init(_:value:) is sugar over init(_:value:content:) for KeyPath<RowValue, String> — the framework supplies a Text(rowValue[keyPath:]) closure for you. The instant your column needs anything else (Image + Text, color, formatting), reach for the explicit content closure form.",
              symbol: "textformat"),
        .init(title: "Sortable columns require Comparable values.",
              detail: "init(_:value:) on a String KeyPath is sortable because String is Comparable. For non-String value types, supply a comparator — e.g. KeyPathComparator(\\Person.joined) — through init(_:value:comparator:) or init(_:sortUsing:). The Table's sortOrder binding holds [KeyPathComparator<RowValue>].",
              symbol: "arrow.up.arrow.down"),
        .init(title: "Three width modifiers, three behaviors.",
              detail: ".width(value) pins the column to that point size. .width(min:ideal:max:) gives a resizable range — any of the three is optional. .width() resets to the default automatic width. Apply width per-column on the TableColumn, not the Table.",
              symbol: "ruler"),
        .init(title: "TableColumnContent — TableColumn is one conformer.",
              detail: "Table's columns parameter is a generic TableColumnContent. TableColumn is the everyday conformer; Group, ForEach (TableColumnForEach), and conditional `if` blocks also conform, letting you build columns dynamically.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Header label can be any View — but keep it terse.",
              detail: "The leading parameter accepts a LocalizedStringKey or a View builder. Custom header views work, but tables expect short, glanceable headers — anything tall pushes header height and steals from row space.",
              symbol: "text.line.first.and.arrowtriangle.forward")
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
                .frame(width: 360, height: demoFrameHeight)
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
    TableColumnPage()
        .frame(width: 1200, height: 900)
}
