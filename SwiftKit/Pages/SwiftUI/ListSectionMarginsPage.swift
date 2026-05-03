import SwiftUI

// SwiftUI `View/listSectionMargins(_:_:)` reference page.
// Source: Documentation/SwiftUI/lists/listsectionmargins(_:_:).md
// Single API:
//   func listSectionMargins(_ edges: Edge.Set = .all, _ length: CGFloat?) -> some View
//
// IMPORTANT: .listSectionMargins(_:_:) is @available(macOS, unavailable) on
// macOS 26. The modifier is gated to iOS 26 / iPadOS 26 / Mac Catalyst 26 /
// visionOS 26. SwiftKit documents this page for API-surface completeness;
// no live demo is possible on macOS.

struct ListSectionMarginsPage: View {
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
            Text("listSectionMargins(_:_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Set the section margins for the specific edges.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listsectionmargins(_:_:).md · iOS 26.0+ (macOS UNAVAILABLE)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        unavailableNotice
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Documented examples (iOS only)")
                .font(.headline)
                .foregroundStyle(.primary)
            CodeBlock(text: ".listSectionMargins(.all, 20)")
            CodeBlock(text: ".listSectionMargins(.leading, 32)")
            CodeBlock(text: ".listSectionMargins([.leading, .trailing], 24)")
            CodeBlock(text: ".listSectionMargins(.all, nil) // restore default")
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
              detail: "Per the macOS 26 SDK swiftinterface, .listSectionMargins(_:_:) is gated to iOS / iPadOS / Mac Catalyst / visionOS at version 26.0+. macOS does not expose this modifier; section margins are derived from the list style and content margins.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Margins replace the style's defaults on the specified edges (iOS).",
              detail: "Per the doc: defaults are derived from the list style, list section spacing, and content margins. Calling this modifier overrides them completely on the named edges; other edges remain at their style-defined values.",
              symbol: "rectangle.dashed"),
        .init(title: "Edge.Set — name a single edge or combine with brackets.",
              detail: "Pass .all (default), a single edge (.leading / .trailing / .top / .bottom), or an OptionSet of edges (e.g., [.leading, .trailing]). Choose only the edges you want to override.",
              symbol: "square.dashed"),
        .init(title: "Margins wrap section header and footer too.",
              detail: "If a Section has a header or footer, the margins are applied around the entire section block — header and footer included.",
              symbol: "rectangle.topthird.inset.filled")
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
                Text(".listSectionMargins(_:_:) is unavailable on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Per the macOS 26 SDK, the modifier is gated to iOS 26 / iPadOS 26 / Mac Catalyst 26 / visionOS 26. SwiftKit can't show a live demo on macOS — see Variants for documented usage on supported platforms.")
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
    ListSectionMarginsPage()
        .frame(width: 1100, height: 800)
}
