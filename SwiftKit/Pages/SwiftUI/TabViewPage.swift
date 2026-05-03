import SwiftUI

// SwiftUI `TabView` reference page.
// Source: Documentation/SwiftUI/navigation/tabview.md
// macOS 10.15+ (the container) but the modern Tab/TabSection content + the
// .sidebarAdaptable style are macOS 15+. Two initializers:
//   init(content:)               — uncontrolled, framework-managed selection
//   init(selection:content:)     — Binding<SelectionValue> for programmatic selection
// Tab is the modern child type; legacy .tabItem(_:) is iOS-only and lives elsewhere.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private enum TVPSection: Hashable {
    case received, sent, account
}

struct TabViewPage: View {
    @State private var selection: TVPSection = .received

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
            Text("TabView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that switches between multiple child views using interactive user interface elements.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabview.md · macOS 10.15+ (Tab/TabSection: macOS 15+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "TabView { Tab(_:systemImage:) { … } }") {
            TabView {
                Tab("Received", systemImage: "tray.and.arrow.down") {
                    pane("Received messages")
                }
                Tab("Sent", systemImage: "tray.and.arrow.up") {
                    pane("Sent messages")
                }
                Tab("Account", systemImage: "person.crop.circle") {
                    pane("Account info")
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init(content:) — uncontrolled selection") {
                DemoCard(api: "TabView { Tab(\"…\", systemImage:) { … } … }") {
                    TabView {
                        Tab("Received", systemImage: "tray.and.arrow.down") { pane("Received") }
                        Tab("Sent",     systemImage: "tray.and.arrow.up")   { pane("Sent") }
                        Tab("Account",  systemImage: "person.crop.circle")   { pane("Account") }
                    }
                }
            }

            VariantBlock(title: "init(selection:content:) — bound selection") {
                DemoCard(api: "TabView(selection: $selection) { Tab(_, systemImage:, value:) { … } }") {
                    TabView(selection: $selection) {
                        Tab("Received", systemImage: "tray.and.arrow.down", value: TVPSection.received) {
                            pane("Received")
                        }
                        Tab("Sent", systemImage: "tray.and.arrow.up", value: TVPSection.sent) {
                            pane("Sent")
                        }
                        Tab("Account", systemImage: "person.crop.circle", value: TVPSection.account) {
                            pane("Account")
                        }
                    }
                }
            }

            VariantBlock(title: "TabSection — group tabs (best with .sidebarAdaptable)") {
                DemoCard(api: "TabView { Tab(...); TabSection(\"Messages\") { Tab(...); Tab(...) } } .tabViewStyle(.sidebarAdaptable)") {
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
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Programmatic selection — buttons drive the binding") {
                DemoCard(api: "selection = .received   selection = .sent   selection = .account") {
                    TabView(selection: $selection) {
                        Tab("Received", systemImage: "tray.and.arrow.down", value: TVPSection.received) { pane("Received") }
                        Tab("Sent",     systemImage: "tray.and.arrow.up",   value: TVPSection.sent)     { pane("Sent") }
                        Tab("Account",  systemImage: "person.crop.circle",   value: TVPSection.account)  { pane("Account") }
                    }
                }
                HStack(spacing: 8) {
                    Button("Received") { selection = .received }
                    Button("Sent")     { selection = .sent }
                    Button("Account")  { selection = .account }
                    Spacer()
                    Text("selection = \(String(describing: selection))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private func pane(_ title: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: "rectangle.stack")
                .font(.system(size: 36))
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: Notes

    private struct TVPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TVPNote] = [
        .init(title: "Tab is the modern child type; .tabItem(_:) is the legacy iOS path.",
              detail: "On macOS 15+, populate TabView with Tab views (init forms cover string + symbol/image, view-builder labels, optional value, optional role). The pre-iOS-18 pattern of attaching .tabItem(_:) to arbitrary views is iOS-only and not surfaced here.",
              symbol: "rectangle.stack"),
        .init(title: "Two initializers — uncontrolled and bound.",
              detail: "init(content:) lets the framework own the selection. init(selection:content:) takes a Binding<SelectionValue: Hashable>; pair each Tab's `value:` with a case from your enum (or any Hashable).",
              symbol: "switch.2"),
        .init(title: "macOS styles — .automatic and .sidebarAdaptable are the documented options.",
              detail: ".tabViewStyle(.automatic) renders the system default. .tabViewStyle(.sidebarAdaptable) collapses the tabs into a sidebar (the macOS Mail / Photos look). .page is iOS-only on macOS — it doesn't render the swipe-paged carousel here.",
              symbol: "paintbrush"),
        .init(title: "TabSection groups tabs in the sidebar form.",
              detail: "Wrap Tabs in a TabSection to give them a header in the sidebar style. Sections do nothing in the default style — they're a sidebar-only grouping construct.",
              symbol: "folder"),
        .init(title: "Don't compose a TabView at the app's root if you have a sidebar app.",
              detail: "SwiftKit itself uses NavigationSplitView at the WindowGroup root; TabView is best for self-contained sub-navigation. If your top-level UI is sidebar + detail, prefer NavigationSplitView and reserve TabView for nested switching.",
              symbol: "exclamationmark.triangle")
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
    TabViewPage()
        .frame(width: 1100, height: 900)
}
