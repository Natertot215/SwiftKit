import SwiftUI

// SwiftUI `TableStyle` family — merged page covering:
//   1. View/tableStyle(_:) modifier
//   2. TableStyle protocol and its built-in conformers
//   3. TableStyleConfiguration — the type-erased configuration passed to custom conformers
// Source: Documentation/SwiftUI/view-styles/tablestyle(_:).md,
//         Documentation/SwiftUI/view-styles/tablestyle.md,
//         Documentation/SwiftUI/view-styles/tablestyleconfiguration.md
// macOS 12.0+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 220

private struct TSRow: Identifiable, Hashable {
    let id: Int
    let title: String
    let count: Int
}

private let rows: [TSRow] = [
    TSRow(id: 0, title: "Engineering", count: 12),
    TSRow(id: 1, title: "Design",       count: 5),
    TSRow(id: 2, title: "Research",     count: 7),
    TSRow(id: 3, title: "Operations",   count: 3)
]

struct TableStylePage: View {
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
            Text("tableStyle(_:) + TableStyle + TableStyleConfiguration")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The modifier that sets a table's appearance, the protocol conformers implement, and the configuration type passed to custom conformers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/tablestyle(_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        TSCard(title: ".automatic", api: ".tableStyle(.automatic)") {
            sampleTable.tableStyle(.automatic)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 40) {

            // Section 1: tableStyle(_:) modifier — live demos
            Group {
                Text("View/tableStyle(_:)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 12) {
                    Text("Sets the style for tables within this view. Built-in style values on macOS: .automatic, .bordered, .inset — each with an optional alternating-row-backgrounds variant.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("func tableStyle<S: TableStyle>(_ style: S) -> some View")
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
                    ], alignment: .leading, spacing: 24) {
                        TSCard(title: ".automatic", api: ".tableStyle(.automatic)") {
                            sampleTable.tableStyle(.automatic)
                        }
                        TSCard(title: ".bordered", api: ".tableStyle(.bordered)") {
                            sampleTable.tableStyle(.bordered)
                        }
                        TSCard(title: ".bordered(alternates: true)", api: ".tableStyle(.bordered(alternatesRowBackgrounds: true))") {
                            sampleTable.tableStyle(.bordered(alternatesRowBackgrounds: true))
                        }
                        TSCard(title: ".inset", api: ".tableStyle(.inset)") {
                            sampleTable.tableStyle(.inset)
                        }
                        TSCard(title: ".inset(alternates: true)", api: ".tableStyle(.inset(alternatesRowBackgrounds: true))") {
                            sampleTable.tableStyle(.inset(alternatesRowBackgrounds: true))
                        }
                    }
                }
            }

            // Section 2: TableStyle protocol
            Group {
                Text("TableStyle")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 12) {
                    Text("A type that applies a custom appearance to all tables within a view. Custom conformers receive a TableStyleConfiguration and return a Body view. SwiftKit does not author custom TableStyle conformers per project hard constraint.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    TSCodeBlock(text:
                        """
                        @MainActor protocol TableStyle {
                            associatedtype Body : View
                            typealias Configuration = TableStyleConfiguration

                            @ViewBuilder @MainActor
                            func makeBody(configuration: Self.Configuration) -> Self.Body
                        }
                        """)

                    Text("Built-in conformers on macOS")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    TSCodeBlock(text:
                        """
                        .automatic                                  — DefaultTableStyle
                        .bordered                                   — BorderedTableStyle
                        .bordered(alternatesRowBackgrounds: Bool)
                        .inset                                      — InsetTableStyle
                        .inset(alternatesRowBackgrounds: Bool)
                        """)
                }
            }

            // Section 3: TableStyleConfiguration
            Group {
                Text("TableStyleConfiguration")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 12) {
                    Text("The properties of a table, passed to a TableStyle conformer's makeBody. Unlike most style configurations, TableStyleConfiguration is itself a View — render it directly to inherit Apple's row layout, then decorate as needed.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    TSCodeBlock(text:
                        """
                        struct TableStyleConfiguration : View {
                            // No public stored properties; the configuration IS
                            // the renderable type-erased Table content.
                        }
                        """)

                    Text("Usage inside a custom TableStyle conformer")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    TSCodeBlock(text:
                        """
                        struct MyTableStyle: TableStyle {
                            func makeBody(configuration: Configuration) -> some View {
                                configuration
                                    .background(.background.secondary)
                                    .cornerRadius(8)
                            }
                        }
                        """)

                    Text("Unlike LabelStyleConfiguration / GaugeStyleConfiguration, you don't pull .label or .icon from TableStyleConfiguration — you just render it and the Table draws itself.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private var sampleTable: some View {
        Table(rows) {
            TableColumn("Department", value: \.title)
            TableColumn("Headcount") { Text("\($0.count)") }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Inheritance — applies to nested Table views")
                .font(.headline)
                .foregroundStyle(.primary)
            Text(".tableStyle propagates down the view hierarchy. The nearest enclosing modifier wins for each Table.")
                .font(.callout)
                .foregroundStyle(.secondary)
            TSCodeBlock(text:
                """
                NavigationStack {
                    Table(rows) { … }
                }
                .tableStyle(.bordered(alternatesRowBackgrounds: true))
                """)
        }
    }

    // MARK: Notes

    private struct TSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TSNote] = [
        .init(title: ".bordered draws an outline; .inset is borderless inset.",
              detail: ".bordered matches macOS NSTableView with a border; .inset has rows pulled in from the edge with no outer outline. .automatic resolves to one of these per context.",
              symbol: "tablecells"),
        .init(title: "alternatesRowBackgrounds is a per-style modifier.",
              detail: "Both .bordered(alternatesRowBackgrounds:) and .inset(alternatesRowBackgrounds:) take a Bool. Use .alternatingRowBackgrounds(_:) modifier for finer control.",
              symbol: "rectangle.split.2x1"),
        .init(title: "TableStyleConfiguration IS the renderable view.",
              detail: "Unlike most style configurations, TableStyleConfiguration conforms to View — you render it directly and the Table draws itself inside it. You can't introspect rows, columns, or selection.",
              symbol: "rectangle"),
        .init(title: "macOS 12.0+ for Table and all TableStyle surface.",
              detail: "Table debuted on macOS 12. iOS gained it later with a narrower API surface — no NSTableView-style row selection chrome out of the box.",
              symbol: "macwindow"),
        .init(title: "SwiftKit does not author custom TableStyle conformers.",
              detail: "Per project hard constraint, SwiftKit documents the built-in styles and protocol surface — it does not implement custom conformers that re-invent Apple's primitives.",
              symbol: "lock")
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

// MARK: - Page-local demo helpers

private struct TSCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TSCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview {
    TableStylePage()
        .frame(width: 1200, height: 1400)
}
