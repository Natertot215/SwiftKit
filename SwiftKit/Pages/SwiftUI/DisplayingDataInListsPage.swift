import SwiftUI

// SwiftUI "Displaying data in lists" article reference stub.
// Source: Documentation/SwiftUI/lists/displaying-data-in-lists.md
// This is an article (kind: article), not a symbol. The actual API surface
// (List, ForEach, Section, NavigationLink) lives on individual pages.
// This page summarizes the article and links back to the underlying APIs.

struct DisplayingDataInListsPage: View {
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
            Text("Displaying data in lists")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Visualize collections of data with platform-appropriate appearance.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/displaying-data-in-lists.md (article)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default — minimal staff-directory example from the article

    private var defaultDemo: some View {
        DemoCard(api: "List { ForEach(staff) { Text($0.name) } }") {
            List {
                ForEach(staff) { person in
                    Text(person.name)
                }
            }
        }
    }

    // MARK: Variants — the article's three escalations

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "1. Custom row view (PersonRowView equivalent)") {
                DemoCard(api: "List { ForEach(staff) { PersonRowView(person:) } }") {
                    List {
                        ForEach(staff) { person in
                            PersonRowView(person: person)
                        }
                    }
                }
            }

            VariantBlock(title: "2. Sectioned by department") {
                DemoCard(api: "List { ForEach(company.departments) { Section(header:) { ForEach(staff) { … } } } }") {
                    List {
                        ForEach(company.departments) { department in
                            Section {
                                ForEach(department.staff) { person in
                                    PersonRowView(person: person)
                                }
                            } header: {
                                Text(department.name)
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "3. Navigation-aware (NavigationStack + NavigationLink)") {
                DemoCard(api: "NavigationStack { List { … NavigationLink { Detail } label: { Row } } }",
                         height: 320) {
                    NavigationStack {
                        List {
                            ForEach(company.departments) { department in
                                Section {
                                    ForEach(department.staff) { person in
                                        NavigationLink {
                                            PersonDetailView(person: person)
                                        } label: {
                                            PersonRowView(person: person)
                                        }
                                    }
                                } header: {
                                    Text(department.name)
                                }
                            }
                        }
                        .navigationTitle("Staff")
                    }
                }
            }
        }
    }

    // MARK: States — link out to deeper pages

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This is an article, not a symbol — the actual API surface is documented on individual SwiftKit pages.")
                .font(.callout)
                .foregroundStyle(.secondary)

            CrossRef(symbol: "List", note: "Container that draws rows and provides selection chrome.")
            CrossRef(symbol: "ForEach", note: "Generates child views from an Identifiable / id-keyed collection.")
            CrossRef(symbol: "Section", note: "Groups rows under a header and/or footer.")
            CrossRef(symbol: "OutlineGroup / DisclosureGroup", note: "Hierarchy beyond a single section level.")
            CrossRef(symbol: "NavigationStack / NavigationLink", note: "Drill-down navigation from a list row.")
        }
    }

    // MARK: Notes

    private struct ArticleNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ArticleNote] = [
        .init(title: "Identity must be unique and stable.",
              detail: "Per the article: 'The values you use for Identifiable data must be unique. Using a UUID or a database row identifier are both good choices, whereas using data like a person's name or phone number could potentially contain duplicates.' Identity drives diffing animations and selection.",
              symbol: "person.badge.key"),
        .init(title: "Reach for OutlineGroup / DisclosureGroup for deeper hierarchy.",
              detail: "Per the article note: if your data has more than one level of grouping, the section approach gets cumbersome. OutlineGroup walks an arbitrary tree; DisclosureGroup lets you author one collapsible section by hand.",
              symbol: "list.triangle"),
        .init(title: "If you don't need List chrome, reach for LazyVStack.",
              detail: "Per the article note: 'If you want to remove the platform-appropriate styling — such as row separators or automatic disclosure indicators — from your list, consider using LazyVStack instead.' LazyVStack lazily creates rows as they scroll into view without the List's chrome.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Refactor row views as they grow.",
              detail: "Per the article: 'As your row views get more sophisticated, refactor the views into separate view structures, passing in the data that the row needs to render.' Inline row builders inside ForEach become unreadable past a few lines — pull them out.",
              symbol: "function"),
        .init(title: "Wrap with NavigationStack for drill-down navigation.",
              detail: "Per the article: NavigationLink in a List inside a NavigationStack is the canonical pattern for a row → detail relationship. The framework handles navigation chrome and back behavior.",
              symbol: "arrow.right.circle")
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

// MARK: - Article model (mirrors the doc's example)

private struct Person: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let phoneNumber: String
}

private struct Department: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let staff: [Person]
}

private struct Company {
    let departments: [Department]
}

private let staff: [Person] = [
    Person(name: "Juan Chavez", phoneNumber: "(408) 555-4301"),
    Person(name: "Mei Chen",     phoneNumber: "(919) 555-2481")
]

private let company = Company(departments: [
    Department(name: "Sales", staff: [
        Person(name: "Juan Chavez", phoneNumber: "(408) 555-4301"),
        Person(name: "Mei Chen",     phoneNumber: "(919) 555-2481")
    ]),
    Department(name: "Engineering", staff: [
        Person(name: "Bill James",   phoneNumber: "(408) 555-4450"),
        Person(name: "Anne Johnson", phoneNumber: "(417) 555-9311")
    ])
])

private struct PersonRowView: View {
    let person: Person

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(person.name)
                .font(.headline)
                .foregroundStyle(.primary)
            Label(person.phoneNumber, systemImage: "phone")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

private struct PersonDetailView: View {
    let person: Person

    var body: some View {
        VStack(spacing: 12) {
            Text(person.name)
                .font(.title)
                .foregroundStyle(.primary)
            Label(person.phoneNumber, systemImage: "phone")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

// MARK: - Reusable display helpers

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat = 240
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: 380, height: height)
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

private struct CrossRef: View {
    let symbol: String
    let note: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Text(symbol)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 220, alignment: .leading)
            Text(note)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    DisplayingDataInListsPage()
        .frame(width: 1100, height: 800)
}
