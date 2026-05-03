import SwiftUI

// SwiftUI `PopoverAttachmentAnchor` enum reference page.
// Source: Documentation/SwiftUI/popovers/popoverattachmentanchor.md
// Two cases: .rect(Anchor<CGRect>.Source) and .point(UnitPoint).
// Used as the `attachmentAnchor:` parameter to the .popover modifier overloads.

private let demoFrameWidth: CGFloat = 400

struct PopoverAttachmentAnchorPage: View {
    @State private var bounds = false
    @State private var pointTopLeading = false
    @State private var pointBottomTrailing = false
    @State private var pointCenter = false

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
            Text("PopoverAttachmentAnchor")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("An attachment anchor for a popover.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/popovers/popoverattachmentanchor.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".popover(isPresented: $bounds, attachmentAnchor: .rect(.bounds)) { … }") {
            Button("Anchor: .rect(.bounds)") { bounds = true }
                .buttonStyle(.borderedProminent)
                .popover(isPresented: $bounds,
                         attachmentAnchor: .rect(.bounds)) {
                    AnchorBody(text: "Anchored to the trigger button's bounds rect — the default.")
                }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".point(.topLeading)") {
                DemoCard(api: ".popover(isPresented:, attachmentAnchor: .point(.topLeading))") {
                    Button("Top-leading point") { pointTopLeading = true }
                        .popover(isPresented: $pointTopLeading,
                                 attachmentAnchor: .point(.topLeading)) {
                            AnchorBody(text: "Attached to the top-leading UnitPoint of the trigger.")
                        }
                }
            }

            VariantBlock(title: ".point(.bottomTrailing)") {
                DemoCard(api: ".popover(isPresented:, attachmentAnchor: .point(.bottomTrailing))") {
                    Button("Bottom-trailing point") { pointBottomTrailing = true }
                        .popover(isPresented: $pointBottomTrailing,
                                 attachmentAnchor: .point(.bottomTrailing)) {
                            AnchorBody(text: "Attached to the bottom-trailing UnitPoint of the trigger.")
                        }
                }
            }

            VariantBlock(title: ".point(.center)") {
                DemoCard(api: ".popover(isPresented:, attachmentAnchor: .point(.center))") {
                    Button("Center point") { pointCenter = true }
                        .popover(isPresented: $pointCenter,
                                 attachmentAnchor: .point(.center)) {
                            AnchorBody(text: "Attached to the center UnitPoint — the popover surrounds the trigger's middle.")
                        }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "API surface") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("PopoverAttachmentAnchor has exactly two cases:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("case rect(Anchor<CGRect>.Source)")
                    APICallout("case point(UnitPoint)")
                    Text("Use .rect when you want the popover to attach relative to a sub-rectangle of the source view. Use .point when a single coordinate is enough.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct AnchorNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [AnchorNote] = [
        .init(title: "The default is .rect(.bounds).",
              detail: "Most popovers don't need a custom anchor — the entire trigger view's frame is the anchor by default.",
              symbol: "checkmark.circle"),
        .init(title: ".rect can target a sub-region.",
              detail: "Anchor<CGRect>.Source includes .bounds and custom values, allowing the popover to attach to any sub-rectangle defined inside the trigger.",
              symbol: "rectangle.dashed"),
        .init(title: ".point uses UnitPoint coordinates.",
              detail: "UnitPoint values like .topLeading, .bottom, .center map onto the trigger's bounds. Pair with arrowEdge to control the arrow direction.",
              symbol: "scope")
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

private struct AnchorBody: View {
    let text: String

    var body: some View {
        Text(text)
            .padding(16)
            .frame(maxWidth: 240, alignment: .leading)
    }
}

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, alignment: .leading)
                .padding(12)
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
    PopoverAttachmentAnchorPage()
        .frame(width: 1100, height: 800)
}
