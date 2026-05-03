import SwiftUI

// FindContext reference page.
// Source: Documentation/SwiftUI/search/findcontext.md
// macOS 26.0+. Custom-text-input views consume @Environment(\.findContext) to drive
// their own find navigator UI consistently with the SwiftUI .findNavigator/.findDisabled modifiers.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct FindContextPage: View {
    @State private var hostText: String = "FindContext is read by custom text input views via @Environment."
    @State private var navigatorPresented: Bool = false

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
            Text("FindContext")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The status of the find navigator for views which support text editing.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/findcontext.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "@Environment(\\.findContext) var findContext") {
            VStack(alignment: .leading, spacing: 12) {
                TextEditor(text: $hostText)
                    .findNavigator(isPresented: $navigatorPresented)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                FindContextReadout()
                Toggle("Show find navigator", isOn: $navigatorPresented)
                    .toggleStyle(.switch)
            }
            .padding(8)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Custom-input view honoring FindContext") {
                DemoCard(api: "if let ctx = findContext, ctx.allowedOperations == .findAndReplace { … }") {
                    VStack(spacing: 12) {
                        Text("Imagine a custom rich text input view that overlays its own find/replace UI based on the FindContext value. The framework forwards .findNavigator and .findDisabled into this environment value so custom inputs can stay consistent with TextEditor.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        FindContextReadout()
                    }
                    .padding(8)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("navigatorPresented = \(navigatorPresented.description)")
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
        .init(title: "Read-only environment value.",
              detail: "@Environment(\\.findContext) → FindContext? — nil when no .findNavigator/.findDisabled modifier governs the subtree. Inspect .isPresented and .supportsReplace to wire your own UI.",
              symbol: "scope"),
        .init(title: "Built for custom text inputs.",
              detail: "TextEditor handles find/replace natively — you only reach for FindContext when implementing a custom rich-text view that should respect the same activation modifiers.",
              symbol: "doc.text"),
        .init(title: "isPresented is itself a Binding.",
              detail: "If your custom view writes back to ctx.isPresented?.wrappedValue = false, the host's $isPresented binding flips. Use this to mirror native dismiss behaviour from inside the custom navigator.",
              symbol: "arrow.triangle.2.circlepath")
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

private struct FindContextReadout: View {
    @Environment(\.findContext) private var findContext

    var body: some View {
        let presentedText: String
        if let ctx = findContext {
            presentedText = "isPresented = \(ctx.isPresented?.wrappedValue.description ?? "nil") · supportsReplace = \(ctx.supportsReplace.description)"
        } else {
            presentedText = "findContext = nil"
        }
        return Text(presentedText)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
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
    FindContextPage()
        .frame(width: 1100, height: 900)
}
