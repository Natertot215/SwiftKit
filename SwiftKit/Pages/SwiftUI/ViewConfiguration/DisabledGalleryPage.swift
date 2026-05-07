import SwiftUI

// SwiftUI `View/disabled(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/disabled(_:).md
// macOS 10.15+. Outer values override inner values \u{2014} ancestor disabled(true)
// wins even if a child sets disabled(false).

struct DisabledGalleryPage: View {
    @State private var isDisabled: Bool = true
    @State private var text: String = "Editable"

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
            Text("View/disabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a condition that controls whether users can interact with this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/disabled(_:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Button("Press") {}
                    .disabled(false)
            }
            .disabled(true)
            APICallout("HStack { Button(\"Press\") {}.disabled(false) }.disabled(true) \u{2014} outer wins")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            DPVariantRow(title: "Single control") {
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Button("Enabled") {}
                        APICallout(".disabled(false)")
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Button("Disabled") {}
                            .disabled(true)
                        APICallout(".disabled(true)")
                    }
                }
            }

            DPVariantRow(title: "Whole subtree") {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        TextField("Name", text: $text)
                            .frame(width: 160)
                        Button("Save") {}
                        Toggle("Active", isOn: .constant(true))
                            .toggleStyle(.switch)
                    }
                    .disabled(true)
                    APICallout("HStack { TextField, Button, Toggle }.disabled(true)")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            DPVariantRow(title: "Interactive \u{2014} bound to a Toggle") {
                VStack(alignment: .leading, spacing: 12) {
                    Toggle("Disable controls below", isOn: $isDisabled)
                        .toggleStyle(.switch)
                        .frame(maxWidth: 280, alignment: .leading)
                    HStack(spacing: 12) {
                        Button("Action") {}
                        Slider(value: .constant(0.5), in: 0...1)
                            .frame(width: 160)
                        TextField("Type\u{2026}", text: $text)
                            .frame(width: 160)
                    }
                    .disabled(isDisabled)
                    APICallout(".disabled(isDisabled)")
                }
            }

            DPVariantRow(title: "Outer overrides inner") {
                HStack(spacing: 16) {
                    Button("Inner says enabled") {}
                        .disabled(false)
                }
                .disabled(true)
                Text("The Button still appears disabled because the parent forces it.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct DPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DPNote] = [
        .init(title: "Outer disabled(true) overrides inner disabled(false).",
              detail: "If any ancestor disables a subtree, no descendant can re-enable itself. This is the documented precedence; design accordingly.",
              symbol: "lock"),
        .init(title: "Read state via @Environment(\\.isEnabled).",
              detail: "Custom controls inherit the disabled state through the environment. Branch on isEnabled to draw the correct visual treatment.",
              symbol: "leaf"),
        .init(title: "Disabled views ignore most input.",
              detail: "Tap, click, key, and gesture recognizers are suppressed. Hit-testing for layout still happens (the view occupies space).",
              symbol: "hand.point.up.left"),
        .init(title: "Visually communicates non-interactivity.",
              detail: "Apple's controls dim themselves when disabled. Custom controls should mirror this with .opacity or muted foregroundStyle to set expectations.",
              symbol: "eye"),
        .init(title: "Don't use to remove views from the user.",
              detail: "Disabled controls remain visible and discoverable. To remove a control entirely, use a conditional `if`. Disabled is for \"available later\".",
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

private struct DPVariantRow<Content: View>: View {
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

extension DisabledGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.disabled",
        title: "Disabled",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/disabled(_:)",
            "EnvironmentValues/isEnabled"
        ],
        blurb: "Adds a condition that controls whether users can interact with this view. Higher views in the hierarchy override descendants; the resolved state surfaces through the isEnabled environment value.",
        signature: "func disabled(_ disabled: Bool) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-configuration/disabled(_:).md",
        page: { AnyView(DisabledGalleryPage()) }
    )
}

#Preview {
    DisabledGalleryPage()
        .frame(width: 1100, height: 800)
}
