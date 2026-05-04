import SwiftUI

// SwiftUI `View/tabItem(_:)` reference page.
// Source: Documentation/SwiftUI/navigation/tabitem(_:).md
// macOS 10.15+. Attaches a label to the enclosing tab in a TabView.
// The label closure uses a Label (icon + text) or similar view.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct TabItemPage: View {
    @State private var selection = 0

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
            Text("View/tabItem(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Attaches a label to a tab in a TabView, specifying the tab's icon and title in the tab bar.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabitem(_:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "Text(\u{201c}Content\u{201d}).tabItem { Label(\u{201c}Home\u{201d}, systemImage: \u{201c}house\u{201d}) }") {
            TabView(selection: $selection) {
                Text("Home tab")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(0)
                Text("Search tab")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tabItem { Label("Search", systemImage: "magnifyingglass") }
                    .tag(1)
                Text("Settings tab")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tabItem { Label("Settings", systemImage: "gearshape") }
                    .tag(2)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Label (icon + text) \u{2014} standard form") {
                DemoFrame(api: ".tabItem { Label(\u{201c}Inbox\u{201d}, systemImage: \u{201c}tray\u{201d}) }") {
                    TabView {
                        Text("Inbox content")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tabItem { Label("Inbox", systemImage: "tray") }
                        Text("Sent content")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tabItem { Label("Sent", systemImage: "paperplane") }
                    }
                }
            }

            VariantBlock(title: "Text only \u{2014} no icon") {
                DemoFrame(api: ".tabItem { Text(\u{201c}Overview\u{201d}) }") {
                    TabView {
                        Text("Overview content")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tabItem { Text("Overview") }
                        Text("Details content")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tabItem { Text("Details") }
                    }
                }
            }

            VariantBlock(title: "Image only \u{2014} no text") {
                DemoFrame(api: ".tabItem { Image(systemName: \u{201c}star\u{201d}) }") {
                    TabView {
                        Text("Favorites")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tabItem { Image(systemName: "star") }
                        Text("Recents")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tabItem { Image(systemName: "clock") }
                    }
                }
            }
        }
    }

    @State private var stateSelection = 0

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Active selection tracked with @State") {
                DemoFrame(api: "TabView(selection: $sel) { \u{2026}.tag(0) }  \u{2014} selection = \(stateSelection)") {
                    TabView(selection: $stateSelection) {
                        VStack {
                            Text("Tab 1 is active")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tabItem { Label("First", systemImage: "1.circle") }
                        .tag(0)
                        VStack {
                            Text("Tab 2 is active")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tabItem { Label("Second", systemImage: "2.circle") }
                        .tag(1)
                        VStack {
                            Text("Tab 3 is active")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tabItem { Label("Third", systemImage: "3.circle") }
                        .tag(2)
                    }
                }
            }
        }
    }

    private struct NoteItem {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NoteItem] = [
        .init(title: "tabItem(_:) is the legacy tab label API.",
              detail: "SwiftUI 5 (iOS 18 / macOS 15) introduced the newer Tab { } type with its own label init. tabItem(_:) remains the stable API for macOS 10.15\u{2013}14 targets and for simpler use cases.",
              symbol: "clock.badge.exclamationmark"),
        .init(title: "Only the first Text and Image in the closure are used.",
              detail: "The label closure is limited: the system picks the first Image (as icon) and the first Text (as title). Use Label to combine them naturally.",
              symbol: "exclamationmark.triangle"),
        .init(title: "On macOS the TabView renders as a segmented control or top-level tab bar.",
              detail: "The exact rendering depends on the TabViewStyle. Default (.automatic) on macOS uses a tab bar at the top of the view area.",
              symbol: "macwindow"),
        .init(title: "tag(_:) pairs with TabView(selection:) to track the active tab.",
              detail: "Attach .tag(value) alongside .tabItem. The selection binding matches against these tag values.",
              symbol: "tag")
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
    TabItemPage()
        .frame(width: 1100, height: 900)
}
