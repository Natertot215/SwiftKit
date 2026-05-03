import SwiftUI

// SearchScopeActivation reference page.
// Source: Documentation/SwiftUI/search/searchscopeactivation.md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private enum DemoScope: String, Hashable, CaseIterable, Identifiable {
    case all, fruit, vegetable
    var id: Self { self }
    var label: String { rawValue.capitalized }
}

struct SearchScopeActivationPage: View {
    @State private var autoText = ""
    @State private var autoScope: DemoScope = .all
    @State private var presText = ""
    @State private var presScope: DemoScope = .all
    @State private var typeText = ""
    @State private var typeScope: DemoScope = .all

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
            Text("SearchScopeActivation")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Controls when the scope Picker appears in a searchable field.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchscopeactivation.md · macOS 13.3+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        scopedDemo(text: $autoText, scope: $autoScope, activation: .automatic, label: ".automatic")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".onSearchPresentation — picker visible whenever the field is active") {
                scopedDemo(text: $presText, scope: $presScope, activation: .onSearchPresentation, label: ".onSearchPresentation")
            }
            VariantBlock(title: ".onTextEntry — picker appears after the user types") {
                scopedDemo(text: $typeText, scope: $typeScope, activation: .onTextEntry, label: ".onTextEntry")
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("automatic scope = \(autoScope.label) · text = \"\(autoText)\"")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
            Text("onSearchPresentation scope = \(presScope.label) · text = \"\(presText)\"")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
            Text("onTextEntry scope = \(typeScope.label) · text = \"\(typeText)\"")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
        }
    }

    private func scopedDemo(
        text: Binding<String>,
        scope: Binding<DemoScope>,
        activation: SearchScopeActivation,
        label: String
    ) -> some View {
        DemoCard(api: ".searchScopes($scope, activation: \(label)) { … }") {
            NavigationStack {
                List { Text("Search to see scope picker · activation = \(label)") }
                    .searchable(text: text)
                    .searchScopes(scope, activation: activation) {
                        Text("All").tag(DemoScope.all)
                        Text("Fruit").tag(DemoScope.fruit)
                        Text("Vegetable").tag(DemoScope.vegetable)
                    }
            }
        }
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Three cases: .automatic, .onSearchPresentation, .onTextEntry.",
              detail: "Pass to .searchScopes(_:activation:_:). Defaults vary by platform — macOS uses .onSearchPresentation; iOS uses .onTextEntry under .automatic.",
              symbol: "switch.2"),
        .init(title: "macOS treats .automatic ≈ .onSearchPresentation.",
              detail: "On macOS the picker appears whenever the search field is active. Use .onTextEntry to keep the picker hidden until the user actually types.",
              symbol: "macwindow")
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
    SearchScopeActivationPage()
        .frame(width: 1100, height: 900)
}
