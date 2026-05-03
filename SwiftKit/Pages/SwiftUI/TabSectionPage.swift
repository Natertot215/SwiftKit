import SwiftUI

// SwiftUI `TabSection` reference page.
// Source: Documentation/SwiftUI/navigation/tabsection.md
// macOS 15.0+. Groups Tabs in a TabView with a header — visible only when the
// TabView style supports sections (.sidebarAdaptable on macOS).
// Three initializers: init(content:), init(_:content:) [string header],
// init(content:header:) [view-builder header].

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

struct TabSectionPage: View {
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
            Text("TabSection")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A container that you can use to add hierarchy within a tab view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabsection.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "TabSection(\"Messages\") { Tab(...); Tab(...) } — inside .tabViewStyle(.sidebarAdaptable)") {
            TabView {
                Tab("Account", systemImage: "person.crop.circle") { pane("Account") }
                TabSection("Messages") {
                    Tab("Received", systemImage: "tray.and.arrow.down") { pane("Received") }
                    Tab("Sent",     systemImage: "tray.and.arrow.up")   { pane("Sent") }
                    Tab("Drafts",   systemImage: "doc.text")             { pane("Drafts") }
                }
            }
            .tabViewStyle(.sidebarAdaptable)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init(_:content:) — string header") {
                DemoCard(api: "TabSection(\"Browse\") { Tab(...) }") {
                    TabView {
                        Tab("Home", systemImage: "house") { pane("Home") }
                        TabSection("Browse") {
                            Tab("Library", systemImage: "books.vertical") { pane("Library") }
                            Tab("Series",  systemImage: "play.tv")        { pane("Series") }
                        }
                    }
                    .tabViewStyle(.sidebarAdaptable)
                }
            }

            VariantBlock(title: "init(content:header:) — view-builder header") {
                DemoCard(api: "TabSection { Tab(...) } header: { Label(\"Browse\", systemImage: \"folder\") }") {
                    TabView {
                        Tab("Home", systemImage: "house") { pane("Home") }
                        TabSection {
                            Tab("Library", systemImage: "books.vertical") { pane("Library") }
                            Tab("Series",  systemImage: "play.tv")        { pane("Series") }
                        } header: {
                            Label("Browse", systemImage: "folder")
                        }
                    }
                    .tabViewStyle(.sidebarAdaptable)
                }
            }

            VariantBlock(title: "init(content:) — header omitted (anonymous group)") {
                DemoCard(api: "TabSection { Tab(...); Tab(...) }") {
                    TabView {
                        Tab("Home", systemImage: "house") { pane("Home") }
                        TabSection {
                            Tab("Library", systemImage: "books.vertical") { pane("Library") }
                            Tab("Series",  systemImage: "play.tv")        { pane("Series") }
                        }
                    }
                    .tabViewStyle(.sidebarAdaptable)
                }
            }

            VariantBlock(title: "Multiple sections — separate hierarchies") {
                DemoCard(api: "TabView { Tab(...); TabSection(\"Mail\") { … }; TabSection(\"Calendar\") { … } }") {
                    TabView {
                        Tab("Home", systemImage: "house") { pane("Home") }
                        TabSection("Mail") {
                            Tab("Inbox", systemImage: "tray")        { pane("Inbox") }
                            Tab("Sent",  systemImage: "paperplane")  { pane("Sent") }
                        }
                        TabSection("Calendar") {
                            Tab("Today",   systemImage: "calendar")               { pane("Today") }
                            Tab("Upcoming", systemImage: "calendar.badge.clock")  { pane("Upcoming") }
                        }
                    }
                    .tabViewStyle(.sidebarAdaptable)
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("With and without .sidebarAdaptable — sections only render with a sidebar-style TabView. The default style flattens them.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".tabViewStyle(.sidebarAdaptable)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: "Sections render as headed groups in the sidebar") {
                        TabView {
                            Tab("Home", systemImage: "house") { pane("Home") }
                            TabSection("Messages") {
                                Tab("Inbox", systemImage: "tray")    { pane("Inbox") }
                                Tab("Sent",  systemImage: "paperplane") { pane("Sent") }
                            }
                        }
                        .tabViewStyle(.sidebarAdaptable)
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".tabViewStyle(.automatic)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: "Sections collapse — headers do not render") {
                        TabView {
                            Tab("Home", systemImage: "house") { pane("Home") }
                            TabSection("Messages") {
                                Tab("Inbox", systemImage: "tray")    { pane("Inbox") }
                                Tab("Sent",  systemImage: "paperplane") { pane("Sent") }
                            }
                        }
                        .tabViewStyle(.automatic)
                    }
                }
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

    private struct TSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TSNote] = [
        .init(title: "Three initializers — anonymous, string-header, view-builder header.",
              detail: "init(content:) is unheaded. init(_:content:) takes a LocalizedStringKey or String header. init(content:header:) takes a view builder for fully custom header content (Label, HStack, etc.).",
              symbol: "switch.2"),
        .init(title: "Sections render only with .sidebarAdaptable on macOS.",
              detail: "macOS's default TabView chrome is a horizontal strip; it has no place to put a section header. Switch to .tabViewStyle(.sidebarAdaptable) to get the sidebar layout that exposes sections.",
              symbol: "sidebar.left"),
        .init(title: "TabSection conforms to TabContent — modifiers chain naturally.",
              detail: "Apply .customizationID(_:), .defaultVisibility(_:for:), .customizationBehavior(_:for:), etc. directly on the section. Macros recognize the section as a TabContent and run the same modifier surface as Tab.",
              symbol: "circle.dashed"),
        .init(title: "Pair with .tabViewCustomization for user reordering.",
              detail: "Sections in a sidebar-adaptable TabView are reorderable on macOS when a TabViewCustomization binding is supplied. Each section needs a stable customizationID for the persistence to track it.",
              symbol: "rectangle.3.group")
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
    TabSectionPage()
        .frame(width: 1200, height: 900)
}
