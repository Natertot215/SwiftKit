import SwiftUI

// SwiftUI `View/labelStyle(_:)` + `LabelStyle` + `LabelStyleConfiguration` page.
// Source: Documentation/SwiftUI/view-styles/labelstyle(_:).md, labelstyle.md, labelstyleconfiguration.md
// macOS 11.0+. Built-in style values: .automatic, .titleAndIcon, .titleOnly, .iconOnly.

private let demoFrameWidth: CGFloat = 240
private let demoFrameHeight: CGFloat = 70

struct LabelStylePage: View {
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
            Text("View/labelStyle(_:) + LabelStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for labels within this view. LabelStyle is the protocol; LabelStyleConfiguration is the data shape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/labelstyle(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        LSCard(title: ".automatic", api: ".labelStyle(.automatic)") {
            sampleLabel.labelStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Four built-in LabelStyle values.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                LSCard(title: ".automatic", api: ".labelStyle(.automatic)") {
                    sampleLabel.labelStyle(.automatic)
                }
                LSCard(title: ".titleAndIcon", api: ".labelStyle(.titleAndIcon)") {
                    sampleLabel.labelStyle(.titleAndIcon)
                }
                LSCard(title: ".titleOnly", api: ".labelStyle(.titleOnly)") {
                    sampleLabel.labelStyle(.titleOnly)
                }
                LSCard(title: ".iconOnly", api: ".labelStyle(.iconOnly)") {
                    sampleLabel.labelStyle(.iconOnly)
                }
            }
        }
    }

    private var sampleLabel: some View {
        Label("Send", systemImage: "paperplane.fill")
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Inside controls — labelStyle drives Button/Toggle/Menu rendering")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    LSCard(title: "Button + .iconOnly", api: ".labelStyle(.iconOnly)") {
                        Button(action: {}) { Label("Send", systemImage: "paperplane.fill") }
                            .labelStyle(.iconOnly)
                            .buttonStyle(.bordered)
                    }
                    LSCard(title: "Button + .titleOnly", api: ".labelStyle(.titleOnly)") {
                        Button(action: {}) { Label("Send", systemImage: "paperplane.fill") }
                            .labelStyle(.titleOnly)
                            .buttonStyle(.bordered)
                    }
                    LSCard(title: "Button + .titleAndIcon", api: ".labelStyle(.titleAndIcon)") {
                        Button(action: {}) { Label("Send", systemImage: "paperplane.fill") }
                            .labelStyle(.titleAndIcon)
                            .buttonStyle(.bordered)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("LabelStyleConfiguration shape")
                    .font(.headline)
                LSCodeBlock(text:
                    """
                    struct LabelStyleConfiguration {
                        struct Title : View { … }   // type-erased title
                        struct Icon : View { … }    // type-erased icon

                        var title: Title
                        var icon: Icon
                    }
                    """)
                Text("SwiftKit does NOT author custom conformers per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct LSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LSNote] = [
        .init(title: ".automatic resolves contextually.",
              detail: "Inside a Form or List row, .automatic is .titleAndIcon. Inside a toolbar with a tight button, .automatic may collapse to .iconOnly. Override explicitly when you need certainty.",
              symbol: "questionmark.circle"),
        .init(title: ".iconOnly collapses tap targets to the icon's frame.",
              detail: "Add .accessibilityLabel(_:) when stripping the title — VoiceOver users still need it.",
              symbol: "accessibility"),
        .init(title: ".titleAndIcon respects per-platform layout.",
              detail: "On macOS this lays out icon-then-title horizontally; in tighter contexts it can wrap. Don't hand-build an HStack — let LabelStyle handle it.",
              symbol: "rectangle.split.2x1"),
        .init(title: "Inheritance like other style modifiers.",
              detail: ".labelStyle(_:) walks down. Apply once on a Toolbar or Form and every Label inside picks it up.",
              symbol: "arrow.down"),
        .init(title: "Custom conformers compose configuration.title and configuration.icon.",
              detail: "The type-erased Title/Icon let you arrange them however you like — stack vertically, swap order, hide one — without rebuilding the source content.",
              symbol: "rectangle.dashed")
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

private struct LSCard<Content: View>: View {
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
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct LSCodeBlock: View {
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
    LabelStylePage()
        .frame(width: 1200, height: 1100)
}
