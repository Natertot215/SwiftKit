import SwiftUI

// SwiftUI `SecureField` reference page.
// Source: Documentation/SwiftUI/text-input-and-output/securefield.md
// macOS 10.15+. A single-line text input that obscures its content.

struct SecureFieldGalleryPage: View {
    @State private var password = ""
    @State private var confirmPassword = ""

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
            Text("SecureField")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control into which the user securely enters private text.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/text-input-and-output/securefield.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SFCard(api: "SecureField(\"Password\", text: $password)") {
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .frame(width: 280)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SFVariant(title: "String label") {
                SFCard(api: "SecureField(\"Password\", text: $password)") {
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 280)
                }
            }
            SFVariant(title: "With prompt") {
                SFCard(api: "SecureField(text: $password, prompt: Text(\"8+ characters\"))") {
                    SecureField(text: $password, prompt: Text("8+ characters")) {
                        Text("Password")
                    }
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280)
                }
            }
            SFVariant(title: "Pair: password + confirm") {
                SFCard(api: "SecureField + SecureField with match validation") {
                    VStack(spacing: 8) {
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                        SecureField("Confirm password", text: $confirmPassword)
                            .textFieldStyle(.roundedBorder)
                        if !confirmPassword.isEmpty && password != confirmPassword {
                            Label("Passwords don't match", systemImage: "exclamationmark.triangle")
                                .font(.caption)
                                .foregroundStyle(.red)
                        }
                    }
                    .frame(width: 280)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SFVariant(title: "Disabled") {
                SFCard(api: "SecureField(…).disabled(true)") {
                    SecureField("Password", text: .constant("locked"))
                        .textFieldStyle(.roundedBorder)
                        .disabled(true)
                        .frame(width: 280)
                }
            }
            SFVariant(title: "onSubmit") {
                SFCard(api: "SecureField(…).onSubmit { submit() }") {
                    SecureField("Press Return to submit", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit { password = "" }
                        .frame(width: 280)
                }
            }
        }
    }

    private struct SFNote { let title: String; let detail: String; let symbol: String }
    private let notes: [SFNote] = [
        .init(title: "Content is always obscured.", detail: "Unlike TextField, SecureField renders bullets for each character. This cannot be toggled — use a conditional if you want a show/hide toggle.", symbol: "eye.slash"),
        .init(title: "Shares the same initializers as TextField.", detail: "SecureField has analogous overloads: string label, Text label, and prompt variants. It also accepts onSubmit and textFieldStyle.", symbol: "doc.on.doc"),
        .init(title: "No axis: parameter.", detail: "SecureField does not support axis: .vertical — secure entry is always single-line.", symbol: "minus"),
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

private struct SFCard<C: View>: View {
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

private struct SFVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension SecureFieldGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.secureField",
        title: "SecureField",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.securefield"],
        blurb: "A control into which people securely enter private text.",
        signature: "struct SecureField<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/securefield.md",
        page: { AnyView(SecureFieldGalleryPage()) }
    )
}

#Preview {
    SecureFieldGalleryPage().frame(width: 900, height: 700)
}
