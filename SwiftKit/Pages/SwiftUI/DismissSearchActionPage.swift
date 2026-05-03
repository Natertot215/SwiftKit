import SwiftUI

// DismissSearchAction reference page.
// Source: Documentation/SwiftUI/search/dismisssearchaction.md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct DismissSearchActionPage: View {
    @State private var text: String = ""
    @State private var isSheet: Bool = false

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
            Text("DismissSearchAction")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The action type returned by EnvironmentValues/dismissSearch — calls itself via callAsFunction().")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/dismisssearchaction.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "let action: DismissSearchAction; action()") {
            NavigationStack {
                DismissActionDemo()
                    .searchable(text: $text)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Capture the action, pass into a sheet's environment") {
                DemoCard(api: "DetailView(item:, dismissSearch: dismissSearch)") {
                    NavigationStack {
                        SheetParent(text: $text, isSheet: $isSheet)
                            .searchable(text: $text)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("text = \"\(text)\" · sheet = \(isSheet.description)")
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "DismissSearchAction is @MainActor + Sendable.",
              detail: "The struct can be passed across closure boundaries safely. Capture once from the searched view and use it from sheets, alerts, or task closures.",
              symbol: "shippingbox"),
        .init(title: "callAsFunction() makes the call site read like a function.",
              detail: "Write dismissSearch() — Swift forwards to the synthesised callAsFunction. There's no .perform or .invoke method.",
              symbol: "function"),
        .init(title: "Same scoping rule as the environment value.",
              detail: "Only valid inside the searched subtree. Capturing it outside still compiles — the call is just a no-op.",
              symbol: "scope")
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

private struct DismissActionDemo: View {
    @Environment(\.dismissSearch) private var dismissSearch

    var body: some View {
        List {
            Text("dismissSearch is a DismissSearchAction value")
            Button("dismissSearch()") { dismissSearch() }
        }
    }
}

private struct SheetParent: View {
    @Binding var text: String
    @Binding var isSheet: Bool
    @Environment(\.dismissSearch) private var dismissSearch

    var body: some View {
        List {
            Button("Open sheet") { isSheet = true }
        }
        .sheet(isPresented: $isSheet) {
            SheetChild(action: dismissSearch, isSheet: $isSheet)
                .frame(width: 320, height: 200)
        }
    }
}

private struct SheetChild: View {
    let action: DismissSearchAction
    @Binding var isSheet: Bool

    var body: some View {
        VStack(spacing: 16) {
            Text("Inside a presented sheet")
                .font(.headline)
            Button("Confirm — dismiss sheet + clear search") {
                isSheet = false
                action()
            }
            Button("Cancel sheet only", role: .cancel) {
                isSheet = false
            }
        }
        .padding()
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
    DismissSearchActionPage()
        .frame(width: 1100, height: 900)
}
