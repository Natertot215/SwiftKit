import SwiftUI

// SwiftUI `TableStyleConfiguration` reference page.
// Source: Documentation/SwiftUI/view-styles/tablestyleconfiguration.md
// macOS 12.0+. Type-erased shape passed to a TableStyle conformer.

struct TableStyleConfigurationPage: View {
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
            Text("TableStyleConfiguration")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The properties of a table.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/tablestyleconfiguration.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TSCfgCodeBlock(text:
            """
            struct TableStyleConfiguration : View {
                // No public stored properties; the configuration IS the renderable
                // type-erased Table content. Render it directly to inherit Apple's
                // built-in row layout, then decorate as needed.
            }
            """)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Usage inside a custom TableStyle conformer")
                .font(.headline)
            TSCfgCodeBlock(text:
                """
                struct MyTableStyle: TableStyle {
                    func makeBody(configuration: Configuration) -> some View {
                        configuration
                            .background(.background.secondary)
                            .cornerRadius(8)
                    }
                }
                """)
            Text("SwiftKit does NOT author custom TableStyle conformers per project hard constraint.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Why TableStyleConfiguration is a View")
                .font(.headline)
            Text("Most SwiftUI style configurations expose individual sub-views (label, icon, value). TableStyleConfiguration is opaque — it bundles the entire rendered Table into a single View you decorate.")
                .font(.callout)
                .foregroundStyle(.secondary)
            TSCfgCodeBlock(text:
                """
                // Most style configurations:
                configuration.label
                configuration.icon

                // Table style configuration:
                configuration         // already a View — just render it
                """)
        }
    }

    private struct TSCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TSCNote] = [
        .init(title: "Configuration IS the renderable view.",
              detail: "Unlike LabelStyleConfiguration / GaugeStyleConfiguration / etc., you don't pull title or icon from this — you just render `configuration` and the Table draws itself.",
              symbol: "rectangle"),
        .init(title: "No public properties.",
              detail: "All Table state (rows, columns, selection, sorting) is internal. You can wrap and style — you can't introspect.",
              symbol: "lock"),
        .init(title: "Apply chrome via View modifiers on the configuration.",
              detail: ".background(_:), .padding(_:), .cornerRadius(_:), .overlay(_:) all work normally. The Table's own styling sits underneath.",
              symbol: "paintbrush"),
        .init(title: "Available since macOS 12.",
              detail: "Same vintage as Table itself. iOS gained it later with the same shape.",
              symbol: "calendar")
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

private struct TSCfgCodeBlock: View {
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
    TableStyleConfigurationPage()
        .frame(width: 1100, height: 800)
}
