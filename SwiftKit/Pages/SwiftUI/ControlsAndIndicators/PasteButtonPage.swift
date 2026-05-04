import SwiftUI

// SwiftUI `PasteButton` reference page.
// A button that reads the clipboard for a specified type when tapped.
// macOS 12.0+

struct PasteButtonPage: View {
    @State private var pastedText = "—"
    @State private var pastedURLs: [URL] = []

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
            Text("PasteButton")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A system-provided button that reads content of the specified type from the pasteboard when tapped.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/pastebutton.md · macOS 12.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PBCard(api: "PasteButton(payloadType: String.self) { strings in … }") {
            VStack(alignment: .leading, spacing: 8) {
                PasteButton(payloadType: String.self) { strings in
                    pastedText = strings.first ?? "—"
                }
                Text("Pasted: \(pastedText)")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            PBVariant(title: "Paste String from clipboard") {
                PBCard(api: "PasteButton(payloadType: String.self) { strings in … }") {
                    VStack(alignment: .leading, spacing: 8) {
                        PasteButton(payloadType: String.self) { strings in
                            pastedText = strings.joined(separator: ", ")
                        }
                        Text("Result: \(pastedText)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            PBVariant(title: "Paste URL(s) from clipboard") {
                PBCard(api: "PasteButton(payloadType: URL.self) { urls in … }") {
                    VStack(alignment: .leading, spacing: 8) {
                        PasteButton(payloadType: URL.self) { urls in
                            pastedURLs = urls
                        }
                        if pastedURLs.isEmpty {
                            Text("No URLs pasted yet")
                                .font(.caption).foregroundStyle(.secondary)
                        } else {
                            ForEach(pastedURLs, id: \.absoluteString) { url in
                                Text(url.absoluteString)
                                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            PBVariant(title: "Disabled") {
                PBCard(api: "PasteButton(…).disabled(true)") {
                    PasteButton(payloadType: String.self) { _ in }.disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowPB(symbol: "doc.on.clipboard", title: "PasteButton is enabled only when the clipboard contains the matching type.",
                      detail: "The system automatically grays out the button when the pasteboard contains no data of the declared payloadType. No manual enable/disable logic is needed.")
            NoteRowPB(symbol: "lock.shield", title: "No clipboard access prompt required (macOS 12+).",
                      detail: "PasteButton is the privacy-safe way to read the clipboard — it triggers on user intent, so macOS doesn't require a special entitlement or privacy alert.")
        }
    }
}

private struct PBCard<Content: View>: View {
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

private struct PBVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowPB: View {
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
    PasteButtonPage().frame(width: 800, height: 600)
}
