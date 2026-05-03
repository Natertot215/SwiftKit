import SwiftUI

// SwiftUI `View/progressViewStyle(_:)` + `ProgressViewStyle` + `ProgressViewStyleConfiguration`
// Source: Documentation/SwiftUI/view-styles/progressviewstyle(_:).md (and protocol/configuration)
// macOS 11.0+. Built-in style values: .automatic, .linear, .circular.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 130

struct ProgressViewStylePage: View {
    @State private var value: Double = 0.4

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
            Text("View/progressViewStyle(_:) + ProgressViewStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for progress views in this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/progressviewstyle(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PVSCard(title: ".automatic — determinate", api: ".progressViewStyle(.automatic)") {
            ProgressView(value: value).progressViewStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Built-in styles, both determinate and indeterminate.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                PVSCard(title: ".automatic (determinate)", api: ".progressViewStyle(.automatic)") {
                    ProgressView(value: value).progressViewStyle(.automatic)
                }
                PVSCard(title: ".linear (determinate)", api: ".progressViewStyle(.linear)") {
                    ProgressView(value: value).progressViewStyle(.linear)
                }
                PVSCard(title: ".circular (determinate)", api: ".progressViewStyle(.circular)") {
                    ProgressView(value: value).progressViewStyle(.circular)
                }
                PVSCard(title: ".automatic (indeterminate)", api: "ProgressView() // no value") {
                    ProgressView().progressViewStyle(.automatic)
                }
                PVSCard(title: ".linear (indeterminate)", api: "ProgressView() // no value") {
                    ProgressView().progressViewStyle(.linear)
                }
                PVSCard(title: ".circular (indeterminate)", api: "ProgressView() // no value") {
                    ProgressView().progressViewStyle(.circular)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Live binding")
                    .font(.headline)
                Slider(value: $value, in: 0...1)
                    .frame(maxWidth: 360)
                APICallout("Slider(value: $value, in: 0...1)")
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("With label + currentValueLabel")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    PVSCard(title: ".linear + label", api: "ProgressView(\"Loading…\", value: …)") {
                        ProgressView("Loading…", value: value)
                            .progressViewStyle(.linear)
                    }
                    PVSCard(title: ".circular + label", api: "ProgressView(\"Loading…\", value: …)") {
                        ProgressView("Loading…", value: value)
                            .progressViewStyle(.circular)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Tint propagates")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    PVSCard(title: ".tint(.green)", api: ".tint(.green)") {
                        ProgressView(value: value).progressViewStyle(.linear).tint(.green)
                    }
                    PVSCard(title: ".tint(.purple)", api: ".tint(.purple)") {
                        ProgressView(value: value).progressViewStyle(.linear).tint(.purple)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("ProgressViewStyleConfiguration shape")
                    .font(.headline)
                PVSCodeBlock(text:
                    """
                    struct ProgressViewStyleConfiguration {
                        struct Label : View { … }
                        struct CurrentValueLabel : View { … }

                        var fractionCompleted: Double?    // nil = indeterminate
                        var label: Label?
                        var currentValueLabel: CurrentValueLabel?
                    }
                    """)
                Text("SwiftKit does NOT author custom ProgressViewStyle conformers per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct PVSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PVSNote] = [
        .init(title: ".automatic resolves to .linear in most macOS contexts.",
              detail: "macOS reaches for the bar when the ProgressView is in a list, form, or row. .circular shows up in toolbar/inspector contexts.",
              symbol: "rectangle"),
        .init(title: "Indeterminate vs determinate is data-driven, not style-driven.",
              detail: "Pass a value (0…1 or a Progress) for determinate; omit it for indeterminate. The same style renders both modes differently.",
              symbol: "questionmark.circle"),
        .init(title: "fractionCompleted is nil when indeterminate.",
              detail: "Custom conformers branch on configuration.fractionCompleted == nil to draw the spinner vs the bar/arc.",
              symbol: "function"),
        .init(title: "Wrap a Progress object for cancellable, reportable progress.",
              detail: "ProgressView(_:) accepts Progress. SwiftUI observes its fractionCompleted and updates the bar; supports nested children for hierarchical work.",
              symbol: "rectangle.stack"),
        .init(title: ".tint colors the fill.",
              detail: "Apply .tint(_:) to recolor both the bar and the spinner. Works with all built-in styles.",
              symbol: "paintpalette")
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

private struct PVSCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct PVSCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    ProgressViewStylePage()
        .frame(width: 1200, height: 1300)
}
