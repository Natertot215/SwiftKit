import SwiftUI

// SwiftUI `View/tabViewCustomization(_:)` reference page.
// Source: Documentation/SwiftUI/navigation/tabviewcustomization(_:).md
// macOS 15.0+. Specifies the customizations to apply to the sidebar representation
// of a TabView. Only the .sidebarAdaptable style supports customization.
// Companion to the TabViewCustomization struct.

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

struct TabViewCustomizationModifierPage: View {
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
            Text("View/tabViewCustomization(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the customizations to apply to the sidebar representation of the tab view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabviewcustomization(_:).md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            DemoCard(api: ".tabViewCustomization($customization) — drag tabs / sections to reorder") {
                TabView {
                    Tab("Home", systemImage: "house") { pane("Home") }
                        .customizationID("swiftkit.demo.modifier.home")
                    Tab("Reports", systemImage: "chart.bar") { pane("Reports") }
                        .customizationID("swiftkit.demo.modifier.reports")
                    TabSection("Categories") {
                        Tab("Climate", systemImage: "fan") { pane("Climate") }
                            .customizationID("swiftkit.demo.modifier.climate")
                        Tab("Lights",  systemImage: "lightbulb") { pane("Lights") }
                            .customizationID("swiftkit.demo.modifier.lights")
                    }
                    .customizationID("swiftkit.demo.modifier.browse")
                }
                .tabViewStyle(.sidebarAdaptable)
                .tabViewCustomization($customization)
            }
            HStack(spacing: 8) {
                Button("Reset section order") { customization.resetSectionOrder() }
                Button("Reset visibility")    { customization.resetVisibility() }
                Spacer()
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Pass nil — no customization (read-only TabView)") {
                APICallout(".tabViewCustomization(nil)  // disables drag-reorder, no persistence")
            }
            VariantBlock(title: "Bind directly to @AppStorage") {
                APICallout("@AppStorage(\"tabCustomization\") private var customization: TabViewCustomization")
                APICallout(".tabViewCustomization($customization)")
            }
            VariantBlock(title: "Without .sidebarAdaptable — modifier is a no-op") {
                DemoCard(api: ".tabViewCustomization($customization) on .automatic — no reordering UI") {
                    TabView {
                        Tab("Home",   systemImage: "house")        { pane("Home") }
                        Tab("Browse", systemImage: "list.bullet")  { pane("Browse") }
                    }
                    .tabViewStyle(.automatic)
                    .tabViewCustomization($customization)
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("After dragging tabs / sections in the demo above, the bound TabViewCustomization value reflects the new arrangement. Reset buttons restore declared defaults.")
                .font(.callout)
                .foregroundStyle(.secondary)
            APICallout("customization.resetSectionOrder() / resetVisibility()")
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

    private struct TVCMNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TVCMNote] = [
        .init(title: "Only .sidebarAdaptable enables customization.",
              detail: "Apple's docs are explicit: customization is wired up only when the TabView's style is .sidebarAdaptable. The modifier compiles in any style but does nothing without the sidebar layout.",
              symbol: "sidebar.left"),
        .init(title: "Pass nil to disable customization entirely.",
              detail: "The signature accepts Binding<TabViewCustomization>?. Pass nil (or omit the modifier) for a read-only sidebar TabView with no drag-to-reorder affordance.",
              symbol: "lock"),
        .init(title: "All reorderable nodes need .customizationID.",
              detail: "Apply .customizationID(\"…\") on each Tab and TabSection. Without an ID the framework can't track that node across reorderings — its customization is silently dropped.",
              symbol: "number"),
        .init(title: "macOS allows section reordering by default; tab visibility is your responsibility.",
              detail: "Drag-to-reorder of sections works out of the box. Per-tab visibility toggles aren't surfaced by macOS — you'd build a custom settings UI and write through the customization's subscripts.",
              symbol: "macwindow"),
        .init(title: "Pair with .defaultVisibility(_:for:) to set initial state.",
              detail: "Use TabContent's .defaultVisibility(_:for:) to declare a tab's starting visibility (typically for the .sidebar placement). The TabViewCustomization records subsequent user overrides.",
              symbol: "eye")
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
    TabViewCustomizationModifierPage()
        .frame(width: 1200, height: 900)
}
