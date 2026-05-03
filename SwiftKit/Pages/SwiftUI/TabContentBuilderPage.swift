import SwiftUI

// SwiftUI `TabContentBuilder` reference page.
// Source: Documentation/SwiftUI/navigation/tabcontentbuilder.md
// macOS 15.0+. The result builder that constructs tabs for a TabView with
// programmatic selection. Generic over `TabValue: Hashable` — every Tab in the
// builder must share the same selection type. Surface is implementation:
// users author Tab/TabSection/Group/ForEach inside a TabView.init(selection:content:)
// and the compiler routes the closure through TabContentBuilder.

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

private enum TCBPSection: Hashable {
    case home, browse, settings, search
}

struct TabContentBuilderPage: View {
    @State private var selection: TCBPSection = .home

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
            Text("TabContentBuilder")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A result builder that constructs tabs for a tab view that supports programmatic selection.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabcontentbuilder.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "TabView(selection: $selection) { Tab(_, systemImage:, value:) { … } }  // builder is implicit") {
            TabView(selection: $selection) {
                Tab("Home",     systemImage: "house",        value: TCBPSection.home)     { pane("Home") }
                Tab("Browse",   systemImage: "list.bullet",  value: TCBPSection.browse)   { pane("Browse") }
                Tab("Settings", systemImage: "gear",         value: TCBPSection.settings) { pane("Settings") }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Sequential Tabs — buildBlock(_:_:_:…)") {
                APICallout("TabView(selection:) { Tab(...); Tab(...); Tab(...) }  // up to 10 children supported")
            }
            VariantBlock(title: "Conditional content — buildEither / buildIf") {
                APICallout("TabView(selection:) { Tab(...); if userIsAdmin { Tab(...) } }")
                Text("if / else branches in the builder route through buildIf / buildEither(first:) / buildEither(second:). Limited-availability checks route through buildLimitedAvailability.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            VariantBlock(title: "ForEach inside the builder — repeated tabs") {
                DemoCard(api: "ForEach(items) { Tab(_, systemImage:, value:) { … } }") {
                    TabView(selection: $selection) {
                        Tab("Home", systemImage: "house", value: TCBPSection.home) { pane("Home") }
                        // ForEach over a heterogeneous range would normally produce one Tab type;
                        // shown here in code form for documentation only.
                        Tab("Browse",   systemImage: "list.bullet", value: TCBPSection.browse)   { pane("Browse") }
                        Tab("Settings", systemImage: "gear",        value: TCBPSection.settings) { pane("Settings") }
                    }
                }
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
            APICallout("All Tabs in a single builder must share the same TabValue (Hashable selection type).")
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
        .init(title: "Implicit — you don't write @TabContentBuilder annotations directly.",
              detail: "TabView(selection:content:) declares @TabContentBuilder<SelectionValue> on its content closure. You just write Tab / TabSection / ForEach / Group inside the closure and the compiler does the rest.",
              symbol: "wand.and.rays"),
        .init(title: "Generic over a single TabValue.",
              detail: "Every Tab passed through one builder must share a Hashable value type. Mixed types compile-fail with a generic mismatch — split them across nested TabViews if you really need different selection spaces.",
              symbol: "shuffle"),
        .init(title: "Supports up to ten direct children.",
              detail: "buildBlock has overloads for 1…10 Tabs. For more, wrap subgroups in TabSection or Group — the builder treats them as composite TabContent values.",
              symbol: "list.number"),
        .init(title: "Conditional + ForEach via the standard buildIf / buildEither helpers.",
              detail: "Same idioms as ViewBuilder: if / else branches, switch over an enum, ForEach over Identifiable / RandomAccessCollection. Each branch must produce TabContent of the same TabValue.",
              symbol: "arrow.triangle.branch"),
        .init(title: "TabContent.Body is the runtime representation.",
              detail: "TabContentBuilder.Content is the wrapper type the builder emits; TabView consumes it via the TabContent protocol's body property. You almost never touch this directly — just author Tab and let the framework route it.",
              symbol: "chart.bar.doc.horizontal")
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
    TabContentBuilderPage()
        .frame(width: 1200, height: 900)
}
