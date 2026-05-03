import SwiftUI

// SwiftUI `TabViewCustomization` reference page.
// Source: Documentation/SwiftUI/navigation/tabviewcustomization.md
// macOS 15.0+. Encodable / Decodable / Equatable / Sendable. Stores per-user
// reordering and visibility customizations made to a sidebarAdaptable TabView.
// API:
//   init()
//   resetSectionOrder() / resetSectionOrder(for:) / resetVisibility()
//   subscript(section:) / subscript(sectionID:) / subscript(sidebarVisibility:) / subscript(tab:)

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

struct TabViewCustomizationPage: View {
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
            Text("TabViewCustomization")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The customizations a person makes to an adaptable sidebar tab view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabviewcustomization.md · macOS 15.0+")
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
                        .customizationID("swiftkit.demo.home")
                    Tab("Reports", systemImage: "chart.bar") { pane("Reports") }
                        .customizationID("swiftkit.demo.reports")
                    TabSection("Categories") {
                        Tab("Climate", systemImage: "fan") { pane("Climate") }
                            .customizationID("swiftkit.demo.climate")
                        Tab("Lights", systemImage: "lightbulb") { pane("Lights") }
                            .customizationID("swiftkit.demo.lights")
                    }
                    .customizationID("swiftkit.demo.browse")
                }
                .tabViewStyle(.sidebarAdaptable)
                .tabViewCustomization($customization)
            }
            HStack(spacing: 8) {
                Button("Reset section order") { customization.resetSectionOrder() }
                Button("Reset visibility")    { customization.resetVisibility() }
                Button("Replace") { customization = TabViewCustomization() }
                Spacer()
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init() — fresh customization") {
                APICallout("var customization = TabViewCustomization()  // empty — no overrides yet")
            }
            VariantBlock(title: "@AppStorage persistence") {
                APICallout("@AppStorage(\"tabCustomization\") private var customization: TabViewCustomization")
                Text("Codable conformance lets the customization round-trip through @AppStorage. The first launch starts empty; subsequent launches honor any reordering or visibility changes the user made.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            VariantBlock(title: "Reset methods") {
                APICallout("customization.resetSectionOrder()         // restore declared section order")
                APICallout("customization.resetSectionOrder(for: id)  // restore one section's order")
                APICallout("customization.resetVisibility()           // restore default tab visibility")
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Subscripts let you read or write the per-tab / per-section customization records directly. Use them when you need to drive the customization programmatically rather than relying on user-driven drag-reorder.")
                .font(.callout)
                .foregroundStyle(.secondary)

            APICallout("customization[sectionID: \"swiftkit.demo.browse\"] // SectionCustomization?")
            APICallout("customization[tab: tab]                            // TabCustomization")
            APICallout("customization[sidebarVisibility: tab]              // Visibility")
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

    private struct TVCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TVCNote] = [
        .init(title: "Stores the user's reordering / visibility choices for sidebar tabs.",
              detail: "Pass a binding to .tabViewCustomization(_:); the framework writes per-user customizations into the value as the user drags or hides tabs in the sidebar.",
              symbol: "rectangle.3.group"),
        .init(title: "Codable — pair with @AppStorage to persist across launches.",
              detail: "Encodable + Decodable conformance means @AppStorage(\"…\") private var customization: TabViewCustomization works directly. Round-tripping via JSONEncoder also works for custom storage.",
              symbol: "externaldrive"),
        .init(title: "Tabs and sections need stable customizationIDs.",
              detail: "Apply .customizationID(_:) on every Tab and TabSection that should be reorderable. Without an ID the framework can't track that node across reorderings — its customization is silently dropped.",
              symbol: "number"),
        .init(title: "macOS surfaces section reordering only by default.",
              detail: "Apple's docs note that on macOS, the default interaction lets users reorder sections but not toggle individual tab visibility. To expose visibility toggles on macOS, you build a custom UI and write the visibility through the customization's subscripts.",
              symbol: "macwindow"),
        .init(title: "Reset methods restore the declared defaults.",
              detail: "resetSectionOrder() (or per-section resetSectionOrder(for:)) clears the user's reordering and reverts to the order in the TabView builder. resetVisibility() restores the default tab visibility set by .defaultVisibility(_:for:).",
              symbol: "arrow.uturn.backward")
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
    TabViewCustomizationPage()
        .frame(width: 1200, height: 900)
}
