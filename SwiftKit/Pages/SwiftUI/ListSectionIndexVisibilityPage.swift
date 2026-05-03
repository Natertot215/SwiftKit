import SwiftUI

// SwiftUI `View/listSectionIndexVisibility(_:)` reference page.
// Source: Documentation/SwiftUI/lists/listsectionindexvisibility(_:).md
// Single API:
//   func listSectionIndexVisibility(_ visibility: Visibility) -> some View
//
// IMPORTANT: .listSectionIndexVisibility(_:) is @available(macOS, unavailable).
// The modifier is gated to iOS / iPadOS / Mac Catalyst / watchOS. SwiftKit
// documents this page for API-surface completeness; no live demo is possible
// on macOS.

struct ListSectionIndexVisibilityPage: View {
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
            Text("listSectionIndexVisibility(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Changes the visibility of the list section index.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listsectionindexvisibility(_:).md · iOS 26.0+ / watchOS 26.0+ (macOS UNAVAILABLE)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            unavailableNotice
            CodeBlock(text: """
List {
    Section("A") {
        Text("Apple"); Text("Apricot")
    }
    .sectionIndexLabel("A")
    Section("B") {
        Text("Banana"); Text("Blueberry")
    }
    .sectionIndexLabel("B")
}
.listSectionIndexVisibility(.visible)
""")
            APICallout(".listSectionIndexVisibility(.visible)")
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Three Visibility values (iOS / watchOS only)") {
                CodeBlock(text: ".listSectionIndexVisibility(.automatic)")
                CodeBlock(text: ".listSectionIndexVisibility(.visible)")
                CodeBlock(text: ".listSectionIndexVisibility(.hidden)")
            }

            VariantBlock(title: "Pair with .sectionIndexLabel") {
                Text("Section index labels are set per Section via .sectionIndexLabel(_:). The section-index control reads those labels and lays them out in a stacked column. Sections without a label do not appear in the index.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        unavailableNotice
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Unavailable on macOS.",
              detail: "Per the macOS 26 SDK swiftinterface, .listSectionIndexVisibility(_:) is annotated @available(macOS, unavailable). The visible behavior is on iOS (trailing-edge letter strip) and watchOS (crown scroll readout). macOS does not surface a section-index control.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Default: visible if any section has an index label.",
              detail: "Per the doc: 'By default, the list section index is visible if the list contains any sections with an index label.' Use .hidden to suppress, .visible to force-show, .automatic to defer to the platform default.",
              symbol: "switch.2"),
        .init(title: "Sections without .sectionIndexLabel are skipped in the index.",
              detail: "The section index only shows labels for sections that have called .sectionIndexLabel(_:). This means you can selectively expose some sections in the index and hide others.",
              symbol: "list.bullet.indent"),
        .init(title: "Macro-pattern: empty header + index label = synthetic index entries.",
              detail: "Per the doc: 'By hiding section headers of empty sections with an index label, a list section index can be made to show index labels without a corresponding section.' Useful for alphabetical scaffolding.",
              symbol: "wand.and.stars")
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

    // MARK: Helpers

    private var unavailableNotice: some View {
        Label {
            VStack(alignment: .leading, spacing: 4) {
                Text(".listSectionIndexVisibility(_:) is unavailable on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Per the macOS 26 SDK, the modifier is gated to iOS / iPadOS / Mac Catalyst / watchOS. SwiftKit can't show a live demo on macOS — see Variants for documented usage on supported platforms.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Reusable demo helpers (page-local)

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

private struct CodeBlock: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    ListSectionIndexVisibilityPage()
        .frame(width: 1100, height: 800)
}
