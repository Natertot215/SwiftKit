import SwiftUI

// SwiftUI `View/presentationDragIndicator(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/presentationdragindicator(_:).md
// macOS 13.0+. Sets visibility of the drag indicator on a sheet — most useful on iOS.

struct PresentationDragIndicatorPage: View {
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
            Text("View/presentationDragIndicator(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the visibility of the drag indicator on top of a sheet.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/presentationdragindicator(_:).md \u{00b7} macOS 13.0+ (iOS-flavored)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PDISnippet(
            api: ".presentationDragIndicator(.visible)",
            code: """
            Button("View Settings") { showSettings = true }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                }
            """,
            note: "Forces the drag indicator (the small horizontal grabber at the top of a sheet) to appear regardless of the system default."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Visibility values") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".automatic — system default (typically hidden when not needed)")
                    APICallout(".visible — always show the drag handle")
                    APICallout(".hidden — never show the drag handle")
                }
            }

            VariantBlock(title: ".hidden — suppress when content already implies resizing") {
                PDISnippet(
                    api: ".presentationDragIndicator(.hidden)",
                    code: """
                    .sheet(isPresented: $showSettings) {
                        SettingsView()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.hidden)
                    }
                    """,
                    note: "Use when your sheet has its own resize affordance, or when interactive dismissal is disabled."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "When .visible is helpful") {
                Text("Apple's documentation recommends showing the drag indicator when it isn't apparent that a sheet can resize, or when the sheet can't dismiss interactively (.interactiveDismissDisabled = true).")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct PDINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PDINote] = [
        .init(title: "Most visible on iOS sheets with detents.",
              detail: "macOS sheets don't show a drag indicator in the same form. The modifier is a no-op on macOS in most contexts.",
              symbol: "macwindow"),
        .init(title: "The parameter is Visibility, not Bool.",
              detail: "Use the `.automatic / .visible / .hidden` triple, not true/false. Same Visibility type as in `.toolbar(_:for:)` and other places.",
              symbol: "eye"),
        .init(title: "Compose with .presentationDetents.",
              detail: "Hand-in-hand with detents — the drag indicator advertises that the user can resize. With a single detent there's nothing to drag to.",
              symbol: "rectangle.bottomthird.inset.filled"),
        .init(title: "Pair with .interactiveDismissDisabled to clarify intent.",
              detail: "If interactive dismissal is disabled but the sheet can still resize, .visible signals \"you can resize this, but you can't drag it away.\"",
              symbol: "lock.shield")
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

private struct PDISnippet: View {
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
    PresentationDragIndicatorPage()
        .frame(width: 1100, height: 800)
}
