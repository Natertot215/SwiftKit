import SwiftUI

// SwiftUI `View/tabViewStyle(_:)` reference page.
// Source: Documentation/SwiftUI/navigation/tabviewstyle(_:).md
// macOS 11.0+. Documented macOS-renderable styles:
//   .automatic           — system default (horizontal tab strip)
//   .sidebarAdaptable    — collapses tabs into a sidebar (macOS 15+)
// Page styles (.page, .pageAutomaticIndex, .pageAlwaysIndex) are iOS-flavored;
// their behavior on macOS is degenerate so they're not surfaced here.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct TabViewStylePage: View {
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
            Text("View/tabViewStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for the tab view within the current environment.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabviewstyle(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".tabViewStyle(.automatic)") {
            sample.tabViewStyle(.automatic)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic — system default") {
                DemoCard(api: ".tabViewStyle(.automatic)") {
                    sample.tabViewStyle(.automatic)
                }
            }

            VariantBlock(title: ".sidebarAdaptable — sidebar layout, supports TabSection + customization") {
                DemoCard(api: ".tabViewStyle(.sidebarAdaptable)") {
                    sectionedSample.tabViewStyle(.sidebarAdaptable)
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Side-by-side — same content, both documented macOS styles. The default tab strip lives in the chrome below the title bar; the sidebar style moves the tabs into a vertical column on the leading edge.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".automatic")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewStyle(.automatic)") {
                        sample.tabViewStyle(.automatic)
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".sidebarAdaptable")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewStyle(.sidebarAdaptable)") {
                        sample.tabViewStyle(.sidebarAdaptable)
                    }
                }
            }
        }
    }

    private var sample: some View {
        TabView {
            Tab("Home",     systemImage: "house")        { pane("Home") }
            Tab("Browse",   systemImage: "list.bullet")  { pane("Browse") }
            Tab("Settings", systemImage: "gear")         { pane("Settings") }
        }
    }

    private var sectionedSample: some View {
        TabView {
            Tab("Home", systemImage: "house") { pane("Home") }
            TabSection("Mail") {
                Tab("Inbox", systemImage: "tray")        { pane("Inbox") }
                Tab("Sent",  systemImage: "paperplane")  { pane("Sent") }
            }
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

    private struct TVSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TVSNote] = [
        .init(title: "Two macOS-renderable styles — .automatic and .sidebarAdaptable.",
              detail: ".automatic gives the system default (a horizontal tab strip on macOS). .sidebarAdaptable moves the tabs into a vertical sidebar and exposes section headers, customization affordances, and the sidebar-only modifiers.",
              symbol: "paintbrush"),
        .init(title: "Page styles are iOS-flavored.",
              detail: ".page, .pageAutomaticIndex, .pageAlwaysIndex render the swipeable carousel on iOS. macOS doesn't have native swipe-paged tabs — the modifier compiles but doesn't produce that UI here.",
              symbol: "iphone"),
        .init(title: "TabSection / sidebar header / footer / bottom-bar all require .sidebarAdaptable.",
              detail: "The sidebar-flavored modifiers (.tabViewSidebarHeader, .tabViewSidebarFooter, .tabViewSidebarBottomBar, .tabViewCustomization) only render their content when the TabView is in .sidebarAdaptable mode. With .automatic they're silently no-ops.",
              symbol: "sidebar.left"),
        .init(title: "Style is environmental — applies to all descendant TabViews.",
              detail: "Like other style modifiers, .tabViewStyle(_:) writes to the environment. Nesting TabViews inherits the outer style unless you reapply the modifier closer to the inner view.",
              symbol: "arrow.down")
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
    TabViewStylePage()
        .frame(width: 1200, height: 900)
}
