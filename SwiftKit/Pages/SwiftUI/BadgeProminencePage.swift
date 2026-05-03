import SwiftUI

// SwiftUI `View/badgeProminence(_:)` reference page.
// Source: Documentation/SwiftUI/lists/badgeprominence(_:).md
// Single API:
//   func badgeProminence(_ prominence: BadgeProminence) -> some View
// Three values: .standard, .increased, .decreased.
// macOS 14.0+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 240

private struct BadgeFolder: Identifiable, Hashable {
    let name: String
    let count: Int
    let id = UUID()
}

private let folders: [BadgeFolder] = [
    BadgeFolder(name: "Drafts",  count: 3),
    BadgeFolder(name: "Inbox",   count: 12),
    BadgeFolder(name: "Sent",    count: 145),
    BadgeFolder(name: "Junk",    count: 8),
    BadgeFolder(name: "Archive", count: 2456)
]

struct BadgeProminencePage: View {
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
            Text("badgeProminence(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the prominence of badges created by this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/badgeprominence(_:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".badgeProminence(.decreased)") {
            List(folders) { folder in
                Text(folder.name)
                    .badge(folder.count)
            }
            .badgeProminence(.decreased)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three documented values — side by side") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".decreased", api: ".badgeProminence(.decreased)") {
                        list(prominence: .decreased)
                    }
                    StateColumn(label: ".standard", api: ".badgeProminence(.standard)") {
                        list(prominence: .standard)
                    }
                    StateColumn(label: ".increased", api: ".badgeProminence(.increased)") {
                        list(prominence: .increased)
                    }
                }
            }

            VariantBlock(title: "Per-row override — apply on individual rows") {
                DemoCard(api: "Text(...).badge(...).badgeProminence(.increased)") {
                    List {
                        Text("Standard")
                            .badge(5)
                        Text("Increased")
                            .badge(5)
                            .badgeProminence(.increased)
                        Text("Decreased")
                            .badge(5)
                            .badgeProminence(.decreased)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("badgeProminence is an enum-flavored modifier with three values, all shown side by side under Variants.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Three values: .standard / .increased / .decreased.",
              detail: "Standard is the inherited default. Increased emphasizes (e.g., red-tinted alert count). Decreased de-emphasizes (e.g., grey item count). BadgeProminence is the named type.",
              symbol: "switch.2"),
        .init(title: "Apply at List level for a uniform tone.",
              detail: ".badgeProminence on the List makes every contained badge use the chosen prominence. Override on individual rows by attaching the modifier directly to the row view.",
              symbol: "rectangle.stack"),
        .init(title: "Choose by semantic weight, not by aesthetic.",
              detail: "Decreased = passive count (folder size, 'how many items'). Standard = neutral (recent activity). Increased = required attention (unread alerts, action items). The doc explicitly frames the choice this way.",
              symbol: "exclamationmark.bubble"),
        .init(title: "Per-row override wins over the List-level value.",
              detail: "Apply at List level for the dominant case, then override individual rows that differ. Useful for marking one folder's count as 'urgent' without flagging every count in the list.",
              symbol: "arrow.up.right.square")
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

    private func list(prominence: BadgeProminence) -> some View {
        List(folders) { folder in
            Text(folder.name)
                .badge(folder.count)
        }
        .badgeProminence(prominence)
    }
}

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: height)
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

private struct StateColumn<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 220, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    BadgeProminencePage()
        .frame(width: 1100, height: 800)
}
