import SwiftUI

// SwiftUI `View/interactiveDismissDisabled(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/interactivedismissdisabled(_:).md
// macOS 12.0+. Conditionally prevents interactive dismissal of sheets/popovers/inspectors.

private let demoFrameWidth: CGFloat = 480

struct InteractiveDismissDisabledPage: View {
    @State private var showSheet = false
    @State private var areTermsAccepted = false

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
            Text("View/interactiveDismissDisabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Conditionally prevents interactive dismissal of presentations like popovers, sheets, and inspectors. Apply on the presentation's content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/interactivedismissdisabled(_:).md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".interactiveDismissDisabled() — block Esc/click-outside on a sheet") {
            VStack(alignment: .leading, spacing: 8) {
                Button("Open required sheet") { showSheet = true }
                    .buttonStyle(.borderedProminent)
                Text("Sheet's body uses .interactiveDismissDisabled(true) until Accept is tapped.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .sheet(isPresented: $showSheet) {
                TermsSheet(areTermsAccepted: $areTermsAccepted)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Conditional — bind to a Bool") {
                IDSnippet(
                    api: ".interactiveDismissDisabled(!areTermsAccepted)",
                    code: """
                    .sheet(isPresented: $showTerms) {
                        TermsOfService(areTermsAccepted: $areTermsAccepted)
                            .interactiveDismissDisabled(!areTermsAccepted)
                    }
                    """,
                    note: "Apple's reference example: dismissal is BLOCKED while the user hasn't accepted; allowed once they have."
                )
            }

            VariantBlock(title: "Default parameter — true") {
                IDSnippet(
                    api: ".interactiveDismissDisabled()",
                    code: """
                    .interactiveDismissDisabled()         // === true
                    .interactiveDismissDisabled(true)
                    """,
                    note: "The parameter defaults to true — calling without arguments is the same as `(true)`. Use `(false)` to explicitly re-enable interactive dismissal."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — disabled vs enabled") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".interactiveDismissDisabled() — Esc + click-outside blocked") {
                        Text("(Sheet body)")
                            .padding(8)
                    }
                    StateColumn(label: ".interactiveDismissDisabled(false) — default behavior") {
                        Text("(Sheet body)")
                            .padding(8)
                    }
                }
            }
        }
    }

    private struct IDNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [IDNote] = [
        .init(title: "Apply on the presented content.",
              detail: "The modifier sits inside the .sheet/.popover/.inspector content closure on the inner view — NOT on the trigger button.",
              symbol: "arrow.down.to.line"),
        .init(title: "Doesn't disable programmatic dismiss.",
              detail: "Only blocks user GESTURES (Esc, click-outside, drag-to-dismiss). Code can still call `dismiss()` or set the bound Bool to false.",
              symbol: "command"),
        .init(title: "Provide an explicit dismissal path.",
              detail: "If you block the gesture, the user must have a button. Otherwise the sheet can become a trap. Apple's example pairs the modifier with an Accept button that calls dismiss().",
              symbol: "arrow.right.circle"),
        .init(title: "Default parameter is true.",
              detail: "`.interactiveDismissDisabled()` and `.interactiveDismissDisabled(true)` are equivalent. Pass false explicitly to override an inherited disable.",
              symbol: "switch.2"),
        .init(title: "Pair with .presentationDragIndicator(.hidden).",
              detail: "If interactive dismissal is disabled but the sheet's drag indicator is visible, users get mixed signals. Hide the indicator in lockstep.",
              symbol: "minus")
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

private struct TermsSheet: View {
    @Binding var areTermsAccepted: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("License Agreement")
                .font(.title2)
                .fontWeight(.semibold)
            Text("Terms and conditions go here.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack {
                Spacer()
                Button("Accept") {
                    areTermsAccepted = true
                    dismiss()
                }
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding(32)
        .frame(minWidth: 360, minHeight: 220)
        .interactiveDismissDisabled(!areTermsAccepted)
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

private struct IDSnippet: View {
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

private struct StateColumn<Content: View>: View {
    let label: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 280, alignment: .leading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
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
    InteractiveDismissDisabledPage()
        .frame(width: 1100, height: 800)
}
