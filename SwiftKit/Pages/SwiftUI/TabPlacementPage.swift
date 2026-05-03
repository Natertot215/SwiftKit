import SwiftUI

// SwiftUI `TabPlacement` reference page.
// Source: Documentation/SwiftUI/navigation/tabplacement.md
// macOS 15.0+. Three documented type properties:
//   .automatic     — system places the tab in its default location
//   .pinned        — pin the tab to a specific position (style-dependent)
//   .sidebarOnly   — show this tab only in the sidebar layout
// Apply via TabContent/tabPlacement(_:). Not all TabView styles support all placements.

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

struct TabPlacementPage: View {
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
            Text("TabPlacement")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A place that a tab can appear.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabplacement.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Tab(...).tabPlacement(.sidebarOnly)") {
            TabView {
                Tab("Home",    systemImage: "house")        { pane("Home") }
                Tab("Browse",  systemImage: "list.bullet")  { pane("Browse") }
                Tab("Hidden",  systemImage: "eye.slash")    { pane("Hidden in non-sidebar styles") }
                    .tabPlacement(.sidebarOnly)
            }
            .tabViewStyle(.sidebarAdaptable)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic") {
                APICallout("Tab(...).tabPlacement(.automatic)  // system default")
            }
            VariantBlock(title: ".pinned") {
                APICallout("Tab(...).tabPlacement(.pinned)     // pinned position (style-dependent)")
            }
            VariantBlock(title: ".sidebarOnly") {
                APICallout("Tab(...).tabPlacement(.sidebarOnly)  // visible only when sidebar is shown")
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Side-by-side — same TabView under .sidebarAdaptable vs .automatic. The .sidebarOnly tab disappears from the .automatic strip.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".sidebarAdaptable — .sidebarOnly tab visible")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewStyle(.sidebarAdaptable)") {
                        sample.tabViewStyle(.sidebarAdaptable)
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".automatic — .sidebarOnly tab hidden")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewStyle(.automatic)") {
                        sample.tabViewStyle(.automatic)
                    }
                }
            }
        }
    }

    private var sample: some View {
        TabView {
            Tab("Home",   systemImage: "house")        { pane("Home") }
            Tab("Browse", systemImage: "list.bullet")  { pane("Browse") }
            Tab("Hidden", systemImage: "eye.slash")    { pane("Hidden") }
                .tabPlacement(.sidebarOnly)
        }
    }

    private func pane(_ title: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: "rectangle.stack")
                .font(.system(size: 32))
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: Notes

    private struct TPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TPNote] = [
        .init(title: "Three documented placements — .automatic, .pinned, .sidebarOnly.",
              detail: ".automatic delegates to the style. .pinned anchors the tab to a specific spot the style supports. .sidebarOnly hides the tab unless the TabView is showing its sidebar layout.",
              symbol: "switch.2"),
        .init(title: "Not every style supports every placement.",
              detail: "Apple's overview is explicit: not all TabView styles support all placements. .pinned is most relevant in styles that have a stable secondary location; .sidebarOnly assumes a sidebar exists.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Apply via .tabPlacement(_:) on TabContent.",
              detail: "The companion modifier is .tabPlacement(_:); attach it directly to a Tab. The placement value flows into the TabView's layout decision for that specific tab.",
              symbol: "arrow.up.right"),
        .init(title: "Equatable + Hashable.",
              detail: "TabPlacement conforms to Equatable and Hashable — usable as a dictionary key, in switch statements, and for change detection.",
              symbol: "circle.dashed")
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

// MARK: - Page-local helpers

private struct DemoCard<Content: View>: View {
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
    TabPlacementPage()
        .frame(width: 1200, height: 900)
}
