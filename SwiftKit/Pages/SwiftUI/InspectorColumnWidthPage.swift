import SwiftUI

// SwiftUI inspectorColumnWidth reference page — bundles two overloads:
// • View/inspectorColumnWidth(_:)             — fixed width
// • View/inspectorColumnWidth(min:ideal:max:) — flexible width
// Source: Documentation/SwiftUI/inspectors/inspectorcolumnwidth(_:).md +
//         inspectorcolumnwidth(min:ideal:max:).md
// macOS 14.0+.

struct InspectorColumnWidthPage: View {
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
            Text("View/inspectorColumnWidth(_:) + View/inspectorColumnWidth(min:ideal:max:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the fixed or flexible width for an inspector column. Apply to the content of .inspector(isPresented:content:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/inspectors/inspectorcolumnwidth(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        ICWSnippet(
            api: ".inspectorColumnWidth(225)",
            code: """
            MyEditorView()
                .inspector {
                    TextTraitsInspectorView()
                        .inspectorColumnWidth(225)
                        .interactiveDismissDisabled()
                }
            """,
            note: "Fixed-width form. Apple's docs note that fixed width does NOT prevent the user from collapsing the inspector — pair with .interactiveDismissDisabled() if collapse should be programmatic-only."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Flexible — inspectorColumnWidth(min:ideal:max:)") {
                ICWSnippet(
                    api: ".inspectorColumnWidth(min: 150, ideal: 225, max: 400)",
                    code: """
                    MyEditorView()
                        .inspector {
                            TextTraitsInspectorView()
                                .inspectorColumnWidth(
                                    min: 150,
                                    ideal: 225,
                                    max: 400
                                )
                        }
                    """,
                    note: "User can drag the leading divider to resize. ideal is the initial width; min triggers collapse on macOS if allowed."
                )
            }

            VariantBlock(title: "Both signatures") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout("func inspectorColumnWidth(_ width: CGFloat) -> some View")
                    APICallout("func inspectorColumnWidth(min: CGFloat? = nil, ideal: CGFloat, max: CGFloat? = nil) -> some View")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Fixed vs flexible") {
                Text("Fixed (CGFloat overload) is best when the inspector content has a single sensible width and shouldn't be resizable. Flexible (min/ideal/max overload) lets the user adjust within a band you control.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "Platform support varies") {
                Text("Per Apple's docs: \"Only some platforms enable flexible inspector columns. If you specify a width that the current presentation environment doesn't support, SwiftUI may use a different width for your column.\"")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct ICWNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ICWNote] = [
        .init(title: "Apply on the inspector CONTENT, not the parent.",
              detail: "The modifier sits inside the .inspector(isPresented:content:) closure on the inspector view itself — same pattern as .navigationSplitViewColumnWidth.",
              symbol: "arrow.down.to.line"),
        .init(title: "ideal is what the user sees first.",
              detail: "Without state restoration overriding it, the inspector opens at the `ideal` width. min/max set the drag range.",
              symbol: "ruler"),
        .init(title: "Fixed width doesn't prevent collapse.",
              detail: "On macOS, users can drag the divider all the way to collapse the column even with a fixed-width inspector. Use .interactiveDismissDisabled() to lock the collapse state.",
              symbol: "lock.shield"),
        .init(title: "Initial width respects state restoration.",
              detail: "When the framework restores presentation state, the saved width wins over `ideal`. ideal is only the cold-launch default.",
              symbol: "arrow.counterclockwise")
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

private struct ICWSnippet: View {
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
    InspectorColumnWidthPage()
        .frame(width: 1100, height: 800)
}
