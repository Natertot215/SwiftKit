import SwiftUI

// SwiftUI `View/formStyle(_:)` + `FormStyle` + `FormStyleConfiguration` page.
// Source: Documentation/SwiftUI/view-styles/formstyle(_:).md (and protocol/configuration)
// macOS 13.0+. Built-in style values: .automatic, .grouped, .columns.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

struct FormStylePage: View {
    @State private var name: String = "Ada"
    @State private var receive: Bool = true
    @State private var notify: Bool = false

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
            Text("View/formStyle(_:) + FormStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for forms within this view. FormStyle is the protocol; FormStyleConfiguration is the data shape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/formstyle(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FSCard(title: ".automatic", api: ".formStyle(.automatic)") {
            sampleForm.formStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Three built-in FormStyle values.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                FSCard(title: ".automatic", api: ".formStyle(.automatic)") {
                    sampleForm.formStyle(.automatic)
                }
                FSCard(title: ".grouped", api: ".formStyle(.grouped)") {
                    sampleForm.formStyle(.grouped)
                }
                FSCard(title: ".columns", api: ".formStyle(.columns)") {
                    sampleForm.formStyle(.columns)
                }
            }
        }
    }

    private var sampleForm: some View {
        Form {
            Section("Account") {
                TextField("Name", text: $name)
                Toggle("Receive newsletter", isOn: $receive)
            }
            Section("Notifications") {
                Toggle("Push notifications", isOn: $notify)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(".columns is the macOS-canonical Preferences form")
                    .font(.headline)
                Text("Two-column layout with labels right-aligned in the leading column and controls trailing — the macOS Settings.app pattern.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("FormStyleConfiguration shape")
                    .font(.headline)
                FSCodeBlock(text:
                    """
                    struct FormStyleConfiguration {
                        struct Content : View { … }   // the form's body

                        var content: Content
                    }
                    """)
                Text("SwiftKit does NOT author custom FormStyle conformers per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct FSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FSNote] = [
        .init(title: ".automatic on macOS resolves to .columns in Settings scenes.",
              detail: "When the Form is the root of a Settings scene, .automatic picks .columns. Elsewhere it leans toward .grouped.",
              symbol: "questionmark.circle"),
        .init(title: ".grouped is the iOS-canonical look on macOS too.",
              detail: "Section headers above grouped row clusters with rounded corners. Useful for non-Preferences forms (onboarding, inspector).",
              symbol: "rectangle.grid.1x2"),
        .init(title: ".columns demands tight Section/labeling discipline.",
              detail: "Every row should be a labeled control. Bare TextFields or Toggles without labels look weird in a column layout.",
              symbol: "tablecells"),
        .init(title: "Toggle defaults to .checkbox in a Form.",
              detail: "Inside a Form, .toggleStyle(.automatic) usually resolves to .checkbox. Override explicitly if you need .switch.",
              symbol: "checkmark.square"),
        .init(title: "macOS 13.0+ for FormStyle; Form itself is macOS 10.15+.",
              detail: "Form has been around since the start. The FormStyle protocol is newer — older OS renders the default.",
              symbol: "calendar")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
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

private struct FSCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct FSCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    FormStylePage()
        .frame(width: 1300, height: 1100)
}
