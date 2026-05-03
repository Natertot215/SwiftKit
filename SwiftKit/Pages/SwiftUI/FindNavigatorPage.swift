import SwiftUI

// View/findNavigator(isPresented:) reference page.
// Source: Documentation/SwiftUI/search/findnavigator(ispresented:).md
// macOS 26.0+ — programmatic find/replace for TextEditor.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct FindNavigatorPage: View {
    @State private var defaultText: String = "The quick brown fox jumps over the lazy dog. Apple. Apricot. Apricot."
    @State private var isPresented: Bool = false
    @State private var toggleableText: String = "Type, then toggle the navigator below."
    @State private var toggleablePresented: Bool = false

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
            Text("View/findNavigator(isPresented:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Programmatically presents the find-and-replace interface for text editor views.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/findnavigator(ispresented:).md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "TextEditor(text:).findNavigator(isPresented: $isPresented)") {
            VStack(spacing: 12) {
                TextEditor(text: $defaultText)
                    .findNavigator(isPresented: $isPresented)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Toggle("Show find navigator", isOn: $isPresented)
                    .toggleStyle(.switch)
            }
            .padding(8)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Toolbar-driven toggle (Apple's example pattern)") {
                DemoCard(api: "Toggle(isOn: $isPresented) { Label(\"Find\", systemImage: \"magnifyingglass\") }") {
                    VStack(spacing: 12) {
                        TextEditor(text: $toggleableText)
                            .findNavigator(isPresented: $toggleablePresented)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        HStack {
                            Toggle(isOn: $toggleablePresented) {
                                Label("Find", systemImage: "magnifyingglass")
                            }
                            .toggleStyle(.button)
                        }
                    }
                    .padding(8)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("isPresented = \(isPresented.description) · toggleable = \(toggleablePresented.description)")
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
        .init(title: "Apply to TextEditor or to a hierarchy that contains one.",
              detail: "If multiple editors are in scope, the framework picks one nondeterministically — apply the modifier as close to the target editor as possible.",
              symbol: "doc.text"),
        .init(title: "Two-way binding.",
              detail: "Setting isPresented to true shows the navigator. Built-in keyboard shortcuts (Cmd-F) and the Edit menu also flip the binding when the user dismisses.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: "Order matters with .findDisabled.",
              detail: "If both modifiers exist, the one closer to the editor wins. Apply .findDisabled before .findNavigator to silently no-op a programmatic show.",
              symbol: "list.number")
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
    FindNavigatorPage()
        .frame(width: 1100, height: 900)
}
