import SwiftUI

// View/searchPresentationToolbarBehavior(_:) + SearchPresentationToolbarBehavior reference page.
// Source: Documentation/SwiftUI/search/searchpresentationtoolbarbehavior(_:).md
//         Documentation/SwiftUI/search/searchpresentationtoolbarbehavior.md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct SearchPresentationToolbarBehaviorPage: View {
    @State private var defaultText: String = ""
    @State private var avoidText: String = ""

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
            Text("View/searchPresentationToolbarBehavior(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures how the toolbar behaves when presenting search.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchpresentationtoolbarbehavior(_:).md · macOS 14.1+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchPresentationToolbarBehavior(.automatic)") {
            NavigationStack {
                List { Text("Default toolbar behavior on search.") }
                    .searchable(text: $defaultText)
                    .searchPresentationToolbarBehavior(.automatic)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button("Action") { }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic — system decides whether to hide other toolbar content") {
                DemoCard(api: ".searchPresentationToolbarBehavior(.automatic)") {
                    NavigationStack {
                        List { Text("Automatic") }
                            .searchable(text: $defaultText)
                            .searchPresentationToolbarBehavior(.automatic)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button("Action") { }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".avoidHidingContent — keep toolbar items visible while searching") {
                DemoCard(api: ".searchPresentationToolbarBehavior(.avoidHidingContent)") {
                    NavigationStack {
                        List { Text("Avoid hiding") }
                            .searchable(text: $avoidText)
                            .searchPresentationToolbarBehavior(.avoidHidingContent)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button("Action") { }
                                }
                            }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("On macOS the toolbar typically keeps all items visible regardless. The behavior is most visible on iOS, where the system will hide adjacent toolbar items as the search field expands unless .avoidHidingContent is set.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Two cases: .automatic and .avoidHidingContent.",
              detail: "SearchPresentationToolbarBehavior is a struct with two static factories. Apply via .searchPresentationToolbarBehavior(_:) above the searchable modifier.",
              symbol: "switch.2"),
        .init(title: "Effect is most visible on iOS.",
              detail: "On iOS the system hides parts of the toolbar to focus the search affordance. Override with .avoidHidingContent. macOS keeps toolbar items visible by default; this modifier is a hint either way.",
              symbol: "iphone")
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
    SearchPresentationToolbarBehaviorPage()
        .frame(width: 1100, height: 900)
}
