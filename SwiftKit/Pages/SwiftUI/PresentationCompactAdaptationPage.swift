import SwiftUI

// SwiftUI presentationCompactAdaptation reference page — bundles three symbols:
// • View/presentationCompactAdaptation(_:)
// • View/presentationCompactAdaptation(horizontal:vertical:)
// • PresentationAdaptation (struct + cases: .automatic .none .fullScreenCover .popover .sheet)
// Source: Documentation/SwiftUI/modal-presentations/presentationcompactadaptation(_:).md +
//         Documentation/SwiftUI/modal-presentations/presentationcompactadaptation(horizontal:vertical:).md +
//         Documentation/SwiftUI/modal-presentations/presentationadaptation.md
// macOS 13.3+. Effect is most visible on iOS in compact size classes.

struct PresentationCompactAdaptationPage: View {
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
            Text("View/presentationCompactAdaptation(…) + PresentationAdaptation")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies how to adapt a presentation to compact size classes. Useful when a popover should stay a popover (or become a sheet) on small screens.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/presentationcompactadaptation(horizontal:vertical:).md \u{00b7} macOS 13.3+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PCSnippet(
            api: ".presentationCompactAdaptation(.popover)",
            code: """
            Button("View Info") { showInfo = true }
                .popover(isPresented: $showInfo) {
                    InfoView()
                        .presentationCompactAdaptation(.popover)
                }
            """,
            note: "Single-axis form. Forces popover style even when the size class would otherwise adapt to a sheet."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Per-axis form — horizontal: vs vertical:") {
                PCSnippet(
                    api: ".presentationCompactAdaptation(horizontal: .popover, vertical: .sheet)",
                    code: """
                    .popover(isPresented: $showInfo) {
                        InfoView()
                            .presentationCompactAdaptation(
                                horizontal: .popover,
                                vertical: .sheet
                            )
                    }
                    """,
                    note: "When both dimensions are compact, SwiftUI uses the vertical value."
                )
            }

            VariantBlock(title: "PresentationAdaptation values") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".automatic — system chooses")
                    APICallout(".none — never adapt; keep the original presentation style")
                    APICallout(".sheet — adapt to a sheet")
                    APICallout(".popover — adapt to (or stay as) a popover")
                    APICallout(".fullScreenCover — adapt to a full-screen cover")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "macOS practical impact") {
                Text("On macOS the size class is always regular, so size-class adaptation rarely fires. The modifier is still legal and harmless — useful for cross-platform code that runs on iPhone too.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct PCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PCNote] = [
        .init(title: "Acts on the presented content, not the trigger.",
              detail: "Apply the modifier INSIDE the .popover / .sheet content closure (i.e. on the InfoView), not on the Button.",
              symbol: "arrow.down.to.line"),
        .init(title: "macOS rarely sees the effect.",
              detail: "macOS apps are always horizontal-regular + vertical-regular. The modifier is most useful on iPhone in landscape (vertical-compact) and split view (horizontal-compact).",
              symbol: "iphone.gen3.landscape"),
        .init(title: "PresentationAdaptation conforms to Sendable.",
              detail: "Five static values (.automatic .none .sheet .popover .fullScreenCover). The struct is Sendable, so it's safe to thread across actors.",
              symbol: "checkmark.seal"),
        .init(title: "Pair with .presentationDetents to control sheet sizing.",
              detail: "When the adaptation is .sheet, follow up with .presentationDetents([.medium, .large]) to give the sheet sensible heights.",
              symbol: "rectangle.bottomthird.inset.filled")
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

private struct PCSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

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
            if let note {
                Text(note).font(.footnote).foregroundStyle(.secondary)
            }
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
    PresentationCompactAdaptationPage()
        .frame(width: 1100, height: 800)
}
