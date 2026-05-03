import SwiftUI

// SwiftUI `View/presentationCornerRadius(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/presentationcornerradius(_:).md
// macOS 13.3+ — but per the docs, NOT supported on macOS, watchOS, or tvOS.

struct PresentationCornerRadiusPage: View {
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
            Text("View/presentationCornerRadius(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Requests that the presentation have a specific corner radius. Per Apple: \"Configuring a corner radius is not supported on watchOS, tvOS, or macOS.\"")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/presentationcornerradius(_:).md \u{00b7} macOS 13.3+ \u{00b7} no visible effect on macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PCRSnippet(
            api: ".presentationCornerRadius(21)",
            code: """
            Button("View Settings") { showSettings = true }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                        .presentationDetents([.medium, .large])
                        .presentationCornerRadius(21)
                }
            """,
            note: "iOS-flavored — the corner radius affects the rounded shape of the sheet on iPadOS and iOS only."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Pass nil to use the system default") {
                PCRSnippet(
                    api: ".presentationCornerRadius(nil)",
                    code: """
                    .presentationCornerRadius(nil)
                    """,
                    note: "Reverts to the system-default radius."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                APICallout("func presentationCornerRadius(_ cornerRadius: CGFloat?) -> some View")
            }
        }
    }

    private struct PCRNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PCRNote] = [
        .init(title: "No effect on macOS, watchOS, or tvOS.",
              detail: "Apple's documentation explicitly states corner radius configuration is unsupported on these platforms. The modifier compiles but doesn't affect the sheet shape.",
              symbol: "macwindow"),
        .init(title: "iPadOS and iOS only — affects the sheet's rounded chrome.",
              detail: "On iPad sheets and iPhone sheets, the sheet panel is drawn with rounded corners. This modifier overrides their radius.",
              symbol: "ipad"),
        .init(title: "Compose with .presentationBackground for fully custom chrome.",
              detail: "Set both background and corner radius if you want a sheet that matches a brand surface.",
              symbol: "paintbrush"),
        .init(title: "Use sparingly — system radius is calibrated.",
              detail: "Apple has chosen the default radius to match adjacent UI. Custom values look obvious if they don't match the rest of your app's chrome.",
              symbol: "ruler")
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

private struct PCRSnippet: View {
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
    PresentationCornerRadiusPage()
        .frame(width: 1100, height: 800)
}
