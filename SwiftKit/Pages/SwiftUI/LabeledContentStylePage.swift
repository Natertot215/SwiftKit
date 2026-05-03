import SwiftUI

// SwiftUI `View/labeledContentStyle(_:)` + `LabeledContentStyle` + `LabeledContentStyleConfiguration`
// Source: Documentation/SwiftUI/view-styles/labeledcontentstyle(_:).md (and protocol/configuration)
// macOS 13.0+. Built-in style values: .automatic.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 130

struct LabeledContentStylePage: View {
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
            Text("View/labeledContentStyle(_:) + LabeledContentStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets a style for labeled content within this view. LabeledContentStyle is the protocol; LabeledContentStyleConfiguration is the data shape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/labeledcontentstyle(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        LCSCard(title: ".automatic", api: ".labeledContentStyle(.automatic)") {
            sampleContent.labeledContentStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Apple ships .automatic publicly. The protocol exists for custom conformers — SwiftKit doesn't author them per project hard constraint.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                LCSCard(title: "Inside Form (key-value layout)", api: "Form { LabeledContent(\"Email\") { Text(\"…\") } }") {
                    Form {
                        LabeledContent("Email") { Text("ada@apple.com") }
                        LabeledContent("Status") { Text("Active") }
                        LabeledContent("Plan") { Text("Pro") }
                    }
                }
                LCSCard(title: "Standalone (inline layout)", api: "LabeledContent(\"Email\") { Text(\"…\") }") {
                    VStack(alignment: .leading, spacing: 8) {
                        LabeledContent("Email") { Text("ada@apple.com") }
                        LabeledContent("Status") { Text("Active") }
                        LabeledContent("Plan") { Text("Pro") }
                    }
                }
            }
        }
    }

    private var sampleContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            LabeledContent("Email") { Text("ada@apple.com") }
            LabeledContent("Status") { Text("Active") }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("LabeledContentStyleConfiguration shape")
                .font(.headline)
            LCSCodeBlock(text:
                """
                struct LabeledContentStyleConfiguration {
                    struct Label : View { … }      // type-erased label
                    struct Content : View { … }    // type-erased content

                    var label: Label
                    var content: Content
                }
                """)
            Text("SwiftKit does NOT author custom LabeledContentStyle conformers per project hard constraint.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private struct LCSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LCSNote] = [
        .init(title: ".automatic is the only public conformer.",
              detail: "Apple ships one literal — the protocol is the extension point for custom layouts. .automatic resolves to the macOS Settings.app pattern in Form contexts.",
              symbol: "rectangle.split.2x1"),
        .init(title: "Inside a Form, .automatic produces label-trailing-content layout.",
              detail: "The macOS-canonical key-value pair: label right-aligned in the leading column, content trailing. Outside Form it's a horizontal stack.",
              symbol: "tablecells"),
        .init(title: "LabeledContent is the proper way to make Form rows.",
              detail: "Don't HStack { Text(label); Spacer(); Text(value) }. Use LabeledContent — it integrates with Accessibility and adapts to Form context.",
              symbol: "list.bullet"),
        .init(title: "Custom conformers compose label and content however they like.",
              detail: "Stack vertically, swap order, color the label, hide one — all via the type-erased Label and Content sub-views in the configuration.",
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

private struct LCSCard<Content: View>: View {
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
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct LCSCodeBlock: View {
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
    LabeledContentStylePage()
        .frame(width: 1200, height: 1000)
}
