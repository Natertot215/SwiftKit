import SwiftUI

// SwiftUI `ContentToolbarPlacement` reference page.
// Source: Documentation/SwiftUI/toolbars/contenttoolbarplacement.md
// macOS 15.4+. Identifies content-area toolbars (e.g. the TabView sidebar's
// own toolbar surface). Currently exposes one type property: .tabViewSidebar.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ContentToolbarPlacementPage: View {
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
            Text("ContentToolbarPlacement")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Identifies a toolbar that lives inside the content area (e.g. the toolbar attached to a TabView's sidebar). Distinct from ToolbarPlacement, which targets window/navigation chrome.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/contenttoolbarplacement.md \u{00b7} macOS 15.4+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".tabViewSidebar \u{2014} the lone documented case") {
            VStack(alignment: .leading, spacing: 6) {
                Text("ContentToolbarPlacement.tabViewSidebar")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Used with .tabViewSidebarHeader / .tabViewSidebarFooter / .tabViewSidebarBottomBar to place toolbar content into a TabView's sidebar surface.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Single static case today: .tabViewSidebar") {
                APICallout("ContentToolbarPlacement.tabViewSidebar")
                Text("As of macOS 15.4 only one ContentToolbarPlacement is exposed. Future system releases may add more (e.g. inspector content bars).")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "Companion modifiers \u{2014} the consumers of ContentToolbarPlacement") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".tabViewSidebarHeader(content:)", systemImage: "rectangle.topthird.inset.filled")
                    Label(".tabViewSidebarFooter(content:)", systemImage: "rectangle.bottomthird.inset.filled")
                    Label(".tabViewSidebarBottomBar(content:)", systemImage: "rectangle.bottomthird.inset.filled")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Conformances") {
                VStack(alignment: .leading, spacing: 6) {
                    Label("Equatable, Hashable, Sendable, SendableMetatype", systemImage: "tag")
                        .font(.callout)
                        .foregroundStyle(.primary)
                }
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Different from ToolbarPlacement.",
              detail: "ToolbarPlacement targets system-managed bars (.windowToolbar, .navigationBar, .tabBar). ContentToolbarPlacement targets bars that are part of a content surface (currently the TabView sidebar).",
              symbol: "rectangle.split.2x1"),
        .init(title: "macOS 15.4+ \u{2014} new with the side-bar TabView APIs.",
              detail: "Tied to the macOS 15 sidebar TabView flow. On macOS 26 the TabView sidebar layout still uses this placement type for header/footer/bottom-bar slots.",
              symbol: "calendar"),
        .init(title: "One case today: .tabViewSidebar.",
              detail: "Apple may grow the surface (e.g. inspector content bars in future releases). Treat ContentToolbarPlacement as an extensible identifier.",
              symbol: "list.bullet"),
        .init(title: "Strongly typed sibling of ToolbarPlacement.",
              detail: "If a SwiftUI API takes ContentToolbarPlacement specifically, the bar is content-area. If it takes ToolbarPlacement, it's window/nav chrome.",
              symbol: "checkmark.seal")
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
    ContentToolbarPlacementPage()
        .frame(width: 1100, height: 900)
}
