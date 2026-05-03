import SwiftUI

// SwiftUI `SearchToolbarBehavior` reference page.
// Source: Documentation/SwiftUI/toolbars/searchtoolbarbehavior.md
// macOS 26.0+. Used with View/searchToolbarBehavior(_:). Two cases:
// .automatic and .minimize.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct SearchToolbarBehaviorPage: View {
    @State private var queryAutomatic = ""

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
            Text("SearchToolbarBehavior")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Controls the behavior of a search field that lives in the toolbar. Applied via .searchToolbarBehavior(_:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/searchtoolbarbehavior.md \u{00b7} macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".searchToolbarBehavior(.automatic)") {
            NavigationStack {
                Text(".automatic \u{2014} system default behavior for the toolbar search field")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .searchable(text: $queryAutomatic)
                    .searchToolbarBehavior(.automatic)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} system default") {
                DemoFrame(api: ".searchToolbarBehavior(.automatic)") {
                    NavigationStack {
                        Text("query = \"\(queryAutomatic)\"")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .searchable(text: $queryAutomatic)
                            .searchToolbarBehavior(.automatic)
                    }
                }
            }

            VariantBlock(title: ".minimize \u{2014} iOS / iPadOS only (unavailable on macOS)") {
                APICallout(".searchToolbarBehavior(.minimize) // iOS / iPadOS")
                Text("SearchToolbarBehavior.minimize is unavailable on macOS. On iOS / iPadOS it collapses the search field into a magnifying-glass icon when not focused. macOS toolbars don't expose this collapsing chrome \u{2014} use the .automatic case.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Companion APIs") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".searchable(text:) \u{2014} the search field this behavior styles", systemImage: "magnifyingglass")
                    Label("DefaultToolbarItem(kind: .search, placement:) \u{2014} explicit placement of the system search item", systemImage: "rectangle.connected.to.line.below")
                    Label(".toolbar(removing: .search) \u{2014} drop the system search item entirely", systemImage: "minus.circle")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "macOS 26+ \u{2014} brand-new in this release.",
              detail: "Earlier macOS releases didn't expose this knob. The toolbar search field appearance was fixed by the system.",
              symbol: "calendar"),
        .init(title: ".automatic vs .minimize.",
              detail: ".automatic = standard system behavior (full-width or collapsed per platform/context). .minimize = always start collapsed as a magnifying-glass icon and expand to a field on focus.",
              symbol: "arrow.up.right.and.arrow.down.left"),
        .init(title: "Equatable, Hashable, Sendable.",
              detail: "Cheap to compare and store; safe to ferry across actor boundaries.",
              symbol: "tag"),
        .init(title: "Works in tandem with .searchable.",
              detail: "On its own the modifier has no effect \u{2014} it modifies the behavior of an existing .searchable field that has been hoisted into the toolbar by the system.",
              symbol: "magnifyingglass")
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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

#Preview {
    SearchToolbarBehaviorPage()
        .frame(width: 1100, height: 900)
}
