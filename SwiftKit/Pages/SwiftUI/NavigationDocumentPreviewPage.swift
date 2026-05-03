import SwiftUI

// SwiftUI `View/navigationDocument(_:preview:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationdocument(_:preview:).md
// macOS 13.0+. Generic over Transferable + SharePreview — use when the document
// isn't a file URL or you want to control how the document appears when shared.
// Apple's macOS surface is the same titlebar proxy icon as the URL overload, but
// the share sheet uses your supplied SharePreview rather than the URL preview.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 240

struct NavigationDocumentPreviewPage: View {
    private let sampleURL = URL(string: "file:///Users/me/Documents/Notes.md")!

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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/navigationDocument(_:preview:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the view's document for purposes of navigation, with a custom share preview.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationdocument(_:preview:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".navigationDocument(url, preview: SharePreview(\"Notes\", image: Image(systemName: \"doc.text\")))") {
            NavigationStack {
                List(0..<4, id: \.self) { i in Text("Line \(i + 1)") }
                    .navigationTitle("Notes")
                    .navigationDocument(
                        sampleURL,
                        preview: SharePreview("Notes", image: Image(systemName: "doc.text"))
                    )
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Title-only SharePreview") {
                DemoCard(api: "preview: SharePreview(\"Report\")") {
                    NavigationStack {
                        List(0..<3, id: \.self) { i in Text("Page \(i + 1)") }
                            .navigationTitle("Report")
                            .navigationDocument(
                                sampleURL,
                                preview: SharePreview("Report")
                            )
                    }
                }
            }

            VariantBlock(title: "SharePreview with system-symbol icon") {
                DemoCard(api: "preview: SharePreview(\"Notes\", image: Image(systemName: \"doc.text\"))") {
                    NavigationStack {
                        List(0..<3, id: \.self) { i in Text("Note \(i + 1)") }
                            .navigationTitle("Notes")
                            .navigationDocument(
                                sampleURL,
                                preview: SharePreview("Notes", image: Image(systemName: "doc.text"))
                            )
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("The two overloads compared — URL-only versus URL + SharePreview. Both produce the same titlebar proxy icon; only the share sheet differs.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("URL only")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".navigationDocument(url)") {
                        NavigationStack {
                            List(0..<3, id: \.self) { i in Text("Line \(i)") }
                                .navigationTitle("Notes")
                                .navigationDocument(sampleURL)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("URL + custom SharePreview")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".navigationDocument(url, preview: SharePreview(\"Notes\", image:))") {
                        NavigationStack {
                            List(0..<3, id: \.self) { i in Text("Line \(i)") }
                                .navigationTitle("Notes")
                                .navigationDocument(
                                    sampleURL,
                                    preview: SharePreview("Notes", image: Image(systemName: "doc.text"))
                                )
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct NDocPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NDocPNote] = [
        .init(title: "Generic over Transferable + SharePreview.",
              detail: "Signature: .navigationDocument(_ document: D, preview: SharePreview<I1, I2>) where D: Transferable. Use this overload when the document isn't a plain file URL — e.g. a custom Transferable type — or when you want explicit control over the share preview.",
              symbol: "square.and.arrow.up"),
        .init(title: "Same titlebar treatment as the URL overload.",
              detail: "On macOS, both overloads populate the proxy icon next to the title. The difference shows up only in share-sheet flows: this overload uses your supplied SharePreview rather than the system's URL preview.",
              symbol: "macwindow"),
        .init(title: "SharePreview is required — title is the minimum.",
              detail: "At minimum you must pass `SharePreview(\"Title\")`. Adding `image:` (Image or ImageResource) and / or `icon:` lets you control the artwork shown when the document is shared.",
              symbol: "rectangle.lefthalf.filled.righthalf.striped.horizontal"),
        .init(title: "Lives alongside .navigationTitle / .navigationSubtitle.",
              detail: "All three modifiers compose. The proxy icon, title, and subtitle each own their slot in the titlebar — there's no ordering conflict between them.",
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

// MARK: - Page-local helpers

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
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
    NavigationDocumentPreviewPage()
        .frame(width: 1200, height: 900)
}
