import SwiftUI

// View/replaceDisabled(_:) reference page.
// Source: Documentation/SwiftUI/search/replacedisabled(_:).md
// macOS 26.0+.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct ReplaceDisabledPage: View {
    @State private var enabledText: String = "Find AND replace enabled."
    @State private var replaceOnlyDisabled: String = "Find allowed; replace disabled."
    @State private var toggleable: Bool = true
    @State private var toggleableText: String = "Toggle replace on/off below."

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
            Text("View/replaceDisabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Disables the replace half of the find-and-replace interface — find still works.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/replacedisabled(_:).md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "TextEditor(text:).replaceDisabled()") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Find available, replace disabled.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                TextEditor(text: $replaceOnlyDisabled)
                    .replaceDisabled()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(8)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Compare states side by side") {
                HStack(spacing: 12) {
                    SmallEditorCard(label: "Both enabled", api: ".replaceDisabled(false)") {
                        TextEditor(text: $enabledText)
                            .replaceDisabled(false)
                    }
                    SmallEditorCard(label: "Replace disabled", api: ".replaceDisabled(true)") {
                        TextEditor(text: $replaceOnlyDisabled)
                            .replaceDisabled(true)
                    }
                }
            }

            VariantBlock(title: "Toggleable — bound to @State") {
                DemoCard(api: ".replaceDisabled(toggle)") {
                    VStack(spacing: 8) {
                        TextEditor(text: $toggleableText)
                            .replaceDisabled(toggleable)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        Toggle("replaceDisabled", isOn: $toggleable)
                            .toggleStyle(.switch)
                    }
                    .padding(8)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("toggleable = \(toggleable.description)")
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
        .init(title: "Find still works.",
              detail: "Use .replaceDisabled when the editor's content is read-only or the app's domain doesn't support text replacement. .findDisabled is the right call to disable both.",
              symbol: "magnifyingglass"),
        .init(title: "Innermost wins.",
              detail: "Same nesting rule as .findDisabled — the modifier closest to the TextEditor takes precedence over outer ones.",
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

private struct SmallEditorCard<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 240, height: 200)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
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
    ReplaceDisabledPage()
        .frame(width: 1100, height: 900)
}
