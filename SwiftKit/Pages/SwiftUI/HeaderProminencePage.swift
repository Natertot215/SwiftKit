import SwiftUI

// SwiftUI `View/headerProminence(_:)` reference page.
// Source: Documentation/SwiftUI/lists/headerprominence(_:).md
// Single API:
//   func headerProminence(_ prominence: Prominence) -> some View
//
// IMPORTANT: .headerProminence(_:) and the Prominence type are
// @available(macOS, unavailable). The modifier exists on iOS / iPadOS /
// Mac Catalyst / tvOS / visionOS / watchOS — macOS does not expose either.
// SwiftKit documents this page for API-surface completeness; no live demo
// is possible on macOS.

struct HeaderProminencePage: View {
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
            Text("headerProminence(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the header prominence for this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/headerprominence(_:).md · iOS 15.0+ (macOS UNAVAILABLE)")
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
            CodeBlock(text: """
List {
    Section(header: Text("Header")) {
        Text("Row")
    }
    .headerProminence(.increased)
}
.listStyle(.insetGrouped)
""")
            CodeBlock(text: """
.headerProminence(.standard)   // inherited default
.headerProminence(.increased)  // emphasized header treatment
""")
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
              detail: "Per the macOS 26 SDK swiftinterface, .headerProminence(_:) and the Prominence type are gated to iOS / iPadOS / Mac Catalyst / tvOS / visionOS / watchOS. macOS does not expose either symbol — the modifier doesn't compile against the macOS interface.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Two values: .standard and .increased.",
              detail: "The Prominence enum is shared with other prominence-flavored modifiers. .standard is the inherited default; .increased uses a larger / bolder header treatment.",
              symbol: "switch.2"),
        .init(title: "Apply per-Section to mark hierarchy (iOS).",
              detail: "Attach to a Section (not the List) to make one group's header more prominent than its peers — useful for marking 'Today' vs 'Earlier' or a primary vs secondary group.",
              symbol: "rectangle.stack"),
        .init(title: "List style determines what 'increased' looks like.",
              detail: ".plain shows no headers, so the modifier has no visible effect. .insetGrouped (iOS) is the canonical surface for the doc's example.",
              symbol: "list.bullet")
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
                Text(".headerProminence(_:) is unavailable on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Per the macOS 26 SDK, both the modifier and the Prominence type are gated to iOS / iPadOS / Mac Catalyst / tvOS / visionOS / watchOS. SwiftKit can't show a live demo on macOS — see Variants for documented usage on supported platforms.")
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
    HeaderProminencePage()
        .frame(width: 1100, height: 800)
}
