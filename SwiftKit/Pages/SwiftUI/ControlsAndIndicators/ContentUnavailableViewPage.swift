import SwiftUI

// SwiftUI `ContentUnavailableView` + `DefaultButtonLabel` reference page.
// A standard empty-state view for when content isn't available.
// macOS 14.0+

struct ContentUnavailableViewPage: View {
    @State private var searchText = ""

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
            Text("ContentUnavailableView · DefaultButtonLabel")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A standard view for empty states: no search results, empty collections, loading failures, and more.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/contentunavailableview.md · macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        CUCard(api: "ContentUnavailableView(\"No Items\", systemImage: \"tray\")") {
            ContentUnavailableView("No Items", systemImage: "tray")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            CUVariant(title: "String + system image") {
                CUCard(api: "ContentUnavailableView(\"No Favorites\", systemImage: \"star\")") {
                    ContentUnavailableView("No Favorites", systemImage: "star")
                }
            }

            CUVariant(title: "String + image + description") {
                CUCard(api: "ContentUnavailableView(\"No Items\", systemImage: \"tray\", description: Text(\"…\"))") {
                    ContentUnavailableView(
                        "No Items",
                        systemImage: "tray.fill",
                        description: Text("Add items to see them here.")
                    )
                }
            }

            CUVariant(title: ".search — built-in empty search results state") {
                CUCard(api: "ContentUnavailableView.search") {
                    ContentUnavailableView.search
                }
            }

            CUVariant(title: ".search(text:) — includes search query") {
                CUCard(api: "ContentUnavailableView.search(text: \"SwiftKit\")") {
                    ContentUnavailableView.search(text: "SwiftKit")
                }
            }

            CUVariant(title: "Custom view-builder label, description, actions") {
                CUCard(api: "ContentUnavailableView { label } description: { … } actions: { Button { } }") {
                    ContentUnavailableView {
                        Label("No Connection", systemImage: "wifi.slash")
                    } description: {
                        Text("Check your network settings and try again.")
                    } actions: {
                        Button("Retry") {}
                            .buttonStyle(.borderedProminent)
                    }
                }
            }

            CUVariant(title: "DefaultButtonLabel — internal system type used by ContentUnavailableView actions") {
                CUCard(api: "// DefaultButtonLabel is an internal SwiftUI type — not publicly constructible.\n// It appears as the rendered label of buttons inside ContentUnavailableView actions.") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("DefaultButtonLabel is used internally by ContentUnavailableView for its action buttons. It is not publicly constructible — you use Button with your own label.")
                            .font(.caption).foregroundStyle(.secondary)
                        Button("Action Button") {}
                            .buttonStyle(.bordered)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            CUVariant(title: "Conditional — show when collection is empty") {
                CUCard(api: "if items.isEmpty { ContentUnavailableView(…) }", height: 180) {
                    let items: [String] = []
                    Group {
                        if items.isEmpty {
                            ContentUnavailableView("No Results", systemImage: "magnifyingglass")
                        } else {
                            Text("Item list here")
                        }
                    }
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowCU(symbol: "magnifyingglass", title: "Use .search for empty search result states.",
                      detail: ".search and .search(text:) provide the system-standard \"No Results\" view with the magnifying glass icon. Pass the current search query via .search(text:) to display it to the user.")
            NoteRowCU(symbol: "hand.raised", title: "ContentUnavailableView uses the full available space.",
                      detail: "It expands to fill the parent frame, centering its content. Wrap in a frame modifier if you need to constrain its area.")
        }
    }
}

private struct CUCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let h = height {
                    content().frame(width: 340, height: h)
                } else {
                    content().frame(minWidth: 340, minHeight: 160, alignment: .center)
                }
            }
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct CUVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowCU: View {
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
    ContentUnavailableViewPage().frame(width: 800, height: 1000)
}
