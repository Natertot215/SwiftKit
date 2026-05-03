import SwiftUI

// SwiftUI deprecated `ActionSheet` struct reference page.
// Source: Documentation/SwiftUI/modal-presentations/actionsheet.md
// Deprecated in macOS 26.5. Migration target: .confirmationDialog(_:isPresented:titleVisibility:actions:).

struct ActionSheetTypePage: View {
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
                Text("ActionSheet")
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
            Text("A representation of an action sheet presentation. Deprecated in macOS 26.5 — use .confirmationDialog(_:isPresented:titleVisibility:actions:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/actionsheet.md \u{00b7} Deprecated macOS 26.5")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        AsSnippet(
            api: "ActionSheet(title:message:buttons:) — DEPRECATED",
            code: """
            // Deprecated form (do NOT use in new code):
            @State private var showActionSheet = false
            var body: some View {
                Button("Tap to show action sheet") { showActionSheet = true }
                    .actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(
                            title: Text("Resume Workout Recording"),
                            message: Text("Choose a destination for workout data"),
                            buttons: [
                                .cancel(),
                                .destructive(Text("Overwrite Current Workout"), action: overwriteWorkout),
                                .default(Text("Append to Current Workout"), action: appendWorkout)
                            ]
                        )
                    }
            }
            """,
            note: "ActionSheet + ActionSheet.Button is replaced by .confirmationDialog with a ButtonRole-driven ViewBuilder."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Migration target — .confirmationDialog(_:isPresented:titleVisibility:actions:[message:])") {
                AsSnippet(
                    api: ".confirmationDialog(_:isPresented:titleVisibility:actions:message:)",
                    code: """
                    @State private var showDialog = false

                    var body: some View {
                        Button("Tap to show action sheet") { showDialog = true }
                            .confirmationDialog(
                                "Resume Workout Recording",
                                isPresented: $showDialog,
                                titleVisibility: .visible
                            ) {
                                Button("Overwrite Current Workout", role: .destructive) { overwriteWorkout() }
                                Button("Append to Current Workout") { appendWorkout() }
                                Button("Cancel", role: .cancel) { }
                            } message: {
                                Text("Choose a destination for workout data")
                            }
                    }
                    """,
                    note: "Same multi-action user-response pattern, using the supported confirmationDialog API."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "ActionSheet.Button cases → ButtonRole") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".cancel() → Button(\"Cancel\", role: .cancel) { }")
                    APICallout(".default(Text(\"…\"), action:) → Button(\"…\") { … }")
                    APICallout(".destructive(Text(\"…\"), action:) → Button(\"…\", role: .destructive) { … }")
                }
            }
        }
    }

    private struct ASTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ASTNote] = [
        .init(title: "Don't adopt in new code.",
              detail: "ActionSheet has been deprecated in macOS 26.5 and the entire family of supporting modifiers (.actionSheet) is gone. New work uses .confirmationDialog.",
              symbol: "exclamationmark.octagon"),
        .init(title: "Action sheet ≠ alert.",
              detail: "Apple's distinction: Alert is for app/system state; ActionSheet (now confirmationDialog) is for user-initiated choices. Pick the right modifier accordingly.",
              symbol: "questionmark.circle"),
        .init(title: "macOS confirmationDialog presents as a popover or alert.",
              detail: "On macOS, confirmationDialog renders contextually — often as a popover from the trigger. It does not literally render an iOS-style action sheet from the bottom.",
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

private struct AsSnippet: View {
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
    ActionSheetTypePage()
        .frame(width: 1100, height: 800)
}
