import SwiftUI

// SwiftUI `TabContent` reference page.
// Source: Documentation/SwiftUI/navigation/tabcontent.md
// macOS 15.0+. Protocol that types provide for use as TabView children.
// Conforming types: AnyTabContent, ForEach, Group, Tab, TabSection.
// Surface — instance methods include accessibility, .badge, .customizationID,
// .customizationBehavior, .defaultVisibility, .draggable, .dropDestination,
// .hidden, .popover, .sectionActions, .springLoadingBehavior, .swipeActions,
// .tabPlacement, etc.

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

private enum TCPSection: Hashable {
    case home, browse, settings
}

struct TabContentPage: View {
    @State private var selection: TCPSection = .home

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
            Text("TabContent")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type that provides content for programmatically selectable tabs in a tab view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabcontent.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Tab(...).badge(3).customizationID(\"home\")  // Tab is the canonical TabContent") {
            TabView(selection: $selection) {
                Tab("Home", systemImage: "house", value: TCPSection.home) { pane("Home") }
                    .badge(3)
                    .customizationID("swiftkit.tcp.home")
                Tab("Browse", systemImage: "list.bullet", value: TCPSection.browse) { pane("Browse") }
                    .customizationID("swiftkit.tcp.browse")
                Tab("Settings", systemImage: "gear", value: TCPSection.settings) { pane("Settings") }
                    .customizationID("swiftkit.tcp.settings")
            }
            .tabViewStyle(.sidebarAdaptable)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Conforming types") {
                APICallout("Tab, TabSection, AnyTabContent, ForEach, Group  — all conform to TabContent")
            }
            VariantBlock(title: "Common modifiers") {
                APICallout(".badge(_:)                 // numeric or string badge on the tab item")
                APICallout(".customizationID(_:)        // stable identity for TabViewCustomization")
                APICallout(".customizationBehavior(_:for:)  // .automatic / .disabled / .reorderable")
                APICallout(".defaultVisibility(_:for:)  // initial sidebar visibility")
                APICallout(".tabPlacement(_:)           // .automatic / .pinned / .sidebarOnly")
                APICallout(".sectionActions { Button(...) }  // hover-revealed section actions")
                APICallout(".accessibilityLabel(_:)     // VoiceOver label override")
            }
            VariantBlock(title: "Composition — modifiers chain like View modifiers") {
                APICallout("Tab(\"Home\", systemImage: \"house\", value: .home) { … }\n    .badge(2)\n    .customizationID(\"home\")\n    .defaultVisibility(.hidden, for: .sidebar)")
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Button("Home")     { selection = .home }
                Button("Browse")   { selection = .browse }
                Button("Settings") { selection = .settings }
                Spacer()
                Text("selection = \(String(describing: selection))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            APICallout("@MainActor @preconcurrency protocol TabContent<TabValue> — main-actor-isolated by default.")
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

    private struct TCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TCNote] = [
        .init(title: "Five conforming types — Tab, TabSection, ForEach, Group, AnyTabContent.",
              detail: "Tab is the canonical leaf. TabSection is the grouping container. ForEach and Group come from SwiftUI's standard builders. AnyTabContent is the type-erased wrapper for heterogeneous storage.",
              symbol: "rectangle.stack"),
        .init(title: "Modifier surface mirrors View — but specific to tab content.",
              detail: ".badge, .customizationID, .customizationBehavior, .defaultVisibility, .tabPlacement, .sectionActions, .draggable, .dropDestination, .accessibility*, .popover, .swipeActions, .springLoadingBehavior, .hidden, .disabled, .contextMenu — see Apple's Topics → Instance Methods for the full list.",
              symbol: "wand.and.stars"),
        .init(title: "Main-actor-isolated by default.",
              detail: "Declaring TabContent conformance in a type's base declaration (rather than in an extension) inherits @preconcurrency @MainActor isolation. Declare in an extension to opt out.",
              symbol: "circle.dashed"),
        .init(title: "TabContent vs View — they are not interchangeable.",
              detail: "TabContent isn't a View; you can't drop a Tab into a VStack or apply View modifiers to it directly. Likewise, plain Views inside a TabView's content closure won't be treated as tabs — wrap them in Tab.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Generic over a TabValue (Hashable).",
              detail: "A TabContent's TabValue associated type pins the selection type. Inside one builder all tab content must share the same TabValue. Type erasure (AnyTabContent) is the escape hatch for runtime composition.",
              symbol: "shuffle")
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
    TabContentPage()
        .frame(width: 1200, height: 900)
}
