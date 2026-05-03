import SwiftUI

// SwiftUI `BadgeProminence` (struct) reference page.
// Source: Documentation/SwiftUI/lists/badgeprominence.md
// Three documented values:
//   .standard
//   .increased
//   .decreased
// Used as the argument to .badgeProminence(_:). macOS 14.0+.

private let demoFrameWidth: CGFloat = 220
private let demoFrameHeight: CGFloat = 220

private struct BadgeTypeFolder: Identifiable, Hashable {
    let name: String
    let count: Int
    let id = UUID()
}

private let folders: [BadgeTypeFolder] = [
    BadgeTypeFolder(name: "Drafts", count: 3),
    BadgeTypeFolder(name: "Inbox",  count: 12),
    BadgeTypeFolder(name: "Sent",   count: 145)
]

struct BadgeProminenceTypePage: View {
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
            Text("BadgeProminence")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The visual prominence of a badge.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/badgeprominence.md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".badgeProminence(.standard)") {
            List(folders) { f in
                Text(f.name)
                    .badge(f.count)
            }
            .badgeProminence(.standard)
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
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("BadgeProminence is a value type with three named cases. There are no per-instance states — see the variants above.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    // MARK: Notes

    private struct TypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TypeNote] = [
        .init(title: "Used as the argument to .badgeProminence(_:).",
              detail: "Choose by semantic weight: .decreased for passive counts (folder size), .standard for neutral activity, .increased for required attention. The doc frames the choice this way explicitly.",
              symbol: "function"),
        .init(title: "Default is .standard.",
              detail: "Per the doc: 'Badges will default to standard prominence unless specified.' Apply the modifier only when you need to deviate from the default.",
              symbol: "switch.2"),
        .init(title: "Conforms to Equatable, Hashable, Sendable.",
              detail: "Safe to store in @State / pass across actor boundaries. Three values mean an enum or struct fits — Apple ships this as an opaque struct with static members.",
              symbol: "checkmark.shield")
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
        List(folders) { f in
            Text(f.name)
                .badge(f.count)
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
                .frame(width: 360, height: height)
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
                .frame(width: demoFrameWidth, height: demoFrameHeight)
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
    BadgeProminenceTypePage()
        .frame(width: 1100, height: 800)
}
