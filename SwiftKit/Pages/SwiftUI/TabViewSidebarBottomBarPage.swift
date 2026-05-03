import SwiftUI

// SwiftUI `View/tabViewSidebarBottomBar(content:)` reference page.
// Source: Documentation/SwiftUI/navigation/tabviewsidebarbottombar(content:).md
// macOS 15.0+. Pins a custom bottom bar to the floor of the sidebar in a tab view.
// Unlike .tabViewSidebarFooter (which scrolls), the bottom bar stays anchored.
// Requires .tabViewStyle(.sidebarAdaptable).

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

struct TabViewSidebarBottomBarPage: View {
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
            Text("View/tabViewSidebarBottomBar(content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a custom bottom bar to the sidebar of a tab view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabviewsidebarbottombar(content:).md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".tabViewSidebarBottomBar { Button(\"Account\", systemImage: \"person.crop.circle\") { … } }") {
            sidebarTabView
                .tabViewSidebarBottomBar {
                    Button("Account", systemImage: "person.crop.circle") { }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Single account button") {
                DemoCard(api: ".tabViewSidebarBottomBar { Button(\"Account\", systemImage:) { … } }") {
                    sidebarTabView
                        .tabViewSidebarBottomBar {
                            Button("Account", systemImage: "person.crop.circle") { }
                                .padding(8)
                        }
                }
            }

            VariantBlock(title: "Toolbar of multiple controls") {
                DemoCard(api: ".tabViewSidebarBottomBar { HStack { Button(...); Button(...); Button(...) } }") {
                    sidebarTabView
                        .tabViewSidebarBottomBar {
                            HStack(spacing: 4) {
                                Button("", systemImage: "plus") { }
                                Button("", systemImage: "gear") { }
                                Spacer()
                                Button("", systemImage: "person.crop.circle") { }
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                        }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Bottom bar is visible only in .sidebarAdaptable. Other styles drop it silently.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".sidebarAdaptable — bottom bar pinned")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewSidebarBottomBar { Button(...) }") {
                        sidebarTabView
                            .tabViewSidebarBottomBar {
                                Button("Account", systemImage: "person.crop.circle") { }
                                    .padding(8)
                            }
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".automatic — bottom bar hidden")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewSidebarBottomBar { … } .tabViewStyle(.automatic)") {
                        TabView {
                            Tab("Home",   systemImage: "house")        { pane("Home") }
                            Tab("Browse", systemImage: "list.bullet")  { pane("Browse") }
                        }
                        .tabViewSidebarBottomBar {
                            Button("Account", systemImage: "person.crop.circle") { }
                        }
                        .tabViewStyle(.automatic)
                    }
                }
            }
        }
    }

    private var sidebarTabView: some View {
        TabView {
            Tab("Home",   systemImage: "house")        { pane("Home") }
            Tab("Alerts", systemImage: "bell")         { pane("Alerts") }
            Tab("Browse", systemImage: "list.bullet")  { pane("Browse") }
        }
        .tabViewStyle(.sidebarAdaptable)
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

    private struct TVSBNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TVSBNote] = [
        .init(title: "Pinned to the floor — does not scroll.",
              detail: "The defining behavior versus .tabViewSidebarFooter: this bar stays at the bottom of the sidebar regardless of scroll position. Use it for controls that must always be reachable.",
              symbol: "rectangle.bottomthird.inset.filled"),
        .init(title: "Renders only in .sidebarAdaptable.",
              detail: "Same rule as the other sidebar accessories — the modifier compiles in any TabView context but content surfaces only when the tab view adopts the sidebar layout.",
              symbol: "sidebar.left"),
        .init(title: "Common contents — account button, settings shortcut, status indicator.",
              detail: "Apple's example is an account button. Mail-style apps put account switchers here; sketch tools sometimes pin a tool palette.",
              symbol: "person.crop.circle"),
        .init(title: "Composes with .tabViewSidebarHeader and .tabViewSidebarFooter.",
              detail: "Header scrolls at the top, footer scrolls at the bottom, bottom bar pins to the floor. The three modifiers can all coexist on the same TabView.",
              symbol: "rectangle.split.3x1")
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
    TabViewSidebarBottomBarPage()
        .frame(width: 1200, height: 900)
}
