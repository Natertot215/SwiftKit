import SwiftUI

// SwiftUI deprecated `Alert` struct reference page.
// Source: Documentation/SwiftUI/modal-presentations/alert.md
// Deprecated in macOS 26.5. Documented for migration purposes — do not adopt
// in new code. Use the .alert(_:isPresented:actions:) view modifiers instead.

struct AlertTypePage: View {
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
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text("Alert")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Text("Deprecated")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(.tint.opacity(0.2), in: Capsule())
                    .foregroundStyle(.tint)
            }
            Text("A representation of an alert presentation. Deprecated in macOS 26.5 — use the .alert(_:isPresented:actions:) view modifiers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/alert.md \u{00b7} Deprecated macOS 26.5")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        ATSnippet(
            api: "Alert(title:message:primaryButton:secondaryButton:) — DEPRECATED",
            code: """
            // Deprecated form (do NOT use in new code):
            @State private var showAlert = false
            var body: some View {
                Button("Tap to show alert") { showAlert = true }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Unable to Save Workout Data"),
                            message: Text("The connection to the server was lost."),
                            primaryButton: .default(Text("Try Again"), action: saveWorkoutData),
                            secondaryButton: .destructive(Text("Delete"), action: deleteWorkoutData)
                        )
                    }
            }
            """,
            note: "The legacy Alert + Alert.Button API was removed by Apple from the recommended path in macOS 26.5."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Migration target — .alert(_:isPresented:actions:[message:])") {
                ATSnippet(
                    api: ".alert(_:isPresented:actions:message:)",
                    code: """
                    @State private var showAlert = false

                    var body: some View {
                        Button("Tap to show alert") { showAlert = true }
                            .alert("Unable to Save Workout Data", isPresented: $showAlert) {
                                Button("Try Again") { saveWorkoutData() }
                                Button("Delete", role: .destructive) { deleteWorkoutData() }
                            } message: {
                                Text("The connection to the server was lost.")
                            }
                    }
                    """,
                    note: "Equivalent behaviour using the supported view-modifier API. Roles + ViewBuilder replace primaryButton/secondaryButton."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Compare: Alert vs alert(_:isPresented:actions:)") {
                VStack(alignment: .leading, spacing: 12) {
                    SideBySideRow(
                        legacy: "Alert(title: Text(\"…\"), message: Text(\"…\"), dismissButton: .default(Text(\"OK\")))",
                        replacement: ".alert(\"…\", isPresented: $flag) { Button(\"OK\") { } } message: { Text(\"…\") }"
                    )
                    SideBySideRow(
                        legacy: "Alert(title: …, primaryButton: .default(…), secondaryButton: .cancel())",
                        replacement: ".alert(\"…\", isPresented: $flag) { Button(\"…\") { } ; Button(\"Cancel\", role: .cancel) { } }"
                    )
                    SideBySideRow(
                        legacy: ".destructive(Text(\"Delete\"), action: …)",
                        replacement: "Button(\"Delete\", role: .destructive) { … }"
                    )
                }
            }
        }
    }

    private struct AlertTypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [AlertTypeNote] = [
        .init(title: "Don't adopt in new code.",
              detail: "The Alert struct + Alert.Button API has been deprecated since iOS 15 / macOS 12 in spirit, and formally in macOS 26.5. New work should use the .alert(_:isPresented:actions:) family.",
              symbol: "exclamationmark.octagon"),
        .init(title: "Apple's stated migration: ViewBuilder + roles.",
              detail: "The replacement API uses a normal SwiftUI ViewBuilder for actions plus ButtonRole (.cancel, .destructive). This unifies alerts with confirmation dialogs.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: "ActionSheet has the same migration story.",
              detail: "Alert is for state-driven prompts. ActionSheet (also deprecated) was for action-response prompts — its migration target is .confirmationDialog(_:isPresented:titleVisibility:actions:).",
              symbol: "doc.on.doc")
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

private struct ATSnippet: View {
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

private struct SideBySideRow: View {
    let legacy: String
    let replacement: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Legacy")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                Text(legacy)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
                    .textSelection(.enabled)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 4) {
                Text("Replacement")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.tint)
                Text(replacement)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
                    .textSelection(.enabled)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(8)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
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
    AlertTypePage()
        .frame(width: 1100, height: 800)
}
