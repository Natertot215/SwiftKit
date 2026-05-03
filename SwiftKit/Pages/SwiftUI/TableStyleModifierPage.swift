import SwiftUI

// SwiftUI `View/tableStyle(_:)` reference page.
// Source: Documentation/SwiftUI/view-styles/tablestyle(_:).md
// macOS 12.0+. Built-in style values: .automatic, .bordered (with isAlternatingRowBackgrounds),
// .inset (with isAlternatingRowBackgrounds), .columnHeader (macOS 14+).

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 220

private struct TSMRow: Identifiable, Hashable {
    let id: Int
    let title: String
    let count: Int
}

private let rows: [TSMRow] = [
    TSMRow(id: 0, title: "Engineering", count: 12),
    TSMRow(id: 1, title: "Design",       count: 5),
    TSMRow(id: 2, title: "Research",     count: 7),
    TSMRow(id: 3, title: "Operations",   count: 3)
]

struct TableStyleModifierPage: View {
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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/tableStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for tables within this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/tablestyle(_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TSMCard(title: ".automatic", api: ".tableStyle(.automatic)") {
            sampleTable.tableStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Built-in TableStyle values on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                TSMCard(title: ".automatic", api: ".tableStyle(.automatic)") {
                    sampleTable.tableStyle(.automatic)
                }
                TSMCard(title: ".bordered", api: ".tableStyle(.bordered)") {
                    sampleTable.tableStyle(.bordered)
                }
                TSMCard(title: ".bordered(alternates: true)", api: ".tableStyle(.bordered(alternatesRowBackgrounds: true))") {
                    sampleTable.tableStyle(.bordered(alternatesRowBackgrounds: true))
                }
                TSMCard(title: ".inset", api: ".tableStyle(.inset)") {
                    sampleTable.tableStyle(.inset)
                }
                TSMCard(title: ".inset(alternates: true)", api: ".tableStyle(.inset(alternatesRowBackgrounds: true))") {
                    sampleTable.tableStyle(.inset(alternatesRowBackgrounds: true))
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

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Inheritance — applies to nested Table views")
                .font(.headline)
            Text(".tableStyle propagates down. The nearest enclosing modifier wins for each Table.")
                .font(.callout)
                .foregroundStyle(.secondary)
            TSMCodeBlock(text:
                """
                NavigationStack {
                    Table(rows) { … }
                }
                .tableStyle(.bordered(alternatesRowBackgrounds: true))
                """)
        }
    }

    private struct TSMNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TSMNote] = [
        .init(title: ".bordered draws an outline; .inset is borderless inset.",
              detail: ".bordered matches macOS NSTableView with a border; .inset has rows pulled in from the edge with no outer outline. .automatic resolves to one of these per context.",
              symbol: "tablecells"),
        .init(title: "alternatesRowBackgrounds is a per-style modifier.",
              detail: "Both .bordered(alternatesRowBackgrounds:) and .inset(alternatesRowBackgrounds:) take a Bool. Use .alternatingRowBackgrounds(_:) modifier for finer control.",
              symbol: "rectangle.split.2x1"),
        .init(title: "macOS 12.0+ for Table itself.",
              detail: "Table debuted on macOS 12. iOS support arrived later but is more limited (no out-of-the-box selection-via-shift-click, etc).",
              symbol: "calendar"),
        .init(title: "TableStyle is the underlying protocol.",
              detail: "All built-in styles conform to TableStyle. SwiftKit does NOT author custom conformers per project hard constraint.",
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

private struct TSMCard<Content: View>: View {
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
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct TSMCodeBlock: View {
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
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    TableStyleModifierPage()
        .frame(width: 1200, height: 1000)
}
