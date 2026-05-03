import SwiftUI

// SwiftUI `ListStyle` protocol reference page.
// Source: Documentation/SwiftUI/view-styles/liststyle.md
// macOS 10.15+. Marker protocol; required members are SPI. SwiftKit documents
// the built-in conformers and does not author custom ones.

struct ListStyleProtocolPage: View {
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
            Text("ListStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A protocol that describes the behavior and appearance of a list.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/liststyle.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        LSPCodeBlock(text:
            """
            @MainActor protocol ListStyle {
                // Required members are SPI.
                // Use the built-in conformers via literal style values.
            }

            // Apply via:
            // List { … }.listStyle(.sidebar)
            """)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Built-in conformers on macOS")
                .font(.headline)
            LSPCodeBlock(text:
                """
                .automatic       — DefaultListStyle
                .bordered        — BorderedListStyle
                .inset           — InsetListStyle
                .plain           — PlainListStyle
                .sidebar         — SidebarListStyle
                """)
            Text("Four additional values exist for iOS/watchOS but fall back on macOS:")
                .font(.callout)
                .foregroundStyle(.secondary)
            LSPCodeBlock(text:
                """
                .grouped         — iOS-only (silent fallback on macOS)
                .insetGrouped    — iOS-only
                .carousel        — watchOS-only
                .elliptical      — watchOS-only
                """)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Inheritance and override")
                .font(.headline)
            Text("ListStyle propagates through the environment. The nearest .listStyle(_:) modifier wins for each List.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LSPCodeBlock(text:
                """
                ScrollView {
                    List { … }       // sidebar
                }
                .listStyle(.sidebar)

                List { … }           // bordered (overrides outer)
                    .listStyle(.bordered)
                """)
        }
    }

    private struct LSPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LSPNote] = [
        .init(title: "Marker protocol — public conformance is impractical.",
              detail: "Required members are private SPI. SwiftKit documents the protocol surface and the built-in conformers; per project hard constraint, no custom ListStyle types ship.",
              symbol: "lock"),
        .init(title: "Built-in conformer types are also private.",
              detail: "You don't reference DefaultListStyle / SidebarListStyle / etc. directly — use the literal .automatic / .sidebar values which resolve to the appropriate conformer.",
              symbol: "doc.text"),
        .init(title: "See the ListStyleModifier page for visual differences.",
              detail: "This page describes the protocol; the .listStyle(_:) page renders each style against identical content for side-by-side comparison.",
              symbol: "rectangle.split.2x1"),
        .init(title: "iOS-only conformers compile but no-op on macOS.",
              detail: ".grouped / .insetGrouped / .carousel / .elliptical compile fine — they just silently fall back to .automatic when run on macOS.",
              symbol: "exclamationmark.triangle")
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

private struct LSPCodeBlock: View {
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
    ListStyleProtocolPage()
        .frame(width: 1100, height: 900)
}
