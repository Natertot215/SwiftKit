import SwiftUI

// SwiftUI presentationContentInteraction reference page — bundles two symbols:
// • View/presentationContentInteraction(_:)
// • PresentationContentInteraction (struct: .automatic .resizes .scrolls)
// Source: Documentation/SwiftUI/modal-presentations/presentationcontentinteraction(_:).md +
//         presentationcontentinteraction.md
// macOS 13.3+. Controls how a sheet at a non-largest detent responds to swipe gestures.

struct PresentationContentInteractionPage: View {
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
            Text("View/presentationContentInteraction(_:) + PresentationContentInteraction")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Decides whether an upward swipe inside a sheet resizes the sheet (snaps to a larger detent) or scrolls the sheet's content. Most relevant on iOS sheets with detents.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/presentationcontentinteraction(_:).md \u{00b7} macOS 13.3+ (iOS-flavored)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PCIsnippet(
            api: ".presentationContentInteraction(.scrolls)",
            code: """
            .sheet(isPresented: $showSettings) {
                SettingsView()
                    .presentationDetents([.medium, .large])
                    .presentationContentInteraction(.scrolls)
            }
            """,
            note: "An upward swipe inside the sheet scrolls the content first, only resizing the sheet once the scroll view hits its top."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "PresentationContentInteraction values") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".automatic — system default behavior")
                    APICallout(".resizes — swipe always resizes the sheet first")
                    APICallout(".scrolls — swipe scrolls the content first")
                }
            }

            VariantBlock(title: ".resizes — sheet grabs the gesture") {
                PCIsnippet(
                    api: ".presentationContentInteraction(.resizes)",
                    code: """
                    .sheet(isPresented: $showSettings) {
                        SettingsView()
                            .presentationDetents([.medium, .large])
                            .presentationContentInteraction(.resizes)
                    }
                    """,
                    note: "Drag inside the sheet always tries to expand to the next detent. Use when content scrolling isn't expected."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Compose with .presentationDetents") {
                Text("This modifier only affects sheets that have multiple detents — at the .large detent or with no detents specified, there's nowhere to resize TO.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct PCINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PCINote] = [
        .init(title: "Effect requires multiple detents.",
              detail: "Without `.presentationDetents([.medium, .large])` (or similar), the sheet has nowhere to grow — and the modifier becomes a no-op.",
              symbol: "rectangle.bottomthird.inset.filled"),
        .init(title: ".scrolls is the natural pick when content scrolls.",
              detail: "If your sheet contains a Form or List, .scrolls keeps the swipe gesture going to the scroll view first — the more familiar interaction.",
              symbol: "scroll"),
        .init(title: ".resizes overrides the scroll view.",
              detail: "If you need the sheet to expand reliably (e.g. quick-action sheet), .resizes makes the sheet steal the gesture from any inner ScrollView.",
              symbol: "arrow.up.and.down"),
        .init(title: "macOS sheets don't have detents.",
              detail: "Like all detent-related modifiers, this is mostly an iOS surface. Documented for cross-platform completeness.",
              symbol: "macwindow")
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

private struct PCIsnippet: View {
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
    PresentationContentInteractionPage()
        .frame(width: 1100, height: 800)
}
