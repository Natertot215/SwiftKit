import SwiftUI

// SwiftUI `View/invalidatableContent(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/invalidatablecontent(_:).md
// macOS 14.0+. Marks a view's content as potentially stale; SwiftUI applies the
// .invalidated redaction reason to the receiver.

struct InvalidatableContentPage: View {
    @State private var isInvalidatable = true
    @State private var counter = 42

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
            Text("View/invalidatableContent(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Mark the receiver as their content might be invalidated.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/invalidatablecontent(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Latest count")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("\(counter)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .invalidatableContent()
            }
            .padding(16)
            .frame(width: 200)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            APICallout(".invalidatableContent()")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ICVariantRow(title: "Default parameter \u{2014} .invalidatableContent() == true") {
                ICCodeBlock(
                    api: ".invalidatableContent() == .invalidatableContent(true)",
                    code: """
                    Text("Live data")
                        .invalidatableContent()  // defaults to true
                    """
                )
            }

            ICVariantRow(title: "Branch on a Bool to opt in/out") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Selected widget value")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("$1,234.56")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .invalidatableContent(isInvalidatable)
                    Toggle("isInvalidatable", isOn: $isInvalidatable)
                        .toggleStyle(.switch)
                        .frame(maxWidth: 240, alignment: .leading)
                    APICallout(".invalidatableContent(isInvalidatable)")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ICVariantRow(title: "Pairs with .redacted(reason: .invalidated) for visualization") {
                HStack(alignment: .top, spacing: 24) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("plain")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                        Text("Hello, world!")
                            .font(.title2)
                            .padding(8)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".invalidatableContent() + .redacted(reason: .invalidated)")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                        Text("Hello, world!")
                            .font(.title2)
                            .invalidatableContent()
                            .redacted(reason: .invalidated)
                            .padding(8)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                    }
                }
            }
        }
    }

    private struct ICNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ICNote] = [
        .init(title: "Designed for interactive Widgets.",
              detail: "Inside an interactive widget, content marked invalidatable is dimmed from the moment a control is tapped until the next timeline update arrives. Use it to communicate \"value is being recomputed\".",
              symbol: "rectangle.dashed"),
        .init(title: "Triggered by .invalidated redaction reason.",
              detail: "The visual state activates when RedactionReasons.invalidated is present in the environment. Outside that environment, the modifier is inert.",
              symbol: "eye.slash"),
        .init(title: "Default parameter value is true.",
              detail: ".invalidatableContent() and .invalidatableContent(true) are equivalent. Pass false to opt back out within a subtree.",
              symbol: "gear"),
        .init(title: "Different from .redacted(reason: .placeholder).",
              detail: ".placeholder is for skeleton loading; .invalidated is specifically for \"value being recomputed\". Use the matching reason for the matching meaning.",
              symbol: "questionmark.circle"),
        .init(title: "Plain SwiftUI views won't show a default visual.",
              detail: "Outside widgets, you usually need to combine .invalidatableContent() with .redacted(reason: .invalidated) (or read \\.redactionReasons) to actually render the dimmed look.",
              symbol: "info.circle")
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

private struct ICCodeBlock: View {
    let api: String
    let code: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct ICVariantRow<Content: View>: View {
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
    InvalidatableContentPage()
        .frame(width: 1100, height: 800)
}
