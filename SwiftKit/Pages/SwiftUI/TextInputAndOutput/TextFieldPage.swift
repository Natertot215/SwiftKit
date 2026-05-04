import SwiftUI

// SwiftUI `TextField` reference page.
// Source: Documentation/SwiftUI/text-input-and-output/textfield.md
// macOS 10.15+. Single-line text input with an optional prompt/label.

struct TextFieldPage: View {
    @State private var name = ""
    @State private var email = ""
    @State private var amount = ""
    @State private var searchText = ""
    @State private var roundedText = ""

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
            Text("TextField")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control that displays an editable text interface.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/text-input-and-output/textfield.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TFCard(api: "TextField(\"Name\", text: $name)") {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .frame(width: 280)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TFVariant(title: "Plain label + binding") {
                TFCard(api: "TextField(\"Name\", text: $name)") {
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 280)
                }
            }
            TFVariant(title: "Prompt as Text") {
                TFCard(api: "TextField(text: $email, prompt: Text(\"user@example.com\"))") {
                    TextField(text: $email, prompt: Text("user@example.com")) {
                        Text("Email")
                    }
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280)
                }
            }
            TFVariant(title: "With value format — numeric") {
                TFCard(api: "TextField(\"Amount\", value: $amount, format: .number)") {
                    let binding = Binding<Double>(
                        get: { Double(amount) ?? 0 },
                        set: { amount = String($0) }
                    )
                    TextField("Amount", value: binding, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 180)
                }
            }
            TFVariant(title: "axis: .vertical — expands like TextEditor") {
                TFCard(api: "TextField(\"Notes\", text: $name, axis: .vertical)") {
                    TextField("Notes", text: $name, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(3, reservesSpace: true)
                        .frame(width: 280)
                }
            }
            TFVariant(title: "With textFieldStyle(.squareBorder)") {
                TFCard(api: ".textFieldStyle(.squareBorder)") {
                    TextField("Search…", text: $searchText)
                        .textFieldStyle(.squareBorder)
                        .frame(width: 280)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TFVariant(title: "Disabled") {
                TFCard(api: "TextField(…).disabled(true)") {
                    TextField("Disabled", text: .constant("Cannot edit"))
                        .textFieldStyle(.roundedBorder)
                        .disabled(true)
                        .frame(width: 280)
                }
            }
            TFVariant(title: "Autocorrection disabled") {
                TFCard(api: ".autocorrectionDisabled()") {
                    TextField("No autocorrect", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .frame(width: 280)
                }
            }
            TFVariant(title: "With onSubmit") {
                TFCard(api: "TextField(…).onSubmit { … }") {
                    HStack {
                        TextField("Press Return", text: $roundedText)
                            .textFieldStyle(.roundedBorder)
                            .onSubmit { roundedText = "" }
                        Text("↩ clears")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 280)
                }
            }
        }
    }

    private struct TFNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TFNote] = [
        .init(title: "TextField binds to String (or Formatted value).", detail: "The simplest form binds to $text: String. For numeric or date values, use the value:format: overload so the framework handles conversion.", symbol: "textformat"),
        .init(title: "axis: .vertical makes it multiline.", detail: "Pass axis: .vertical to allow multi-line input. Pair with lineLimit(_:reservesSpace:) to control initial height.", symbol: "arrow.up.and.down"),
        .init(title: "Three built-in styles on macOS.", detail: ".roundedBorder (default), .squareBorder, and .plain. Apply via .textFieldStyle(_:) or inherit from parent.", symbol: "rectangle"),
        .init(title: "onSubmit fires on Return key.", detail: ".onSubmit { } closure fires when the user presses Return. Use submitLabel(_:) to customize the Return key label.", symbol: "return"),
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

private struct TFCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minHeight: 48, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TFVariant<C: View>: View {
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
    TextFieldPage().frame(width: 900, height: 900)
}
