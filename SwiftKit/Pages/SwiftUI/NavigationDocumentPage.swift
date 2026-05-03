import SwiftUI

// SwiftUI `View/navigationDocument(_:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationdocument(_:).md
// macOS 13.0+ (the URL overload). Populates the proxy icon next to the title in
// the macOS titlebar — the small file glyph users can drag to copy / share the
// document. On iOS / iPadOS it surfaces in the title menu instead.
// A second overload accepts a Transferable + SharePreview — see its own page.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 240

struct NavigationDocumentPage: View {
    private let sampleURL = URL(string: "file:///Users/me/Documents/Notes.md")!
    private let pdfURL    = URL(string: "file:///Users/me/Documents/Report.pdf")!

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
            Text("View/navigationDocument(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the view's document for purposes of navigation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationdocument(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".navigationDocument(URL(string: \"file:///…/Notes.md\")!)") {
            NavigationStack {
                List(0..<4, id: \.self) { i in Text("Line \(i + 1)") }
                    .navigationTitle("Notes")
                    .navigationDocument(sampleURL)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Markdown document") {
                DemoCard(api: ".navigationDocument(URL(filePath: \"…/Notes.md\"))") {
                    NavigationStack {
                        List(0..<3, id: \.self) { i in Text("Note \(i)") }
                            .navigationTitle("Notes")
                            .navigationDocument(sampleURL)
                    }
                }
            }

            VariantBlock(title: "PDF document") {
                DemoCard(api: ".navigationDocument(URL(filePath: \"…/Report.pdf\"))") {
                    NavigationStack {
                        List(0..<3, id: \.self) { i in Text("Page \(i + 1)") }
                            .navigationTitle("Report")
                            .navigationDocument(pdfURL)
                    }
                }
            }

            VariantBlock(title: "Inside a NavigationSplitView column") {
                DemoCard(api: ".navigationTitle / .navigationDocument applied to detail") {
                    NavigationSplitView {
                        List(0..<3, id: \.self) { i in Text("Doc \(i)") }
                            .navigationTitle("Documents")
                    } detail: {
                        Text("Editor")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Notes")
                            .navigationDocument(sampleURL)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("With and without — same content, with .navigationDocument applied versus omitted. macOS draws the proxy icon only when a document URL is present.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("With document URL")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".navigationDocument(sampleURL)") {
                        NavigationStack {
                            List(0..<3, id: \.self) { i in Text("Line \(i)") }
                                .navigationTitle("Notes")
                                .navigationDocument(sampleURL)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("Without")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: "// .navigationDocument omitted — no proxy icon") {
                        NavigationStack {
                            List(0..<3, id: \.self) { i in Text("Line \(i)") }
                                .navigationTitle("Notes")
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct NDocNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NDocNote] = [
        .init(title: "macOS — populates the titlebar's proxy icon.",
              detail: "When a URL is supplied, macOS draws the document's icon next to the title and exposes the standard drag-out / right-click document menu. Without this modifier, no proxy icon appears.",
              symbol: "macwindow"),
        .init(title: "iOS / iPadOS — populates the title menu's preview header.",
              detail: "On those platforms the URL surfaces inside the navigation title's pull-down menu rather than as a proxy icon. Behavior is omitted on watchOS / tvOS.",
              symbol: "iphone"),
        .init(title: "Pair with .navigationTitle for the full chrome.",
              detail: "Apple's Mail / Pages / Notes-style window header is .navigationTitle + (optional) .navigationSubtitle + .navigationDocument. Each modifier targets its own slot — they compose freely.",
              symbol: "rectangle.lefthalf.filled.righthalf.striped.horizontal"),
        .init(title: "URL overload vs Transferable overload.",
              detail: "Use .navigationDocument(_:) for the simple URL case. The companion .navigationDocument(_:preview:) overload accepts any Transferable plus a SharePreview, useful when the document isn't a file URL or you want a custom share preview.",
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
    NavigationDocumentPage()
        .frame(width: 1200, height: 900)
}
