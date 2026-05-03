import SwiftUI

// SearchFieldPlacement reference page.
// Source: Documentation/SwiftUI/search/searchfieldplacement.md
// macOS-supported cases: .automatic, .toolbar, .sidebar, .toolbarPrincipal.
// .navigationBarDrawer / .navigationBarDrawer(displayMode:) are iOS-only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct SearchFieldPlacementPage: View {
    @State private var automaticText: String = ""
    @State private var toolbarText: String = ""
    @State private var sidebarText: String = ""
    @State private var principalText: String = ""

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
            Text("SearchFieldPlacement")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The placement of a search field in a view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchfieldplacement.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text: $text, placement: .automatic)") {
            NavigationStack {
                List {
                    Text("macOS lifts the field into the trailing toolbar by default.")
                }
                .searchable(text: $automaticText, placement: .automatic)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic") {
                DemoCard(api: ".searchable(text: $text, placement: .automatic)") {
                    NavigationStack {
                        List { Text("Automatic placement") }
                            .searchable(text: $automaticText, placement: .automatic)
                    }
                }
            }
            VariantBlock(title: ".toolbar") {
                DemoCard(api: ".searchable(text: $text, placement: .toolbar)") {
                    NavigationStack {
                        List { Text("Toolbar placement") }
                            .searchable(text: $toolbarText, placement: .toolbar)
                    }
                }
            }
            VariantBlock(title: ".sidebar — only takes effect inside NavigationSplitView") {
                DemoCard(api: ".searchable(text: $text, placement: .sidebar)") {
                    NavigationSplitView {
                        List { Text("Sidebar column") }
                    } detail: {
                        Text("Detail").foregroundStyle(.secondary)
                    }
                    .searchable(text: $sidebarText, placement: .sidebar)
                }
            }
            VariantBlock(title: ".toolbarPrincipal — pin to the toolbar's principal slot") {
                DemoCard(api: ".searchable(text: $text, placement: .toolbarPrincipal)") {
                    NavigationStack {
                        List { Text("Principal-slot placement") }
                            .searchable(text: $principalText, placement: .toolbarPrincipal)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("SwiftUI may fall back if the requested placement isn't available in the surrounding hierarchy. The framework's automatic rules then apply.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "macOS-supported placements: .automatic, .toolbar, .sidebar, .toolbarPrincipal.",
              detail: ".navigationBarDrawer and .navigationBarDrawer(displayMode:) are iOS-only and silently fall back to .automatic on macOS.",
              symbol: "macwindow"),
        .init(title: "SearchFieldPlacement is a struct, not an enum.",
              detail: "It exposes static factory members (.automatic, .toolbar, .sidebar, .toolbarPrincipal). New placements may appear without breaking source.",
              symbol: "shippingbox"),
        .init(title: "Sidebar placement requires NavigationSplitView.",
              detail: "If you ask for .sidebar inside a NavigationStack, SwiftUI ignores the request and falls back to its automatic rule (typically .toolbar on macOS).",
              symbol: "sidebar.left")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(pageNotes, id: \.title) { note in
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
    SearchFieldPlacementPage()
        .frame(width: 1100, height: 900)
}
