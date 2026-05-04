import SwiftUI

// SwiftUI `ShareLink` + `SharePreview` reference page.
// Presents the system share sheet for a shareable item.
// macOS 13.0+

struct ShareLinkPage: View {
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
            Text("ShareLink · SharePreview")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A button that triggers the system share sheet. SharePreview provides a title, icon, and image for the share sheet preview.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/sharelink.md · macOS 13.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SLCard(api: "ShareLink(item: URL(string: \"https://apple.com\")!)") {
            ShareLink(item: URL(string: "https://apple.com")!)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            SLVariant(title: "Default label (system share icon + \u{201c}Share\u{201d})") {
                SLCard(api: "ShareLink(item: url)") {
                    ShareLink(item: URL(string: "https://developer.apple.com")!)
                }
            }

            SLVariant(title: "Custom string label") {
                SLCard(api: "ShareLink(\"Share Apple.com\", item: url)") {
                    ShareLink("Share Apple.com", item: URL(string: "https://apple.com")!)
                }
            }

            SLVariant(title: "Custom view-builder label") {
                SLCard(api: "ShareLink(item: url) { Label(\"Export\", systemImage: \"square.and.arrow.up\") }") {
                    ShareLink(item: URL(string: "https://apple.com")!) {
                        Label("Export", systemImage: "square.and.arrow.up")
                    }
                }
            }

            SLVariant(title: "SharePreview — title, image, icon") {
                SLCard(api: "ShareLink(item: url, preview: SharePreview(\"Apple\", image: Image(systemName: \"apple.logo\")))") {
                    ShareLink(
                        item: URL(string: "https://apple.com")!,
                        preview: SharePreview(
                            "Apple Website",
                            image: Image(systemName: "globe")
                        )
                    )
                }
            }

            SLVariant(title: "Sharing a String") {
                SLCard(api: "ShareLink(item: \"Hello, SwiftKit!\")") {
                    ShareLink(item: "Hello, SwiftKit!")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            SLVariant(title: "Disabled") {
                SLCard(api: "ShareLink(item: url).disabled(true)") {
                    ShareLink(item: URL(string: "https://apple.com")!).disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowSL(symbol: "square.and.arrow.up", title: "Item must conform to Transferable.",
                      detail: "URL, String, Image, and AttributedString conform to Transferable out-of-the-box. Custom types need a Transferable conformance with a transfer representation.")
            NoteRowSL(symbol: "photo", title: "SharePreview controls the share sheet thumbnail.",
                      detail: "Provide a SharePreview with image: to display a thumbnail in the share sheet. Without it, the system generates a preview from the item type.")
        }
    }
}

private struct SLCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(minWidth: 280, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct SLVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowSL: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

#Preview {
    ShareLinkPage().frame(width: 800, height: 700)
}
