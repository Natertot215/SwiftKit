import SwiftUI

// SwiftUI `View/tabViewSidebarHeader(content:)` reference page.
// Source: Documentation/SwiftUI/navigation/tabviewsidebarheader(content:).md
// macOS 15.0+. Adds a custom header at the top of a sidebar-style TabView.
// The header scrolls with the sidebar content. Requires .tabViewStyle(.sidebarAdaptable).

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

struct TabViewSidebarHeaderPage: View {
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
            Text("View/tabViewSidebarHeader(content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a custom header to the sidebar of a tab view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabviewsidebarheader(content:).md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".tabViewSidebarHeader { Label(\"Welcome\", systemImage: \"hand.wave\") }") {
            sidebarTabView
                .tabViewSidebarHeader {
                    Label("Welcome", systemImage: "hand.wave")
                        .font(.headline)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Plain text header") {
                DemoCard(api: ".tabViewSidebarHeader { Text(\"My App\").font(.headline) }") {
                    sidebarTabView
                        .tabViewSidebarHeader {
                            Text("My App")
                                .font(.headline)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                        }
                }
            }

            VariantBlock(title: "Avatar + name — common Mail-style header") {
                DemoCard(api: ".tabViewSidebarHeader { HStack { Image(systemName:); Text(_) } }") {
                    sidebarTabView
                        .tabViewSidebarHeader {
                            HStack(spacing: 8) {
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.title)
                                    .foregroundStyle(.tint)
                                VStack(alignment: .leading) {
                                    Text("Nathan Taichman")
                                        .font(.headline)
                                    Text("nathan@example.com")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                        }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Header is visible only in .sidebarAdaptable. Switching to .automatic hides it without removing the modifier.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".sidebarAdaptable — header visible")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewSidebarHeader { Text(\"Header\").bold() }") {
                        sidebarTabView
                            .tabViewSidebarHeader {
                                Text("Header").bold()
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                            }
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".automatic — header hidden")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewSidebarHeader { … } .tabViewStyle(.automatic)") {
                        TabView {
                            Tab("Home",   systemImage: "house")        { pane("Home") }
                            Tab("Browse", systemImage: "list.bullet")  { pane("Browse") }
                        }
                        .tabViewSidebarHeader {
                            Text("Header (won't show)").bold()
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

    private struct TVSHNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TVSHNote] = [
        .init(title: "Renders only in .sidebarAdaptable mode.",
              detail: "The modifier compiles in any TabView context but the content surfaces only when the style is .sidebarAdaptable. Other styles silently drop the header.",
              symbol: "sidebar.left"),
        .init(title: "Scrolls with the sidebar content.",
              detail: "Unlike .tabViewSidebarBottomBar (which is pinned), the header scrolls along with the rest of the sidebar. For a fixed top accessory, you'd need a different layout.",
              symbol: "arrow.up.and.down"),
        .init(title: "Free-form view builder.",
              detail: "Pass anything — Label, HStack, custom logos, settings shortcuts. Apple's example uses a welcome message; Mail uses an avatar + account name; Notes uses an iCloud account picker.",
              symbol: "rectangle.dashed"),
        .init(title: "Companions — sidebarFooter and sidebarBottomBar.",
              detail: ".tabViewSidebarFooter scrolls at the bottom with the content; .tabViewSidebarBottomBar pins to the floor of the sidebar regardless of scroll. The three modifiers compose freely on the same TabView.",
              symbol: "rectangle.bottomthird.inset.filled")
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
    TabViewSidebarHeaderPage()
        .frame(width: 1200, height: 900)
}
