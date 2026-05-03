import SwiftUI

// SwiftUI dialogSuppressionToggle reference page — bundles four overloads:
// • View/dialogSuppressionToggle(isSuppressed:)
// • Scene/dialogSuppressionToggle(isSuppressed:)
// • View/dialogSuppressionToggle(_:isSuppressed:)
// • Scene/dialogSuppressionToggle(_:isSuppressed:)
// Source: Documentation/SwiftUI/modal-presentations/dialogsuppressiontoggle(issuppressed:).md
// macOS 15.0+. Adds a "Don't ask again" toggle to alerts.

struct DialogSuppressionTogglePage: View {
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
            Text("View/Scene.dialogSuppressionToggle(_:isSuppressed:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a suppression toggle to dialogs on macOS — a 'Don't ask again' checkbox that lets users opt out of future presentations.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/dialogsuppressiontoggle(issuppressed:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DSTSnippet(
            api: ".dialogSuppressionToggle(isSuppressed: $suppressAlert)",
            code: """
            @AppStorage("suppressEraseItemAlert") private var suppressAlert = false
            @State private var isShowingDialog = false

            var body: some View {
                Button("Delete items") { isShowingDialog = true }
                    .alert(
                        "Are you sure you want to erase these items?",
                        isPresented: $isShowingDialog
                    ) {
                        Button("Erase", role: .destructive) { … }
                        Button("Cancel", role: .cancel) { }
                    }
                    .dialogSuppressionToggle(isSuppressed: $suppressAlert)
            }
            """,
            note: "View modifier with default label. Pair with @AppStorage to persist the user's choice."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Custom label — dialogSuppressionToggle(_:isSuppressed:)") {
                DSTSnippet(
                    api: ".dialogSuppressionToggle(\"Do not ask about erasing items again\", isSuppressed: $suppressAlert)",
                    code: """
                    .dialogSuppressionToggle(
                        "Do not ask about erasing items again",
                        isSuppressed: $suppressAlert
                    )
                    """,
                    note: "Provides custom toggle text. Defaults to a localized 'Don't ask again' equivalent."
                )
            }

            VariantBlock(title: "Scene form — for AlertScene") {
                DSTSnippet(
                    api: "Scene/dialogSuppressionToggle(_:isSuppressed:)",
                    code: """
                    AlertScene(
                        "Are you sure you want to erase these items?",
                        isPresented: $isShowingDialog
                    ) {
                        Button("Erase", role: .destructive) { … }
                        Button("Cancel", role: .cancel) { }
                    }
                    .dialogSuppressionToggle(
                        "Do not ask about erasing items again",
                        isSuppressed: $suppressAlert
                    )
                    """,
                    note: "When the alert lives at App body level, use the Scene modifier."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "All four shapes") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout("func dialogSuppressionToggle(isSuppressed: Binding<Bool>) -> some View")
                    APICallout("func dialogSuppressionToggle<S: StringProtocol>(_ title: S, isSuppressed: Binding<Bool>) -> some View")
                    APICallout("func dialogSuppressionToggle(isSuppressed: Binding<Bool>) -> some Scene")
                    APICallout("func dialogSuppressionToggle<S: StringProtocol>(_ title: S, isSuppressed: Binding<Bool>) -> some Scene")
                }
            }
        }
    }

    private struct DSTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DSTNote] = [
        .init(title: "macOS-only.",
              detail: "Suppression toggles are an OS X / macOS UX convention. The modifier is a no-op elsewhere.",
              symbol: "macwindow"),
        .init(title: "Persist with @AppStorage.",
              detail: "Bind the toggle to an @AppStorage value so the user's preference survives launches. The bound Bool is what BOTH controls suppression next time AND captures the user's selection now.",
              symbol: "externaldrive"),
        .init(title: "Use only for non-critical recoverable warnings.",
              detail: "Don't suppress destructive alerts (.dialogSeverity(.critical)). Save it for things like 'this app sends crash reports' or 'reformatting may take a while'.",
              symbol: "exclamationmark.bubble"),
        .init(title: "App is responsible for honoring the bool.",
              detail: "The framework ADDS the toggle to the dialog and updates the bound Bool. Suppressing future presentations is up to your code — typically `if !suppressAlert { isShowingDialog = true }`.",
              symbol: "switch.2")
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

private struct DSTSnippet: View {
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
    DialogSuppressionTogglePage()
        .frame(width: 1100, height: 800)
}
