import SwiftUI

// View/findDisabled(_:) reference page.
// Source: Documentation/SwiftUI/search/finddisabled(_:).md
// macOS 26.0+.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct FindDisabledPage: View {
    @State private var enabledText: String = "Find/replace enabled — Cmd-F works on this editor."
    @State private var disabledText: String = "Find disabled — Cmd-F is a no-op here."
    @State private var toggleable: Bool = true
    @State private var toggleableText: String = "Toggle find on or off below."
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
            Text("View/findDisabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Prevents the find-and-replace interface from activating in a text editor.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/finddisabled(_:).md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "TextEditor(text:).findDisabled()") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Disabled (default-true)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                TextEditor(text: $disabledText)
                    .findDisabled()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(8)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side comparison") {
                HStack(spacing: 12) {
                    SmallEditorCard(label: "Enabled", api: ".findDisabled(false)") {
                        TextEditor(text: $enabledText)
                            .findDisabled(false)
                    }
                    SmallEditorCard(label: "Disabled", api: ".findDisabled(true)") {
                        TextEditor(text: $disabledText)
                            .findDisabled(true)
                    }
                }
            }

            VariantBlock(title: "Toggleable — bound to @State") {
                DemoCard(api: ".findDisabled(toggle)") {
                    VStack(spacing: 8) {
                        TextEditor(text: $toggleableText)
                            .findDisabled(toggleable)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        Toggle("findDisabled", isOn: $toggleable)
                            .toggleStyle(.switch)
                    }
                    .padding(8)
                }
            }

            VariantBlock(title: "Disables programmatic .findNavigator too") {
                DemoCard(api: ".findDisabled(true).findNavigator(isPresented: $present)") {
                    VStack(spacing: 8) {
                        TextEditor(text: $disabledText)
                            .findDisabled(true)
                            .findNavigator(isPresented: $navigatorPresented)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        Toggle("Try to present", isOn: $navigatorPresented)
                            .toggleStyle(.switch)
                    }
                    .padding(8)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("toggleable = \(toggleable.description) · navigatorPresented = \(navigatorPresented.description)")
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
        .init(title: "Defaults to true.",
              detail: ".findDisabled() is equivalent to .findDisabled(true). Pass false to explicitly opt back in.",
              symbol: "checkmark.circle"),
        .init(title: "Disabling find also disables replace.",
              detail: "If you only want to disable replace, use .replaceDisabled(_:) instead. .findDisabled is the bigger hammer.",
              symbol: "hammer"),
        .init(title: "Innermost call wins.",
              detail: "If multiple .findDisabled modifiers stack, the one closest to the TextEditor takes precedence. Useful for opting one editor back in inside a generally-disabled subtree.",
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
    FindDisabledPage()
        .frame(width: 1100, height: 900)
}
