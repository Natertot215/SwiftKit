import SwiftUI

// Shared describe-track page component.
// Used for APIs that can't render anything visible in a child SwiftUI view on macOS 26:
// iOS/visionOS-only APIs, Scene-level types, protocols, environment values, result builders, etc.
//
// Call site example:
//   DescribePage(
//       title: "CommandMenu",
//       docPath: "Documentation/SwiftUI/menus-and-commands/commandmenu.md",
//       availability: "macOS 11.0+",
//       signatures: ["CommandMenu(\"Help\") { Button … }"],
//       blurb: "…",
//       notes: ["Scene-scope only — place inside a WindowGroup or DocumentGroup commands modifier."]
//   )

struct DescribePage: View {
    // Required
    let title: String
    let docPath: String
    let availability: String
    let blurb: String

    // Optional
    var signatures: [String] = []
    var notes: [String] = []

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            signaturesBlock
        } variants: {
            blurbBlock
        } states: {
            statesNotice
        } notes: {
            notesBlock
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("\(docPath) \u{00b7} \(availability)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default — signatures as monospaced code blocks

    @ViewBuilder
    private var signaturesBlock: some View {
        if signatures.isEmpty {
            Text("No renderable signature — this API is a type, protocol, or environment value.")
                .font(.callout)
                .foregroundStyle(.secondary)
        } else {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(signatures, id: \.self) { sig in
                    APICallout(sig)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                }
            }
        }
    }

    // MARK: Variants — blurb prose

    private var blurbBlock: some View {
        Text(blurb)
            .font(.callout)
            .foregroundStyle(.secondary)
            .fixedSize(horizontal: false, vertical: true)
    }

    // MARK: States — not applicable notice

    private var statesNotice: some View {
        Text("Not applicable \u{2014} this API has no visible state on macOS.")
            .font(.callout)
            .foregroundStyle(.tertiary)
            .italic()
    }

    // MARK: Notes

    @ViewBuilder
    private var notesBlock: some View {
        if notes.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(notes, id: \.self) { note in
                    Label(note, systemImage: "info.circle")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    DescribePage(
        title: "ToolbarItemPlacement",
        docPath: "Documentation/SwiftUI/toolbars/toolbaritemplacement.md",
        availability: "macOS 11.0+",
        blurb: """
        The semantic placement for a toolbar item. SwiftUI maps each case to the \
        right slot per platform — .primaryAction is trailing on macOS, .principal \
        centers in the toolbar, .navigation hosts back/forward chrome, etc.

        This is an enum value, not a renderable view, so there's nothing visible \
        to demo on its own. See View/toolbar(content:) for live placement examples.
        """,
        signatures: [
            "ToolbarItem(placement: .principal)",
            ".automatic, .principal, .navigation, .primaryAction, ..."
        ],
        notes: [
            "Type, not a view — only meaningful when passed to ToolbarItem(placement:).",
            "Positional cases (.topBarLeading etc.) are iOS/iPadOS-only on macOS 26."
        ]
    )
    .frame(width: 900, height: 700)
}
