import SwiftUI

// SwiftUI customizable-toolbar bundle:
//   View/toolbar(id:content:)             \u{2014} the modifier
//   CustomizableToolbarContent           \u{2014} the protocol
//   ToolbarCustomizationBehavior         \u{2014} per-item behavior
//   ToolbarCustomizationOptions          \u{2014} options for default state
// Sources:
//   Documentation/SwiftUI/toolbars/toolbar(id:content:).md
//   Documentation/SwiftUI/toolbars/customizabletoolbarcontent.md
//   Documentation/SwiftUI/toolbars/toolbarcustomizationbehavior.md
//   Documentation/SwiftUI/toolbars/toolbarcustomizationoptions.md
// macOS 11.0+ for the modifier; .customizationBehavior(_:) and
// .defaultCustomization(_:options:) require macOS 13.0+.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 240

struct ToolbarCustomizationPage: View {
    @State private var bold = false
    @State private var italic = false
    @State private var fontSize: Double = 12

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
            Text("Customizable toolbars")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(".toolbar(id:content:) + CustomizableToolbarContent + ToolbarCustomizationBehavior + ToolbarCustomizationOptions \u{2014} the four pieces that opt a toolbar into the macOS Customize Toolbar\u{2026} sheet.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbar(id:content:).md \u{00b7} macOS 11.0+ (behavior/options: macOS 13.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbar(id: \"main\") { ToolbarItem(id: \u{2026}) \u{00d7} N }") {
            NavigationStack {
                Text("Customizable toolbar with three identified items")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar(id: "default-customizable") {
                        ToolbarItem(id: "size", placement: .secondaryAction) {
                            Slider(value: $fontSize, in: 8...32) { Text("Font Size") }
                                .frame(width: 120)
                        }
                        ToolbarItem(id: "bold", placement: .secondaryAction) {
                            Toggle(isOn: $bold) { Image(systemName: "bold") }
                        }
                        ToolbarItem(id: "italic", placement: .secondaryAction) {
                            Toggle(isOn: $italic) { Image(systemName: "italic") }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "ToolbarItem(id:placement:showsByDefault:) \u{2014} hidden until added") {
                DemoFrame(api: "ToolbarItem(id: \"info\", \u{2026}, showsByDefault: false)") {
                    NavigationStack {
                        Text("Info absent unless user adds it via Customize\u{2026}")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "shows-by-default") {
                                ToolbarItem(id: "add", placement: .secondaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                                ToolbarItem(id: "info", placement: .secondaryAction, showsByDefault: false) {
                                    Button { } label: { Label("Info", systemImage: "info.circle") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".customizationBehavior(_:) \u{2014} ToolbarCustomizationBehavior") {
                DemoFrame(api: ".customizationBehavior(.disabled) | .reorderable | .default") {
                    NavigationStack {
                        Text("Behavior controls reorderability + removability per item")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "behavior-demo") {
                                ToolbarItem(id: "fixed", placement: .secondaryAction) {
                                    Button { } label: { Label("Fixed", systemImage: "lock") }
                                }
                                .customizationBehavior(.disabled)

                                ToolbarItem(id: "reorder", placement: .secondaryAction) {
                                    Button { } label: { Label("Reorder", systemImage: "arrow.up.arrow.down") }
                                }
                                .customizationBehavior(.reorderable)

                                ToolbarItem(id: "default", placement: .secondaryAction) {
                                    Button { } label: { Label("Default", systemImage: "checkmark") }
                                }
                                .customizationBehavior(.default)
                            }
                    }
                }
            }

            VariantBlock(title: ".defaultCustomization(_:options:) \u{2014} ToolbarCustomizationOptions") {
                DemoFrame(api: ".defaultCustomization(.visible, options: .alwaysAvailable)") {
                    NavigationStack {
                        Text("alwaysAvailable: item stays in Customize\u{2026} even if removed from default set")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "default-customization") {
                                ToolbarItem(id: "always", placement: .secondaryAction) {
                                    Button { } label: { Label("Always", systemImage: "pin") }
                                }
                                .defaultCustomization(.visible, options: .alwaysAvailable)
                            }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "ToolbarCustomizationBehavior \u{2014} static cases") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".default \u{2014} item is fully customizable", systemImage: "checkmark")
                    Label(".disabled \u{2014} item cannot be removed or reordered", systemImage: "lock")
                    Label(".reorderable \u{2014} item can be reordered but not removed", systemImage: "arrow.up.arrow.down")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }

            VariantBlock(title: "ToolbarCustomizationOptions \u{2014} OptionSet") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".alwaysAvailable \u{2014} keep the item in the Customize\u{2026} panel even when not in the default set", systemImage: "pin")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }

            VariantBlock(title: "Add ToolbarCommands to the App scene to expose the menu item") {
                APICallout(".commands { ToolbarCommands() } \u{2014} adds View > Customize Toolbar\u{2026}")
                Text("On macOS, the standard way for users to invoke the customization sheet is the View > Customize Toolbar\u{2026} menu item; ToolbarCommands installs it.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct CNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CNote] = [
        .init(title: ".toolbar(id:) is what opts the toolbar into customization.",
              detail: "Plain .toolbar(content:) builds a fixed toolbar. The id form is required for users to be able to add/remove/reorder items via the Customize\u{2026} sheet. The id is the persistence key.",
              symbol: "key"),
        .init(title: "Every item inside .toolbar(id:) needs an id.",
              detail: "Use ToolbarItem(id:placement:content:). The id is the per-item persistence key and is used to map across rebuilds.",
              symbol: "tag"),
        .init(title: "macOS supports the customization UI; iPadOS only customizes .secondaryAction items.",
              detail: "On macOS the customization sheet handles whatever placements you supply. iPadOS 16+ exposes user customization but only for items placed at .secondaryAction.",
              symbol: "macwindow"),
        .init(title: "Apple's docs example wires .commands { ToolbarCommands() } onto the App scene.",
              detail: "Without ToolbarCommands the View > Customize Toolbar\u{2026} menu item is missing and users have no built-in way to invoke the panel.",
              symbol: "menubar.rectangle"),
        .init(title: "Behavior + options apply to one item, not the whole toolbar.",
              detail: ".customizationBehavior(_:) is on a single ToolbarItem; .defaultCustomization(_:options:) likewise. The toolbar as a whole is either customizable (you used the id form) or not.",
              symbol: "rectangle.split.3x1")
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

private struct DemoFrame<Content: View>: View {
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
    ToolbarCustomizationPage()
        .frame(width: 1100, height: 1100)
}
