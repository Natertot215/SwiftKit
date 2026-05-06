import SwiftUI

// Dense LabeledContent reference page. Consolidates:
//   • LabeledContent                     (primary type; macOS 13.0+)      [from swiftui.view-groupings]
//   • LabeledContentStyle                (protocol; macOS 13.0+)          [from swiftui.view-styles]
//   • LabeledContentStyleConfiguration  (configuration type; 13.0+)       [from swiftui.view-styles]
//   • View/labeledContentStyle(_:)       (style modifier; 13.0+)          [from swiftui.view-styles]
//
// Source docs:
//   Documentation/SwiftUI/view-groupings/labeledcontent.md
//   Documentation/SwiftUI/view-styles/labeledcontentstyle.md
//   Documentation/SwiftUI/view-styles/labeledcontentstyleconfiguration.md
//   Documentation/SwiftUI/view-styles/labeledcontentstyle(_:).md
//
// Follows TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.

struct LabeledContentPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                labeledContentStyleReferenceSection
                labeledContentStyleConfigurationReferenceSection
                defaultLabeledContentSection
                variantsSection
                styleModifierSection
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
            Text("LabeledContent")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that pairs a label with related content, following platform conventions for label alignment and styling. The standard primitive for key-value rows in Form and standalone info displays. LabeledContentStyle and View/labeledContentStyle(_:) control the layout.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-groupings/labeledcontent.md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("LabeledContent  \u{00b7}  LabeledContentStyle  \u{00b7}  LabeledContentStyleConfiguration  \u{00b7}  View/labeledContentStyle(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (LabeledContentStyle)

    private var labeledContentStyleReferenceSection: some View {
        PageSection("Reference \u{2014} LabeledContentStyle protocol", subtitle: "protocol LabeledContentStyle \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A type that applies a custom appearance to all labeled content within a view hierarchy. Conformers receive a LabeledContentStyleConfiguration carrying a type-erased label and content view, and return a Body view composing them however the style dictates.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Protocol declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
@MainActor protocol LabeledContentStyle {
    associatedtype Body : View
    typealias Configuration = LabeledContentStyleConfiguration

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
                    referenceRow(".automatic", "AutomaticLabeledContentStyle \u{2014} the only public built-in conformer. Inside Form/columns it produces label-trailing-content (key-value layout); standalone it's a horizontal stack. macOS 13.0+.")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".automatic is the only public built-in style.",
                        detail: "Apple ships one public literal. The protocol is the extension point for custom label/content layouts. .automatic resolves to the macOS Settings.app pattern in Form contexts.",
                        symbol: "rectangle.split.2x1"
                    )
                    noteRow(
                        title: "SwiftKit does NOT author custom LabeledContentStyle conformers.",
                        detail: "Per project hard constraint: SwiftKit documents Apple's API surface. Custom conformers are out of scope.",
                        symbol: "lock"
                    )
                }
            }
        }
    }

    // MARK: Reference (LabeledContentStyleConfiguration)

    private var labeledContentStyleConfigurationReferenceSection: some View {
        PageSection("Reference \u{2014} LabeledContentStyleConfiguration", subtitle: "struct LabeledContentStyleConfiguration \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The data passed to LabeledContentStyle.makeBody(configuration:). Carries the label and content as type-erased views. Custom conformers read these to compose their own label/content layout.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Properties")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow("configuration.label", "LabeledContentStyleConfiguration.Label \u{2014} type-erased label view. Render it inside makeBody.")
                    referenceRow("configuration.content", "LabeledContentStyleConfiguration.Content \u{2014} type-erased content view.")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("API declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
struct LabeledContentStyleConfiguration {
    struct Label   : View { … }   // type-erased label view
    struct Content : View { … }   // type-erased content view

    var label:   Label
    var content: Content
}

// Custom conformer (reference only — SwiftKit doesn't author these):
struct VerticalLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            configuration.label
                .font(.caption)
                .foregroundStyle(.secondary)
            configuration.content
        }
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Configuration is read-only.",
                        detail: "label and content are type-erased sub-views. Compose them freely; don't mutate them.",
                        symbol: "lock"
                    )
                }
            }
        }
    }

    // MARK: Default demo

    private var defaultLabeledContentSection: some View {
        PageSection("LabeledContent container", subtitle: "LabeledContent \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Pairs a label with related content, adapting its layout to the surrounding container. Inside a Form it aligns labels on a trailing grid; standalone it stacks label and content horizontally or vertically per the platform default.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("LabeledContent(_ titleKey: LocalizedStringKey, value: StringProtocol)")
                    APICallout("LabeledContent(_ titleKey:, value: F, format:)")
                    APICallout("LabeledContent(@ViewBuilder content:, @ViewBuilder label:)")
                    APICallout("LabeledContent(_ titleKey:, @ViewBuilder content:)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default \u{2014} string label + string value in Form")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Form {
                        LabeledContent("Version", value: "1.0.0")
                        LabeledContent("Build", value: "2026.1")
                        LabeledContent("Platform", value: "macOS 26")
                        LabeledContent("Language", value: "Swift 6")
                    }
                    .formStyle(.grouped)
                    .frame(height: 180)
                    APICallout(
"""
Form {
    LabeledContent("Version", value: "1.0.0")
    LabeledContent("Build",   value: "2026.1")
    LabeledContent("Platform", value: "macOS 26")
}
.formStyle(.grouped)
"""
                    )
                }
            }
        }
    }

    // MARK: Variants

    private var variantsSection: some View {
        PageSection("LabeledContent variants", subtitle: "Custom content, Label label, standalone, labelsHidden") {
            VStack(alignment: .leading, spacing: 24) {

                VStack(alignment: .leading, spacing: 8) {
                    Text("With custom content view")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Form {
                        LabeledContent("Status") {
                            Text("Online")
                                .font(.callout)
                                .fontWeight(.medium)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(.green.opacity(0.18), in: Capsule())
                                .foregroundStyle(.green)
                        }
                        LabeledContent("Sync") {
                            HStack(spacing: 4) {
                                Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                                Text("Up to date").foregroundStyle(.secondary)
                            }
                            .font(.callout)
                        }
                    }
                    .formStyle(.grouped)
                    .frame(height: 130)
                    APICallout(
"""
LabeledContent("Status") {
    Text("Online")
        .padding(.horizontal, 8).padding(.vertical, 3)
        .background(.green.opacity(0.18), in: Capsule())
        .foregroundStyle(.green)
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With Label as the label parameter")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Form {
                        LabeledContent {
                            Text("Nathan Taichman").foregroundStyle(.primary)
                        } label: {
                            Label("Author", systemImage: "person.fill")
                        }
                        LabeledContent {
                            Text("SwiftKit").foregroundStyle(.primary)
                        } label: {
                            Label("Project", systemImage: "hammer.fill")
                        }
                    }
                    .formStyle(.grouped)
                    .frame(height: 130)
                    APICallout(
"""
LabeledContent {
    Text("Nathan Taichman")
} label: {
    Label("Author", systemImage: "person.fill")
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Standalone (outside Form)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        LabeledContent("Memory", value: "16 GB")
                        LabeledContent("Disk", value: "89.4 GB free")
                        LabeledContent("CPU", value: "Apple M4 Pro")
                    }
                    .font(.callout)
                    .padding()
                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 8))
                    APICallout(
"""
VStack(alignment: .leading, spacing: 6) {
    LabeledContent("Memory", value: "16 GB")
    LabeledContent("Disk", value: "89.4 GB free")
    LabeledContent("CPU", value: "Apple M4 Pro")
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".labelsHidden() \u{2014} hide all LabeledContent labels")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Applying .labelsHidden() to a Form or container hides all LabeledContent label views while keeping the content visible.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
Form {
    LabeledContent("Email") { TextField("", text: $email) }
}
.labelsHidden()   // hides "Email" label; TextField still shows
"""
                    )
                }
            }
        }
    }

    // MARK: labeledContentStyle modifier

    private var styleModifierSection: some View {
        PageSection("View/labeledContentStyle(_:) modifier", subtitle: "View/labeledContentStyle(_:) \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Applies the given LabeledContentStyle to all LabeledContent within the scope of this modifier. Walks down the view tree \u{2014} apply once on a container to affect every LabeledContent in that subtree.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Signature")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("func labeledContentStyle<S: LabeledContentStyle>(_ style: S) -> some View")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".automatic \u{2014} only built-in style")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Form {
                        LabeledContent("Email", value: "ada@apple.com")
                        LabeledContent("Plan", value: "Pro")
                    }
                    .formStyle(.grouped)
                    .labeledContentStyle(.automatic)
                    .frame(height: 110)
                    APICallout(
"""
Form { … }
    .formStyle(.grouped)
    .labeledContentStyle(.automatic)   // default; explicit form
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Context-driven layout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
// Inside Form columns — label-trailing, content-leading alignment
Form {
    LabeledContent("API Key") { SecureField("", text: $key) }
}
.formStyle(.columns)   // .automatic on this Form resolves to columns layout

// Standalone — horizontal inline pairing
LabeledContent("Status") { Text("Active") }
    .labeledContentStyle(.automatic)   // resolves to inline HStack
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "labeledContentStyle inherits down the view tree.",
                        detail: "Apply once on a container; every LabeledContent in that subtree picks it up. Inner .labeledContentStyle wins for its own subtree.",
                        symbol: "arrow.down"
                    )
                    noteRow(
                        title: ".automatic adapts to the container context.",
                        detail: "Inside a Form (especially .columns style), .automatic produces the macOS Settings key-value alignment. Standalone, it renders an inline HStack pairing.",
                        symbol: "rectangle.split.2x1"
                    )
                }
            }
        }
    }

    // MARK: Notes from the HIG

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on LabeledContent, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "LabeledContent is the correct primitive for Form rows.",
                    detail: "Don't hand-roll HStack { Text; Spacer; value }. LabeledContent integrates with Accessibility, participates in the Form column grid, and renders the correct secondary style for the value automatically.",
                    symbol: "list.bullet"
                )
                noteRow(
                    title: "The value: String initializer applies .secondary foreground style.",
                    detail: "LabeledContent(\"Label\", value: \"...\") renders the value with .foregroundStyle(.secondary) by default. Pass a custom content view when you need a different styling.",
                    symbol: "textformat"
                )
                noteRow(
                    title: "LabeledContent adapts its layout to the container.",
                    detail: "Form aligns labels on a trailing/leading grid; standalone stacks differently. Don't fight the container \u{2014} put LabeledContent inside the container type that matches your intended layout.",
                    symbol: "square.grid.2x2"
                )
                noteRow(
                    title: "Use Label (not plain Text) as the label parameter for icon + text pairings.",
                    detail: "LabeledContent { content } label: { Label(\"Name\", systemImage: \"person\") } renders the icon + text label at the correct optical weight for the container.",
                    symbol: "tag"
                )
                noteRow(
                    title: "Accessibility: LabeledContent informs VoiceOver.",
                    detail: "The label string becomes the accessibility label for the content element. Don't use LabeledContent purely for layout if the label has no semantic meaning for assistive technologies.",
                    symbol: "accessibility"
                )
            }
        }
    }

    // MARK: Helpers

    private func referenceRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 220, alignment: .leading)
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
    LabeledContentPage()
        .frame(width: 1100, height: 1300)
}
