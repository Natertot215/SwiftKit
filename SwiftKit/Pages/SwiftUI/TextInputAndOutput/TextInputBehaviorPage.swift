import SwiftUI

// Text input behavior reference page.
// Covers: autocorrectionDisabled(_:), scrollDismissesKeyboard(_:), textContentType(_:),
//         textInputCompletion(_:), textInputSuggestions(_:), textInputSuggestions(_:content:),
//         textInputSuggestions(_:id:content:), TextInputFormattingControlPlacement
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 10.15+

struct TextInputBehaviorPage: View {
    @State private var name = ""
    @State private var email = ""
    @State private var url = ""
    @State private var suggestion = ""

    private let suggestions = ["apple.com", "google.com", "github.com", "swift.org"]

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
            Text("Text Input Behavior")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Autocorrection, content type hints, and input suggestions.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("autocorrectionDisabled · scrollDismissesKeyboard · textContentType · textInputCompletion · textInputSuggestions · TextInputFormattingControlPlacement · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TIBCard(api: ".autocorrectionDisabled()") {
            TextField("No autocorrect", text: $name)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .frame(width: 280)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TIBVariant(title: "autocorrectionDisabled(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    TIBCard(api: ".autocorrectionDisabled() — true") {
                        TextField("No autocorrect here", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .autocorrectionDisabled()
                            .frame(width: 240)
                    }
                    TIBCard(api: ".autocorrectionDisabled(false) — system default") {
                        TextField("Autocorrect on", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .autocorrectionDisabled(false)
                            .frame(width: 240)
                    }
                }
            }

            TIBVariant(title: "textContentType(_:) — macOS NSTextContentType hints") {
                HStack(alignment: .top, spacing: 16) {
                    TIBCard(api: ".textContentType(.emailAddress)") {
                        TextField("Email", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.emailAddress)
                            .frame(width: 240)
                    }
                    TIBCard(api: ".textContentType(.URL)") {
                        TextField("URL", text: $url)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.URL)
                            .frame(width: 240)
                    }
                    TIBCard(api: ".textContentType(.name)") {
                        TextField("Full name", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.name)
                            .frame(width: 240)
                    }
                }
            }

            TIBVariant(title: "textInputSuggestions(_:) — inline token suggestions") {
                TIBCard(api: "TextField(…).textInputSuggestions { ForEach(suggestions) { … } }") {
                    TextField("Type a domain…", text: $suggestion)
                        .textFieldStyle(.roundedBorder)
                        .textInputSuggestions {
                            ForEach(suggestions.filter {
                                suggestion.isEmpty || $0.contains(suggestion.lowercased())
                            }, id: \.self) { domain in
                                Text(domain)
                                    .textInputCompletion(domain)
                            }
                        }
                        .frame(width: 280)
                }
            }

            TIBVariant(title: "TextInputFormattingControlPlacement") {
                TIBCard(api: "TextInputFormattingControlPlacement — positions the formatting toolbar") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Controls where the text formatting toolbar (Bold, Italic, etc.) appears in a TextEditor on macOS.")
                            .font(.callout)
                        Text("Values: .automatic, .hidden")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TIBVariant(title: "scrollDismissesKeyboard (iOS/iPadOS only on macOS — no-op)") {
                TIBCard(api: ".scrollDismissesKeyboard(.immediately)") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("On macOS, scrollDismissesKeyboard(_:) is available but has no visual effect — there is no software keyboard to dismiss.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(".immediately · .interactively · .never · .automatic")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.tertiary)
                    }
                }
            }
        }
    }

    private struct TIBNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TIBNote] = [
        .init(title: "autocorrectionDisabled is essential for technical fields.", detail: "Enable it on code editors, URL inputs, username fields, and any field where autocorrect would corrupt intended content.", symbol: "xmark.circle"),
        .init(title: "textContentType hints Autofill.", detail: "On macOS, textContentType tells the system what kind of value the field expects. Used by AutoFill (Passwords app, iCloud Keychain) to suggest values.", symbol: "key"),
        .init(title: "textInputSuggestions integrates with the token suggestion bar.", detail: "The closure returns views tagged with .textInputCompletion(_:). When tapped, the completion string replaces the current field content.", symbol: "text.badge.checkmark"),
        .init(title: "scrollDismissesKeyboard is a no-op on macOS.", detail: "The modifier exists on macOS for source compatibility but the hardware keyboard is never dismissed. It's most relevant on iPhone and iPad.", symbol: "keyboard"),
    ]

    @ViewBuilder private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct TIBCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 240, minHeight: 44, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TIBVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    TextInputBehaviorPage().frame(width: 1000, height: 1000)
}
