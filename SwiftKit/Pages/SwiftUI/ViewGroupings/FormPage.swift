import SwiftUI

// Dense Form reference page. Consolidates:
//   • Form                       (primary container; macOS 10.15+)
//   • FormStyle                  (protocol; macOS 13.0+)         [from swiftui.view-styles]
//   • FormStyleConfiguration     (configuration type; 13.0+)     [from swiftui.view-styles]
//   • View/formStyle(_:)         (style modifier; 13.0+)         [from swiftui.view-styles]
//
// Source docs:
//   Documentation/SwiftUI/view-groupings/form.md
//   Documentation/SwiftUI/view-styles/formstyle.md
//   Documentation/SwiftUI/view-styles/formstyleconfiguration.md
//   Documentation/SwiftUI/view-styles/formstyle(_:).md
//
// Follows TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.

struct FormPage: View {
    @State private var name: String = "Ada"
    @State private var newsletter: Bool = true
    @State private var notifications: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                formStyleReferenceSection
                formStyleConfigurationReferenceSection
                defaultFormSection
                styleGallerySection
                formStyleModifierSection
                higNotesSection
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
            Text("Form")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Platform-adaptive layout container for data entry. Form automatically applies the canonical platform style \u{2014} .columns on macOS Settings scenes, .grouped everywhere else. FormStyle and View/formStyle(_:) let you override the default per scope.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-groupings/form.md \u{00b7} macOS 10.15+  \u{00b7}  FormStyle / View/formStyle(_:): macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Form  \u{00b7}  FormStyle  \u{00b7}  FormStyleConfiguration  \u{00b7}  View/formStyle(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (FormStyle)

    private var formStyleReferenceSection: some View {
        PageSection("Reference \u{2014} FormStyle protocol", subtitle: "protocol FormStyle \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A type that applies standard interaction behavior and a custom appearance to all forms within a view hierarchy. Conformers receive a FormStyleConfiguration and return a Body view that renders the form's content. Apply a style via View/formStyle(_:).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Protocol declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
@MainActor protocol FormStyle {
    associatedtype Body : View
    typealias Configuration = FormStyleConfiguration

    @ViewBuilder @MainActor
    func makeBody(configuration: Self.Configuration) -> Self.Body
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Built-in conformers on macOS")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".automatic", "AutomaticFormStyle \u{2014} resolves to .columns in Settings scenes; .grouped elsewhere. macOS 13.0+.")
                    referenceRow(".grouped", "GroupedFormStyle \u{2014} iOS-canonical look; rounded grouped rows with section headers. Works on macOS for non-Settings forms. macOS 13.0+.")
                    referenceRow(".columns", "ColumnsFormStyle \u{2014} macOS Settings.app look; labels right-aligned in leading column, controls trailing. macOS 13.0+.")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "SwiftKit does NOT author custom FormStyle conformers.",
                        detail: "Per project hard constraint: SwiftKit documents Apple's built-in protocol surface. Custom FormStyle conformers are out of scope.",
                        symbol: "lock"
                    )
                    noteRow(
                        title: "FormStyle is macOS 13.0+; Form itself is macOS 10.15+.",
                        detail: "On macOS 12 and earlier, Form renders with its default behavior and the style modifier is silently ignored. Use #available(macOS 13, *) if conditionally applying a style.",
                        symbol: "calendar"
                    )
                }
            }
        }
    }

    // MARK: Reference (FormStyleConfiguration)

    private var formStyleConfigurationReferenceSection: some View {
        PageSection("Reference \u{2014} FormStyleConfiguration", subtitle: "struct FormStyleConfiguration \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The data passed to FormStyle.makeBody(configuration:). Carries the form's content as a type-erased view. Custom FormStyle conformers read configuration.content and compose it into their Body view with whatever chrome they want to add.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Properties")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow("configuration.content", "FormStyleConfiguration.Content \u{2014} a type-erased view containing the Form's body closure. Render it inside makeBody.")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("API declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
struct FormStyleConfiguration {
    struct Content : View { … }   // type-erased form body
    var content: Content
}

// Custom FormStyle conformer (reference only — SwiftKit doesn't author these):
struct MyFormStyle: FormStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding()
            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 10))
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "FormStyleConfiguration.Content is opaque.",
                        detail: "It wraps the original Form body closure. Compose it back in your makeBody without rebuilding it.",
                        symbol: "rectangle.dashed"
                    )
                }
            }
        }
    }

    // MARK: Default Form demo

    private var defaultFormSection: some View {
        PageSection("Form container", subtitle: "Form { … } \u{00b7} platform-adaptive layout for data entry") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Form adapts its layout to the platform and context. On macOS it uses a two-column layout by default in Settings scenes and grouped rows in other contexts. Inside a Form, TextField, Toggle, Picker, and LabeledContent all pick up the correct alignment and styling automatically.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializer")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("Form(@ViewBuilder content: () -> Content)")
                    APICallout("Form(content:)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default Form with Section, TextField, Toggle")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Form {
                        Section("Account") {
                            TextField("Name", text: $name)
                            LabeledContent("Email", value: "ada@apple.com")
                        }
                        Section("Notifications") {
                            Toggle("Receive newsletter", isOn: $newsletter)
                            Toggle("Push notifications", isOn: $notifications)
                        }
                    }
                    .formStyle(.grouped)
                    .frame(height: 240)
                    APICallout(
"""
Form {
    Section("Account") {
        TextField("Name", text: $name)
        LabeledContent("Email", value: "ada@apple.com")
    }
    Section("Notifications") {
        Toggle("Receive newsletter", isOn: $newsletter)
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Form vs VStack \u{2014} alignment behavior")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Form applies layout-grid alignment to its children automatically. A VStack does not align labels \u{2014} use Form whenever you want the standard macOS key-value column look.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
// Form — aligned grid layout (preferred for data entry)
Form {
    LabeledContent("Username", value: "ada")
    LabeledContent("Password", value: "\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}")
}
.formStyle(.columns)

// VStack — no alignment (avoid for key-value pairs)
VStack(alignment: .leading) {
    Text("Username: ada")
    Text("Password: \u{2022}\u{2022}\u{2022}\u{2022}\u{2022}\u{2022}")
}
"""
                    )
                }
            }
        }
    }

    // MARK: Style gallery

    private var styleGallerySection: some View {
        PageSection("FormStyle gallery", subtitle: "Three built-in styles applied to the same form content") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Three built-in FormStyle values on macOS. Apply via .formStyle(_:) on the Form or any ancestor view.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".automatic", api: ".formStyle(.automatic)") {
                    sampleForm.formStyle(.automatic)
                }

                styleSpecimen(title: ".grouped", api: ".formStyle(.grouped)") {
                    sampleForm.formStyle(.grouped)
                }

                styleSpecimen(title: ".columns", api: ".formStyle(.columns)") {
                    sampleForm.formStyle(.columns)
                }
            }
        }
    }

    private var sampleForm: some View {
        Form {
            Section("Account") {
                TextField("Name", text: $name)
                Toggle("Newsletter", isOn: $newsletter)
            }
            Section("Notifications") {
                Toggle("Push", isOn: $notifications)
            }
        }
    }

    // MARK: formStyle(_:) modifier

    private var formStyleModifierSection: some View {
        PageSection("View/formStyle(_:) modifier", subtitle: "View/formStyle(_:) \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Applies the given FormStyle to all Form views in the scope of this modifier. The modifier walks down the view tree \u{2014} apply once on a container to affect every Form in that subtree. An inner .formStyle wins for its own subtree.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Signature")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("func formStyle<S: FormStyle>(_ style: S) -> some View")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Scoping rule \u{2014} inner style wins")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
// Outer: .grouped applies to all forms below unless overridden
VStack {
    Form { … }           // .grouped (from outer)

    Form { … }
        .formStyle(.columns)  // .columns wins for THIS Form only
}
.formStyle(.grouped)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Applying style to a Settings scene")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
Settings {
    Form {
        Section("General") {
            Toggle("Sync automatically", isOn: $sync)
            Picker("Language", selection: $lang) { … }
        }
    }
    .formStyle(.columns)   // macOS Settings.app canonical look
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".formStyle inherits down the view tree.",
                        detail: "Apply once on a container; every Form in that subtree picks it up. Inner .formStyle overrides outer for its own subtree \u{2014} same pattern as .buttonStyle.",
                        symbol: "arrow.down"
                    )
                    noteRow(
                        title: ".automatic in a Settings scene resolves to .columns.",
                        detail: "SwiftUI detects the Settings scene context and automatically applies the .columns style when .automatic is used. Outside Settings it leans toward .grouped.",
                        symbol: "gearshape"
                    )
                }
            }
        }
    }

    // MARK: Notes from the HIG

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on Form, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Use .columns for Settings-style Preferences forms.",
                    detail: "The macOS Settings.app pattern is a two-column form: label right-aligned in the leading column, control trailing. .formStyle(.columns) reproduces this automatically.",
                    symbol: "tablecells"
                )
                noteRow(
                    title: "Use .grouped for non-Settings data-entry forms.",
                    detail: ".grouped renders rounded grouped rows with section headers \u{2014} correct for onboarding, inspector panes, and preference sheets that aren't macOS Settings.",
                    symbol: "rectangle.grid.1x2"
                )
                noteRow(
                    title: "Use Section inside Form to separate logical groups.",
                    detail: "Section headers appear above the grouped row cluster in .grouped, and as horizontal rules with labels in .columns. Always label sections with a short noun phrase.",
                    symbol: "text.insert"
                )
                noteRow(
                    title: "Toggle defaults to .checkbox style inside a Form on macOS.",
                    detail: "Inside a Form, .toggleStyle(.automatic) usually resolves to .checkbox. Override explicitly with .toggleStyle(.switch) if you need the iOS-style switch.",
                    symbol: "checkmark.square"
                )
                noteRow(
                    title: "LabeledContent is the correct way to make Form rows.",
                    detail: "Don't HStack { Text; Spacer; Text }. Use LabeledContent \u{2014} it integrates with Accessibility, participates in the column alignment grid, and renders the correct secondary style for its value.",
                    symbol: "list.bullet"
                )
                noteRow(
                    title: "Form field ordering follows HIG conventions.",
                    detail: "Place fields in the order a user would fill them in. Destructive actions go last in their section, never first. Required fields precede optional ones.",
                    symbol: "arrow.up.arrow.down"
                )
            }
        }
    }

    // MARK: Helpers

    @ViewBuilder
    private func styleSpecimen<Content: View>(title: String, api: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(height: 200, alignment: .topLeading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    private func referenceRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 160, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
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

#Preview {
    FormPage()
        .frame(width: 1100, height: 1300)
}
