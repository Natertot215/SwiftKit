import SwiftUI

// SwiftUI dialogSeverity reference page — bundles three symbols:
// • View/dialogSeverity(_:)
// • Scene/dialogSeverity(_:)
// • DialogSeverity (struct)
// Source: Documentation/SwiftUI/modal-presentations/dialogseverity(_:).md + dialogseverity.md
// View modifier: macOS 13.0+. Scene modifier: macOS 15.0+. Type: macOS 13.0+.

struct DialogSeverityPage: View {
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
            Text("View/dialogSeverity(_:) + Scene/dialogSeverity(_:) + DialogSeverity")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the severity for alerts. Use .critical when the action permanently destroys data; .standard for routine prompts; .automatic to defer to the system.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/dialogseverity(_:).md \u{00b7} View: macOS 13.0+ \u{00b7} Scene: macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DSSnippet(
            api: ".dialogSeverity(.critical)",
            code: """
            Button("Erase All Items") { isShowingDialog = true }
                .alert("Are you sure you want to erase these items?",
                       isPresented: $isShowingDialog) {
                    Button("Erase", role: .destructive) { … }
                    Button("Cancel", role: .cancel) { }
                }
                .dialogSeverity(.critical)
            """,
            note: "View modifier form. .critical adds extra visual prominence to the alert (caution icon, larger title)."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three values — DialogSeverity") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".automatic — system-chosen severity (default)")
                    APICallout(".standard — routine prompt, no extra prominence")
                    APICallout(".critical — destructive / non-recoverable action")
                }
            }

            VariantBlock(title: "Scene form — for AlertScene") {
                DSSnippet(
                    api: "Scene/dialogSeverity(_:)",
                    code: """
                    AlertScene(
                        "Are you sure you want to erase these items?",
                        isPresented: $isShowingDialog
                    ) {
                        Button("Erase", role: .destructive) { … }
                        Button("Cancel", role: .cancel) { }
                    }
                    .dialogSeverity(.critical)
                    """,
                    note: "When the alert is presented from a Scene (AlertScene), apply the Scene-form modifier."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Both surfaces share the same signature") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout("func dialogSeverity(_ severity: DialogSeverity) -> some View")
                    APICallout("func dialogSeverity(_ severity: DialogSeverity) -> some Scene")
                }
            }
        }
    }

    private struct DSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DSNote] = [
        .init(title: "Use .critical sparingly.",
              detail: "Reserve for permanent / non-recoverable destruction (delete files, sign out and lose state). Overuse desensitizes users.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Pair with destructive button role.",
              detail: "Severity affects the alert chrome; ButtonRole.destructive affects the button color. Use both together for the standard 'are you sure?' pattern.",
              symbol: "trash"),
        .init(title: "DialogSeverity conforms to Equatable, Sendable.",
              detail: "Available as a value type since iOS 17 / macOS 13. Use as a stored value in your view models if severity is dynamic.",
              symbol: "checkmark.seal"),
        .init(title: "View modifier predates Scene modifier.",
              detail: "View/dialogSeverity is macOS 13.0+; Scene/dialogSeverity is macOS 15.0+ (matching AlertScene's introduction).",
              symbol: "calendar")
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

private struct DSSnippet: View {
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
    DialogSeverityPage()
        .frame(width: 1100, height: 800)
}
