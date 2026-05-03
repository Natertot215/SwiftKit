import SwiftUI

// SwiftUI `TableStyle` protocol reference page.
// Source: Documentation/SwiftUI/view-styles/tablestyle.md
// macOS 12.0+. SwiftKit documents the protocol surface and built-in conformers.

struct TableStyleProtocolPage: View {
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
            Text("TableStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type that applies a custom appearance to all tables within a view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/tablestyle.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TSPCodeBlock(text:
            """
            @MainActor protocol TableStyle {
                associatedtype Body : View
                typealias Configuration = TableStyleConfiguration

                @ViewBuilder @MainActor
                func makeBody(configuration: Self.Configuration) -> Self.Body
            }
            """)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Built-in conformers on macOS")
                .font(.headline)
            TSPCodeBlock(text:
                """
                .automatic                                  — DefaultTableStyle
                .bordered                                   — BorderedTableStyle
                .bordered(alternatesRowBackgrounds: Bool)
                .inset                                      — InsetTableStyle
                .inset(alternatesRowBackgrounds: Bool)
                """)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("makeBody and Configuration")
                .font(.headline)
            Text("Custom conformers receive a TableStyleConfiguration and return a Body view. Per project hard constraint, SwiftKit does not author custom TableStyle conformers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            TSPCodeBlock(text:
                """
                func makeBody(configuration: Configuration) -> some View {
                    configuration
                        .background(.thinMaterial)
                }
                """)
        }
    }

    private struct TSPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TSPNote] = [
        .init(title: "TableStyleConfiguration is itself a View.",
              detail: "Unlike most style configurations, TableStyleConfiguration conforms to View — you render it directly inside makeBody.",
              symbol: "rectangle"),
        .init(title: "Bordered/inset variants are factory methods.",
              detail: ".bordered() / .inset() default to alternatesRowBackgrounds: false. The labeled overload toggles striping.",
              symbol: "function"),
        .init(title: "Apply via .tableStyle(_:) modifier.",
              detail: "Same inheritance pattern as other style modifiers. Inner override wins for the subtree.",
              symbol: "arrow.down"),
        .init(title: "macOS-first feature; iOS Table is more limited.",
              detail: "Table launched on macOS 12. iOS gained it later with a narrower API surface — no NSTableView-style row selection chrome out of the box.",
              symbol: "macwindow")
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

private struct TSPCodeBlock: View {
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
    TableStyleProtocolPage()
        .frame(width: 1100, height: 800)
}
