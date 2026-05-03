import SwiftUI

// SwiftUI `View/menuIndicator(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/menuindicator(_:).md
// macOS 12.0+. Controls visibility of the chevron-style menu indicator on Menu controls.

struct MenuIndicatorPage: View {
    @State private var visibility: Visibility = .automatic

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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/menuIndicator(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the menu indicator visibility for controls within this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/menuindicator(_:).md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Menu {
                Button("Recent.txt") {}
                Button("Yesterday.txt") {}
                Button("Earlier this week.txt") {}
            } label: {
                Label("History", systemImage: "clock")
            } primaryAction: {}
                .menuIndicator(.hidden)
                .frame(width: 200)
            APICallout("Menu { \u{2026} } label: { \u{2026} } primaryAction: { \u{2026} }.menuIndicator(.hidden)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            MIVariantRow(title: "All three Visibility values") {
                HStack(alignment: .top, spacing: 24) {
                    ForEach([Visibility.automatic, .visible, .hidden], id: \.self) { vis in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(label(for: vis))
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                            Menu {
                                Button("Item 1") {}
                                Button("Item 2") {}
                            } label: {
                                Text("Choose")
                            }
                            .menuIndicator(vis)
                            .frame(width: 180)
                        }
                    }
                }
            }

            MIVariantRow(title: "On a primaryAction Menu (split-button form)") {
                VStack(alignment: .leading, spacing: 8) {
                    Menu {
                        Button("Recent") {}
                        Button("Older") {}
                    } label: {
                        Label("Back", systemImage: "chevron.backward")
                            .labelStyle(.iconOnly)
                    } primaryAction: {}
                        .menuIndicator(.hidden)
                        .frame(width: 60)
                    APICallout(".menuIndicator(.hidden) on a primaryAction Menu \u{2014} pure icon button")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            MIVariantRow(title: "Drive visibility from a Picker") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Indicator", selection: $visibility) {
                        Text(".automatic").tag(Visibility.automatic)
                        Text(".visible").tag(Visibility.visible)
                        Text(".hidden").tag(Visibility.hidden)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 320)
                    Menu {
                        Button("Apple") {}
                        Button("Banana") {}
                        Button("Cherry") {}
                    } label: {
                        Text("Pick a fruit")
                    }
                    .menuIndicator(visibility)
                    .frame(width: 200)
                    Text("indicator = \(label(for: visibility))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct MINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [MINote] = [
        .init(title: "Affects the chevron, not the menu's content.",
              detail: "The chevron is the visual cue that a control opens a menu. .menuIndicator(.hidden) removes it; the menu still opens on click.",
              symbol: "chevron.down"),
        .init(title: "Useful for primaryAction split buttons.",
              detail: "When you want a tiny icon-only button that also opens a menu via long-press / secondary tap, hiding the indicator keeps the chrome clean.",
              symbol: "ellipsis.circle"),
        .init(title: ".automatic shows the indicator on macOS by default.",
              detail: "Apple's default for Menu on macOS is to show the chevron. .visible is rarely needed unless an ancestor has hidden it.",
              symbol: "gear"),
        .init(title: "Inherited down the view hierarchy.",
              detail: "Setting .menuIndicator on a container affects every Menu inside until a child re-applies the modifier.",
              symbol: "arrow.down.circle"),
        .init(title: "Custom ButtonStyle? Read the menuIndicatorVisibility env.",
              detail: "When implementing your own ButtonStyle, read \\.menuIndicatorVisibility (where available) from the environment to honor the user's preference.",
              symbol: "leaf")
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

    private func label(for v: Visibility) -> String {
        switch v {
        case .automatic: return ".automatic"
        case .visible:   return ".visible"
        case .hidden:    return ".hidden"
        @unknown default: return String(describing: v)
        }
    }
}

private struct MIVariantRow<Content: View>: View {
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
    MenuIndicatorPage()
        .frame(width: 1100, height: 800)
}
