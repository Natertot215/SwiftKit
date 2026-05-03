import SwiftUI

// SwiftUI `EnvironmentValues/isEnabled` reference page.
// Source: Documentation/SwiftUI/view-configuration/isenabled.md
// macOS 10.15+. Bool environment value reflecting the enabled state of the view.

struct IsEnabledPage: View {
    @State private var isDisabled = false

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
            Text("EnvironmentValues/isEnabled")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A Boolean value that indicates whether the view associated with this environment allows user interaction.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/isenabled.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                EnabledBadge()
                EnabledBadge()
                    .disabled(true)
            }
            APICallout("@Environment(\\.isEnabled) private var isEnabled")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            IEVariantRow(title: "Custom view branching on isEnabled") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("""
                    @Environment(\\.isEnabled) private var isEnabled
                    var body: some View {
                        Capsule()
                            .fill(isEnabled ? Color.accentColor : Color.secondary)
                    }
                    """)
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                    APICallout(".fill(isEnabled ? .accent : .secondary)")
                }
            }

            IEVariantRow(title: "Cascade through a subtree") {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        EnabledBadge()
                        EnabledBadge()
                        EnabledBadge()
                    }
                    .disabled(true)
                    APICallout("Stack.disabled(true) \u{2014} every child reads isEnabled = false")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            IEVariantRow(title: "Interactive \u{2014} toggle the disabled state") {
                VStack(alignment: .leading, spacing: 12) {
                    Toggle("Disable", isOn: $isDisabled)
                        .toggleStyle(.switch)
                        .frame(maxWidth: 240, alignment: .leading)
                    HStack(spacing: 16) {
                        EnabledBadge()
                        EnabledBadge()
                        EnabledBadge()
                    }
                    .disabled(isDisabled)
                    Text("isEnabled = \(isDisabled ? "false" : "true")")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct IENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [IENote] = [
        .init(title: "Default value is true.",
              detail: "Without any ancestor calling .disabled(true), every view sees isEnabled = true through the environment.",
              symbol: "checkmark.circle"),
        .init(title: "Set indirectly through .disabled(_:).",
              detail: "There's no way to write isEnabled directly. Use the .disabled(_:) modifier on a parent; the environment value reflects it.",
              symbol: "pencil.slash"),
        .init(title: "Read in custom ButtonStyles / controls.",
              detail: "Anywhere a custom control needs to draw a disabled appearance, branch on @Environment(\\.isEnabled) to mirror Apple's controls.",
              symbol: "leaf"),
        .init(title: "Mirrors the precedence of .disabled(_:).",
              detail: "Outer disabled(true) wins over inner disabled(false). Reading isEnabled gives you the resolved value at the point in the hierarchy.",
              symbol: "lock"),
        .init(title: "Use opacity or .secondary for visual disablement.",
              detail: "Apple's convention is to dim disabled content. .opacity(0.5) or .foregroundStyle(.secondary) keeps custom controls visually consistent with native.",
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

private struct EnabledBadge: View {
    @Environment(\.isEnabled) private var isEnabled

    var body: some View {
        Label(isEnabled ? "isEnabled = true" : "isEnabled = false", systemImage: isEnabled ? "checkmark.seal" : "xmark.seal")
            .font(.callout)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                Capsule().fill(isEnabled ? AnyShapeStyle(.tint) : AnyShapeStyle(.secondary.opacity(0.4)))
            )
            .foregroundStyle(.white)
    }
}

private struct IEVariantRow<Content: View>: View {
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
    IsEnabledPage()
        .frame(width: 1100, height: 800)
}
