import SwiftUI

// SwiftUI `ToolbarPlacement` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarplacement.md
// macOS 13.0+. Identifies which BAR you're targeting for visibility / background
// modifiers. Distinct from ToolbarItemPlacement (which targets a region inside
// a single bar). Cases: .automatic, .windowToolbar, .navigationBar, .tabBar,
// .bottomBar, .bottomOrnament, .accessoryBar(id:).

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarPlacementPage: View {
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
            Text("ToolbarPlacement")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Identifies a SwiftUI-managed bar (window toolbar, navigation bar, tab bar, etc.) for the visibility, background, color-scheme, and foreground-style modifiers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarplacement.md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".windowToolbar") {
            NavigationStack {
                Text("The macOS-relevant placement is .windowToolbar")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbarBackground(.regularMaterial, for: .windowToolbar)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button { } label: { Label("Add", systemImage: "plus") }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "macOS-relevant placement: .windowToolbar") {
                APICallout(".toolbarBackground(_, for: .windowToolbar) | .toolbarVisibility(_, for: .windowToolbar)")
                Text("On macOS the only SwiftUI-managed bar most apps target is the window toolbar. NavigationStack still emits .navigationBar internally on iOS, but the macOS rendering is the window chrome.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "iOS-flavored placements") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".navigationBar \u{2014} the iOS NavigationView/NavigationStack chrome", systemImage: "rectangle.topthird.inset.filled")
                    Label(".tabBar \u{2014} TabView's bottom bar", systemImage: "rectangle.bottomthird.inset.filled")
                    Label(".bottomBar \u{2014} the iOS bottom bar attached to nav stacks", systemImage: "rectangle.bottomthird.inset.filled")
                    Label(".bottomOrnament \u{2014} visionOS bottom ornament", systemImage: "visionpro")
                    Label(".accessoryBar(id:) \u{2014} keyed accessory bar", systemImage: "rectangle.connected.to.line.below")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }

            VariantBlock(title: ".automatic \u{2014} let modifiers apply to the implicit context") {
                APICallout(".toolbarVisibility(.hidden) // implicit .automatic")
                Text("Omitting the for: argument is equivalent to passing .automatic; modifiers attach to the nearest container's primary bar.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Modifiers that take ToolbarPlacement") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".toolbar(_:for:) \u{2014} visibility (deprecated)", systemImage: "eye")
                    Label(".toolbarVisibility(_:for:) \u{2014} visibility", systemImage: "eye")
                    Label(".toolbarBackground(_:for:) \u{2014} ShapeStyle background", systemImage: "rectangle")
                    Label(".toolbarBackgroundVisibility(_:for:) \u{2014} background visible/hidden", systemImage: "rectangle.dashed")
                    Label(".toolbarColorScheme(_:for:) \u{2014} preferred color scheme", systemImage: "circle.lefthalf.filled")
                    Label(".toolbarForegroundStyle(_:for:) \u{2014} item shape style", systemImage: "paintbrush")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Don't confuse with ToolbarItemPlacement.",
              detail: "ToolbarPlacement = which BAR (the surface). ToolbarItemPlacement = which SLOT inside a bar (.primaryAction, .principal, .navigation, etc.).",
              symbol: "exclamationmark.triangle"),
        .init(title: "macOS apps mostly use .windowToolbar.",
              detail: "Other placements (.navigationBar, .tabBar, .bottomBar) are iOS-flavored and have no rendering effect on macOS, but they compile and the modifiers are no-ops.",
              symbol: "macwindow"),
        .init(title: ".accessoryBar(id:) is keyed.",
              detail: "Multi-bar systems can have several accessory bars; the id parameter selects which one. Mostly relevant on iPadOS / visionOS.",
              symbol: "tag"),
        .init(title: "Deprecated: init(id:).",
              detail: "Old positional placement constructor; use the new static cases or .accessoryBar(id:) instead.",
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

private struct DemoFrame<Content: View>: View {
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
    ToolbarPlacementPage()
        .frame(width: 1100, height: 900)
}
