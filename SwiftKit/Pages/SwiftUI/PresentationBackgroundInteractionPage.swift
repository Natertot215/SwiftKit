import SwiftUI

// SwiftUI presentationBackgroundInteraction reference page — bundles two symbols:
// • View/presentationBackgroundInteraction(_:)
// • PresentationBackgroundInteraction (struct: .automatic .disabled .enabled .enabled(upThrough:))
// Source: Documentation/SwiftUI/modal-presentations/presentationbackgroundinteraction(_:).md +
//         presentationbackgroundinteraction.md
// macOS 13.3+ (iOS-flavored).

struct PresentationBackgroundInteractionPage: View {
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
            Text("View/presentationBackgroundInteraction(_:) + PresentationBackgroundInteraction")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Controls whether views behind a presented sheet can receive interaction. Useful when the sheet shouldn't fully block the underlying UI.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/presentationbackgroundinteraction(_:).md \u{00b7} macOS 13.3+ (iOS-flavored)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PBISnippet(
            api: ".presentationBackgroundInteraction(.enabled(upThrough: .medium))",
            code: """
            .sheet(isPresented: $showCalibration) {
                CalibrationStepsView()
                    .presentationDetents([.medium, .large])
                    .presentationBackgroundInteraction(
                        .enabled(upThrough: .medium)
                    )
            }
            """,
            note: "Background interactions are enabled while the sheet sits at .medium or smaller; disabled once it expands to .large."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "PresentationBackgroundInteraction values") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".automatic — system default (typically disabled)")
                    APICallout(".disabled — block all background interaction")
                    APICallout(".enabled — allow background interaction at all detents")
                    APICallout(".enabled(upThrough: PresentationDetent) — allow interaction up to a specific detent height")
                }
            }

            VariantBlock(title: ".enabled — full pass-through") {
                PBISnippet(
                    api: ".presentationBackgroundInteraction(.enabled)",
                    code: """
                    .sheet(isPresented: $showOverlay) {
                        OverlayControls()
                            .presentationBackgroundInteraction(.enabled)
                    }
                    """,
                    note: "Background views remain interactive at any detent. Use for HUD-style overlays."
                )
            }

            VariantBlock(title: ".disabled — explicit block") {
                PBISnippet(
                    api: ".presentationBackgroundInteraction(.disabled)",
                    code: """
                    .sheet(isPresented: $showFlow) {
                        OnboardingStep()
                            .presentationBackgroundInteraction(.disabled)
                    }
                    """,
                    note: "Force-blocks background interaction even if the system default would allow it."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Combine with detents") {
                Text(".enabled(upThrough:) is most useful with .presentationDetents — it ties background interactivity to the detent the user is currently dragging the sheet to.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct PBINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PBINote] = [
        .init(title: "Default behavior is .automatic — usually disabled.",
              detail: "Without this modifier, sheets block interaction with the views behind them. The modifier is for opting INTO pass-through behavior.",
              symbol: "hand.raised"),
        .init(title: ".enabled(upThrough:) is the precision tool.",
              detail: "Lets users keep interacting with the map / canvas / list while the sheet is small, then automatically locks them out once the sheet expands.",
              symbol: "rectangle.expand.vertical"),
        .init(title: "PresentationBackgroundInteraction is a struct, not enum.",
              detail: "The four cases are static members. The struct conforms to Sendable so you can store and pass it across actors.",
              symbol: "checkmark.seal"),
        .init(title: "Pair with .presentationBackground(.thinMaterial).",
              detail: "When the sheet is partially transparent (a Material background) AND the background remains interactive, users feel the underlying UI is still 'there' — the right pairing for inspector-style sheets.",
              symbol: "rectangle.on.rectangle.angled")
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

private struct PBISnippet: View {
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
    PresentationBackgroundInteractionPage()
        .frame(width: 1100, height: 800)
}
