import SwiftUI

// Dense SwiftUI TextField + TextFieldStyle reference page — consolidates 2 absorbed leaves:
//   TextFieldStyle                 (@MainActor protocol)       macOS 10.15+
//   View/textFieldStyle(_:)        (modifier)                  macOS 10.15+
//
// Source docs:
//   Documentation/SwiftUI/text-input-and-output/textfield.md
//   Documentation/SwiftUI/view-styles/textfieldstyle(_:).md
//   Documentation/SwiftUI/view-styles/textfieldstyle.md
//
// Mirrors TypographyPage / GradientPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

struct TextFieldPage: View {
    @State private var name = ""
    @State private var email = ""
    @State private var amount = ""
    @State private var roundedText = ""
    @State private var style1 = "Sample"
    @State private var style2 = "Sample"
    @State private var style3 = "Sample"
    @State private var style4 = "Sample"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                referenceSection
                defaultSection
                stylingGallerySection
                modifiersSection
                statesSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("TextField \u{00b7} TextFieldStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control that displays an editable text interface. TextFieldStyle controls the visual treatment.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/text-input-and-output/textfield.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("TextField  \u{00b7}  TextFieldStyle  \u{00b7}  View/textFieldStyle(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference

    private var referenceSection: some View {
        PageSection("Reference", subtitle: "TextFieldStyle \u{00b7} @MainActor protocol \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("TextFieldStyle is a marker protocol. Apply it via the .textFieldStyle(_:) modifier on any view; all TextField instances in that view\u{2019}s subtree inherit the style. The built-in conformers on macOS are .automatic, .roundedBorder, .squareBorder, and .plain.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Text("The required protocol body methods are SPI \u{2014} they are not exposed in the public SwiftUI module. SwiftKit documents the built-in style values and does not author custom TextFieldStyle conformers per project hard constraint.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                TFCodeBlock(text:
                    """
                    @MainActor protocol TextFieldStyle {
                        // Required members are SPI in SwiftUI.
                        // Use the built-in conformers:
                        //   .automatic   .roundedBorder   .squareBorder   .plain
                    }

                    extension View {
                        func textFieldStyle<S: TextFieldStyle>(_ style: S) -> some View
                    }
                    """)

                VStack(alignment: .leading, spacing: 4) {
                    tfNoteRow(title: "TextFieldStyle is a marker protocol \u{2014} required methods are SPI.",
                              detail: "You cannot author public custom conformers without using @_spi imports. Stick to the built-in style literals.",
                              symbol: "lock")
                    tfNoteRow(title: "Style is inherited; inner .textFieldStyle(_:) wins for its subtree.",
                              detail: "Apply once at a container view to style every TextField inside it.",
                              symbol: "arrow.down")
                }
            }
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default", subtitle: "TextField(\u{201c}Name\u{201d}, text: $name)") {
            VStack(alignment: .leading, spacing: 6) {
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280)
                APICallout("TextField(\"Name\", text: $name)")
            }
        }
    }

    // MARK: Styling Gallery

    private var stylingGallerySection: some View {
        PageSection("Styling Gallery", subtitle: "View/textFieldStyle(_:) \u{00b7} four built-in styles on macOS") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Four built-in TextFieldStyle values supported on macOS: .automatic, .roundedBorder, .squareBorder, .plain.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 16) {
                    TFStyleCard(title: ".automatic", api: ".textFieldStyle(.automatic)") {
                        TextField("Name", text: $style1).textFieldStyle(.automatic).frame(width: 280)
                    }
                    TFStyleCard(title: ".roundedBorder", api: ".textFieldStyle(.roundedBorder)") {
                        TextField("Name", text: $style2).textFieldStyle(.roundedBorder).frame(width: 280)
                    }
                    TFStyleCard(title: ".squareBorder", api: ".textFieldStyle(.squareBorder)") {
                        TextField("Name", text: $style3).textFieldStyle(.squareBorder).frame(width: 280)
                    }
                    TFStyleCard(title: ".plain", api: ".textFieldStyle(.plain)") {
                        TextField("Name", text: $style4).textFieldStyle(.plain).frame(width: 280)
                    }
                }
            }
        }
    }

    // MARK: Modifiers / Overloads

    private var modifiersSection: some View {
        PageSection("TextField Overloads \u{0026} Modifiers", subtitle: "Overloads and modifier combinations") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Plain label + binding")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        TextField("Name", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 280)
                        APICallout("TextField(\"Name\", text: $name)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Prompt as Text")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        TextField(text: $email, prompt: Text("user@example.com")) {
                            Text("Email")
                        }
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 280)
                        APICallout("TextField(text: $email, prompt: Text(\"user@example.com\")) { Text(\"Email\") }")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With value format \u{2014} numeric")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        let binding = Binding<Double>(
                            get: { Double(amount) ?? 0 },
                            set: { amount = String($0) }
                        )
                        TextField("Amount", value: binding, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 180)
                        APICallout("TextField(\"Amount\", value: $amount, format: .number)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("axis: .vertical \u{2014} expands like TextEditor")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        TextField("Notes", text: $name, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .lineLimit(3, reservesSpace: true)
                            .frame(width: 280)
                        APICallout("TextField(\"Notes\", text: $name, axis: .vertical).lineLimit(3, reservesSpace: true)")
                    }
                }
            }
        }
    }

    // MARK: States

    private var statesSection: some View {
        PageSection("States", subtitle: "Disabled, autocorrection, onSubmit, style propagation") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        TextField("Disabled", text: .constant("Cannot edit"))
                            .textFieldStyle(.roundedBorder)
                            .disabled(true)
                            .frame(width: 280)
                        APICallout("TextField(\u{2026}).disabled(true)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Autocorrection disabled")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        TextField("No autocorrect", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .autocorrectionDisabled()
                            .frame(width: 280)
                        APICallout(".autocorrectionDisabled()")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With onSubmit")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            TextField("Press Return", text: $roundedText)
                                .textFieldStyle(.roundedBorder)
                                .onSubmit { roundedText = "" }
                            Text("\u{21a9} clears")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .frame(width: 280)
                        APICallout("TextField(\u{2026}).onSubmit { \u{2026} }")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled with style propagation")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        TFStyleCard(title: ".roundedBorder + disabled", api: ".disabled(true)") {
                            TextField("Name", text: $style1)
                                .textFieldStyle(.roundedBorder)
                                .disabled(true)
                                .frame(width: 280)
                        }
                        TFStyleCard(title: ".squareBorder + disabled", api: ".disabled(true)") {
                            TextField("Name", text: $style2)
                                .textFieldStyle(.squareBorder)
                                .disabled(true)
                                .frame(width: 280)
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Guidance from Apple\u{2019}s docs.") {
            VStack(alignment: .leading, spacing: 16) {
                tfNoteRow(title: "TextField binds to String (or Formatted value).",
                          detail: "The simplest form binds to $text: String. For numeric or date values, use the value:format: overload so the framework handles conversion.",
                          symbol: "textformat")
                tfNoteRow(title: "axis: .vertical makes it multiline.",
                          detail: "Pass axis: .vertical to allow multi-line input. Pair with lineLimit(_:reservesSpace:) to control initial height.",
                          symbol: "arrow.up.and.down")
                tfNoteRow(title: ".automatic is .roundedBorder in most macOS contexts.",
                          detail: "Inside Form rows .automatic flattens to a label/value pair; standalone it usually resolves to .roundedBorder.",
                          symbol: "rectangle.roundedtop")
                tfNoteRow(title: ".squareBorder is the macOS-classic NSTextField bezel.",
                          detail: "Use it when matching legacy AppKit chrome; it\u{2019}s slightly more compact than .roundedBorder.",
                          symbol: "rectangle")
                tfNoteRow(title: ".plain has no chrome \u{2014} no border, no fill.",
                          detail: "Pair with custom backgrounds when designing your own field UI. The text caret and selection still work normally.",
                          symbol: "rectangle.dashed")
                tfNoteRow(title: "onSubmit fires on Return key.",
                          detail: ".onSubmit { } closure fires when the user presses Return. Use submitLabel(_:) to customize the Return key label.",
                          symbol: "return")
                tfNoteRow(title: "TextFieldStyle has no public conformer protocol body.",
                          detail: "The required _body method is SPI. SwiftKit follows project hard constraint: document the built-ins, do not author conformers.",
                          symbol: "lock")
                tfNoteRow(title: "Style is inherited; outer .textFieldStyle(_:) wins for the subtree.",
                          detail: "Standard SwiftUI inheritance pattern. Inner .textFieldStyle overrides outer for its own subtree.",
                          symbol: "arrow.down")
                tfNoteRow(title: "Three built-in styles on macOS.",
                          detail: ".roundedBorder (default), .squareBorder, and .plain. Apply via .textFieldStyle(_:) or inherit from parent.",
                          symbol: "paintbrush")
            }
        }
    }

    // MARK: Helpers

    private func tfNoteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

private struct TFStyleCard<Content: View>: View {
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
                .padding(12)
                .frame(minHeight: 48, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct TFCodeBlock: View {
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
    TextFieldPage()
        .frame(width: 1000, height: 1400)
}
