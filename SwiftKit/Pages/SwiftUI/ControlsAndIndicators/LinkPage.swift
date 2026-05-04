import SwiftUI

// SwiftUI `Link` reference page.
// Opens a URL in the default browser (or configured handler) when tapped.
// macOS 11.0+

struct LinkPage: View {
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
            Text("Link")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control for navigating to a URL. Opens in the system browser or a registered handler.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/link.md · macOS 11.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        LKCard(api: "Link(\"Apple\", destination: URL(string: \"https://apple.com\")!)") {
            Link("Apple", destination: URL(string: "https://apple.com")!)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            LKVariant(title: "String label") {
                LKCard(api: "Link(\"Swift Documentation\", destination: url)") {
                    Link("Swift Documentation", destination: URL(string: "https://developer.apple.com/documentation/swift")!)
                }
            }

            LKVariant(title: "Custom view-builder label") {
                LKCard(api: "Link(destination: url) { Label(\"Open Docs\", systemImage: \"doc.text\") }") {
                    Link(destination: URL(string: "https://developer.apple.com/documentation/swiftui")!) {
                        Label("Open SwiftUI Docs", systemImage: "doc.text")
                    }
                }
            }

            LKVariant(title: "Inline in Text (tint applied via foregroundStyle)") {
                LKCard(api: "Text(\"Visit \") + Text(\"Apple\").foregroundStyle(.tint)  // use Link for actual navigation") {
                    VStack(alignment: .leading, spacing: 6) {
                        Link("Visit apple.com", destination: URL(string: "https://apple.com")!)
                            .foregroundStyle(.tint)
                        Text("Link inherits .tint color from the environment")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            LKVariant(title: "Disabled") {
                LKCard(api: "Link(\"Disabled\", destination: url).disabled(true)") {
                    Link("Disabled Link", destination: URL(string: "https://apple.com")!)
                        .disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowLK(symbol: "safari", title: "Opens the URL using openURL environment action.",
                      detail: "The default handler is the system browser. Override via .environment(\\.openURL, OpenURLAction { … }) to handle in-app.")
            NoteRowLK(symbol: "textformat", title: "Link renders as a tinted button by default.",
                      detail: "Apply .buttonStyle(.plain) or .foregroundStyle(.primary) to remove tint if a more subtle appearance is needed.")
        }
    }
}

private struct LKCard<Content: View>: View {
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

private struct LKVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowLK: View {
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
    LinkPage().frame(width: 800, height: 600)
}
