import SwiftUI

// SwiftUI `TabCustomizationBehavior` reference page.
// Source: Documentation/SwiftUI/navigation/tabcustomizationbehavior.md
// macOS 15.0+. Three documented type properties:
//   .automatic     — system default (currently equivalent to .reorderable)
//   .disabled      — opt this tab/section out of customization
//   .reorderable   — user can drag this tab/section in the sidebar
// Apply via TabContent/customizationBehavior(_:for:) on a Tab or TabSection.

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

struct TabCustomizationBehaviorPage: View {
    @State private var customization = TabViewCustomization()

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
            Text("TabCustomizationBehavior")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The customization behavior of customizable tab view content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabcustomizationbehavior.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "TabView { Tab(...).customizationID(\"…\") } .tabViewCustomization($customization)") {
            TabView {
                Tab("Home", systemImage: "house") { pane("Home") }
                    .customizationID("swiftkit.tcb.home")
                Tab("Reports", systemImage: "chart.bar") { pane("Reports") }
                    .customizationID("swiftkit.tcb.reports")
                Tab("Settings", systemImage: "gear") { pane("Settings") }
                    .customizationID("swiftkit.tcb.settings")
            }
            .tabViewStyle(.sidebarAdaptable)
            .tabViewCustomization($customization)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("TabCustomizationBehavior is documented as macOS 15+, but its companion modifier `customizationBehavior(_:for:)` and the `AdaptableTabBarPlacement.sidebar` argument are surfaced as iOS / iPadOS / visionOS APIs only. On macOS the type itself is reachable; the modifier shape isn't. The cases below describe how the value is consumed on the platforms that expose the modifier.")
                .font(.callout)
                .foregroundStyle(.secondary)

            VariantBlock(title: ".automatic") {
                APICallout("Tab(...).customizationBehavior(.automatic, for: .sidebar)  // iOS / iPadOS / visionOS")
                Text("System default. Currently behaves like .reorderable; future SDKs may treat it differently per platform.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            VariantBlock(title: ".disabled — pin a tab/section") {
                APICallout("Tab(...).customizationBehavior(.disabled, for: .sidebar)  // iOS / iPadOS / visionOS")
                Text("The tab or section is excluded from drag-reorder. Use for primary destinations that should always sit in their declared position (Mail's Inbox, for example).")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            VariantBlock(title: ".reorderable") {
                APICallout("Tab(...).customizationBehavior(.reorderable, for: .sidebar)  // iOS / iPadOS / visionOS")
                Text("Explicitly opts the tab/section in to user-driven reordering. Equivalent to .automatic in current SDKs.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("On macOS, drag-to-reorder of TabSections in the demo above is enabled by default. Per-tab customization opt-out via .disabled requires the customizationBehavior modifier, which Apple ships only on iOS / iPadOS / visionOS in the macOS 26 SDK.")
                .font(.callout)
                .foregroundStyle(.secondary)
            APICallout("// macOS workaround: omit .customizationID on tabs you want pinned.")
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

    private struct TCBNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TCBNote] = [
        .init(title: "Three cases — .automatic, .disabled, .reorderable.",
              detail: ".automatic delegates to system defaults. .disabled excludes a tab/section from customization. .reorderable explicitly opts in. The cases are reachable on macOS even though the consuming modifier currently isn't.",
              symbol: "switch.2"),
        .init(title: "macOS 26 SDK does not expose .customizationBehavior(_:for:) or AdaptableTabBarPlacement.sidebar.",
              detail: "TabCustomizationBehavior the type ships on macOS 15+, but the companion modifier and the sidebar placement constant Apple's docs reference are marked unavailable on macOS in the 26 SDK. To pin a tab on macOS, omit .customizationID on it — section reordering is still allowed for the others.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Apply per AdaptableTabBarPlacement (where supported).",
              detail: "On platforms that surface the modifier (iOS, iPadOS, visionOS), the second argument is an AdaptableTabBarPlacement (almost always .sidebar). The behavior is scoped to that placement; other placements get the system default.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Requires .tabViewCustomization to take effect.",
              detail: "Without a TabViewCustomization binding on the parent TabView, there's no customization to apply behavior to. The modifier becomes a silent no-op even on platforms where it's available.",
              symbol: "link")
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
    TabCustomizationBehaviorPage()
        .frame(width: 1200, height: 900)
}
