import SwiftUI

// SwiftUI `View/tabViewSidebarFooter(content:)` reference page.
// Source: Documentation/SwiftUI/navigation/tabviewsidebarfooter(content:).md
// macOS 15.0+. Adds a custom footer to the sidebar of a tab view. Footer scrolls
// with the content (use .tabViewSidebarBottomBar instead for a pinned bar).
// Requires .tabViewStyle(.sidebarAdaptable).

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

struct TabViewSidebarFooterPage: View {
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
            Text("View/tabViewSidebarFooter(content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a custom footer to the sidebar of a tab view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabviewsidebarfooter(content:).md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".tabViewSidebarFooter { Link(\"Contact support\", destination:) }") {
            sidebarTabView
                .tabViewSidebarFooter {
                    Link("Contact support", destination: URL(string: "https://example.com/support")!)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                        .font(.caption)
                }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Inline link") {
                DemoCard(api: ".tabViewSidebarFooter { Link(_, destination:) }") {
                    sidebarTabView
                        .tabViewSidebarFooter {
                            Link("Help & feedback", destination: URL(string: "https://example.com/help")!)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                                .font(.caption)
                        }
                }
            }

            VariantBlock(title: "Storage indicator — text + ProgressView") {
                DemoCard(api: ".tabViewSidebarFooter { VStack { Text(\"Storage\"); ProgressView(value:) } }") {
                    sidebarTabView
                        .tabViewSidebarFooter {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("iCloud Storage")
                                    .font(.caption)
                                ProgressView(value: 0.72)
                                Text("36 GB of 50 GB used")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
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
            Text("Footer is visible only in .sidebarAdaptable. Other styles drop it silently.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".sidebarAdaptable — footer visible")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewSidebarFooter { Text(\"Footer\") }") {
                        sidebarTabView
                            .tabViewSidebarFooter {
                                Text("Footer").font(.caption)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                            }
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".automatic — footer hidden")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".tabViewSidebarFooter { … } .tabViewStyle(.automatic)") {
                        TabView {
                            Tab("Home",   systemImage: "house")        { pane("Home") }
                            Tab("Browse", systemImage: "list.bullet")  { pane("Browse") }
                        }
                        .tabViewSidebarFooter {
                            Text("Footer (won't show)").font(.caption)
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

    private struct TVSFNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TVSFNote] = [
        .init(title: "Footer scrolls with the sidebar content.",
              detail: "It sits beneath the last tab/section. Long sidebars push the footer below the visible region. For a pinned floor-of-sidebar control, use .tabViewSidebarBottomBar instead.",
              symbol: "arrow.up.and.down"),
        .init(title: "Renders only in .sidebarAdaptable.",
              detail: "Like the header and bottom-bar modifiers, this has no effect with .automatic, .page, or other styles. The modifier compiles but the content is dropped.",
              symbol: "sidebar.left"),
        .init(title: "Use for support links, account info, storage usage, etc.",
              detail: "Apple's example is a contact-support link. Mail uses footers for storage indicators, Notes for account pickers — quiet auxiliary content that augments the navigation tree.",
              symbol: "info.circle"),
        .init(title: "Composes with .tabViewSidebarHeader and .tabViewSidebarBottomBar.",
              detail: "All three sidebar accessory modifiers can attach to the same TabView simultaneously — header scrolls at the top, footer scrolls at the bottom, bottom bar pins to the floor."
              , symbol: "rectangle.split.3x1")
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
    TabViewSidebarFooterPage()
        .frame(width: 1200, height: 900)
}
