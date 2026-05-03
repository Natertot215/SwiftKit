import SwiftUI

// SwiftUI `View/fullScreenCover(item:onDismiss:content:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/fullscreencover(item:ondismiss:content:).md
// iOS 14+ — NOT available on macOS. Documented as code-snippet only.

struct FullScreenCoverItemPage: View {
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
            Text("View/fullScreenCover(item:onDismiss:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a modal view that covers as much of the screen as possible using the binding you provide as a data source for the cover's content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/fullscreencover(item:ondismiss:content:).md \u{00b7} iOS 14+ \u{00b7} unavailable on macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FCISnippet(
            api: ".fullScreenCover(item: $coverContext) { context in CoverView(context:) }",
            code: """
            struct PartCoverExample: View {
                @State private var part: Part?
                var body: some View {
                    Button("Inspect part") {
                        part = .init(name: "Z-1234A")
                    }
                    .fullScreenCover(item: $part) { part in
                        VStack {
                            Text(part.name).font(.title)
                            Button("Close") { /* set part = nil */ }
                        }
                    }
                }
            }

            struct Part: Identifiable {
                let id = UUID()
                let name: String
            }
            """,
            note: "When `part` becomes non-nil, the cover appears with that value. Setting `part = nil` (or calling dismiss()) closes it."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With onDismiss") {
                FCISnippet(
                    api: ".fullScreenCover(item:onDismiss:content:)",
                    code: """
                    .fullScreenCover(item: $part, onDismiss: {
                        analytics.log("part_cover_closed")
                    }) { part in
                        PartDetailCover(part: part)
                    }
                    """,
                    note: "onDismiss runs after the binding flips back to nil."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Replacing the item swaps the cover content") {
                FCISnippet(
                    api: "Mutating the bound Optional with a different id triggers a swap.",
                    code: """
                    // Tapping a different row mutates `part`. SwiftUI dismisses
                    // the current cover and immediately re-presents with the
                    // new value, like .sheet(item:).
                    """,
                    note: "Same behavior as .sheet(item:) — Identifiable.id is the key."
                )
            }
        }
    }

    private struct FCINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FCINote] = [
        .init(title: "Not available on macOS.",
              detail: "Use .sheet(item:) on macOS to get the same Identifiable-driven presentation pattern.",
              symbol: "macwindow.badge.plus"),
        .init(title: "Item must conform to Identifiable.",
              detail: "Identity drives presentation: a non-nil item presents the cover; a nil item dismisses it; replacing with a different id swaps the content in place.",
              symbol: "barcode"),
        .init(title: "Closure receives the unwrapped item.",
              detail: "Inside the content closure the item is non-optional, so you can use it directly without if-let unwrapping.",
              symbol: "chevron.right.circle")
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

private struct FCISnippet: View {
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
    FullScreenCoverItemPage()
        .frame(width: 1100, height: 800)
}
