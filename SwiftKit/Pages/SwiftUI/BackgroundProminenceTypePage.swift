import SwiftUI

// SwiftUI `BackgroundProminence` (struct) reference page.
// Source: Documentation/SwiftUI/lists/backgroundprominence.md
// Two documented values:
//   .standard
//   .increased
// Read via @Environment(\.backgroundProminence) inside row content to adjust
// foreground styling against accent-filled selection chrome. macOS 14.0+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 240

private struct Item: Identifiable, Hashable {
    let title: String
    let id = UUID()
}

private let items: [Item] = [
    Item(title: "Inbox"),
    Item(title: "Drafts"),
    Item(title: "Sent"),
    Item(title: "Junk"),
    Item(title: "Archive")
]

private struct ProminenceAwareRow: View {
    @Environment(\.backgroundProminence) private var prominence
    let title: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: prominence == .increased ? "circle.fill" : "circle")
                .imageScale(.small)
                .foregroundStyle(prominence == .increased ? .primary : .secondary)
            Text(title)
                .foregroundStyle(prominence == .increased ? .primary : .primary)
            Spacer(minLength: 0)
            Text(prominence == .increased ? "increased" : "standard")
                .font(.caption2)
                .fontDesign(.monospaced)
                .foregroundStyle(prominence == .increased ? AnyShapeStyle(HierarchicalShapeStyle.primary.opacity(0.8)) : AnyShapeStyle(HierarchicalShapeStyle.secondary))
        }
    }
}

struct BackgroundProminenceTypePage: View {
    @State private var selection: Item.ID?

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
            Text("BackgroundProminence")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The prominence of backgrounds underneath other views.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/backgroundprominence.md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "@Environment(\\.backgroundProminence) — read inside a List row") {
            List(items, selection: $selection) { item in
                ProminenceAwareRow(title: item.title)
                    .tag(item.id)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Two documented cases") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".standard (no selection)", api: "BackgroundProminence.standard") {
                        Text(".standard\n(default)")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    StateColumn(label: ".increased (selected row)", api: "BackgroundProminence.increased") {
                        Text(".increased\n(accent fill)")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.tint, in: RoundedRectangle(cornerRadius: 6))
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Selection drives prominence in a List") {
                DemoCard(api: "List(selection:) — selected row reads .increased") {
                    List(items, selection: $selection) { item in
                        ProminenceAwareRow(title: item.title)
                            .tag(item.id)
                    }
                }
                Text("Click a row to flip its prominence to .increased — the trailing label updates accordingly.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private struct TypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TypeNote] = [
        .init(title: "An environment value, not a modifier.",
              detail: "Read with @Environment(\\.backgroundProminence). The framework writes this in contexts where the background is filled (e.g. selected List or Table rows on macOS); your row content reads it to adjust foreground styling for contrast.",
              symbol: "function"),
        .init(title: "Two values: .standard and .increased.",
              detail: ".standard is the inherited default. .increased fires when the surrounding background is rendered prominently — the canonical case is a selected row with an accent-filled background.",
              symbol: "switch.2"),
        .init(title: "Use to switch foreground styles per L-012.",
              detail: "Instead of hardcoding 'white text on selection', read backgroundProminence and switch between .primary / .secondary or .primary / Color.white based on prominence. Lets the framework decide when to flip.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Not just selection — any prominent background can write it.",
              detail: "Container code can also set the value via .environment(\\.backgroundProminence, .increased). Use this when authoring a custom list-like container that wants to mimic the system's foreground-adaptive behavior.",
              symbol: "rectangle.stack")
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
    BackgroundProminenceTypePage()
        .frame(width: 1100, height: 800)
}
