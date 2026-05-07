import SwiftUI

// SwiftUI `Toggle` reference page.
// Covers: basic bool binding, label forms, and style variants.
// macOS 10.15+

struct ToggleGalleryPage: View {
    @State private var isOn1 = true
    @State private var isOn2 = false
    @State private var isOn3 = true
    @State private var multiValues = [false, true, false]

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
            Text("Toggle")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control that toggles between on and off states.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/toggle.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TGCard(api: "Toggle(\"Enable\", isOn: $isOn)") {
            Toggle("Enable Feature", isOn: $isOn1)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            TGVariant(title: "String label") {
                TGCard(api: "Toggle(\"Label\", isOn: $isOn)") {
                    Toggle("Enable Notifications", isOn: $isOn1)
                }
            }

            TGVariant(title: "View-builder label") {
                TGCard(api: "Toggle(isOn: $isOn) { Label(\"Wi-Fi\", systemImage: \"wifi\") }") {
                    Toggle(isOn: $isOn2) {
                        Label("Wi-Fi", systemImage: "wifi")
                    }
                }
            }

            TGVariant(title: ".toggleStyle(.switch) — default on macOS") {
                TGCard(api: ".toggleStyle(.switch)") {
                    Toggle("Switch Style", isOn: $isOn1).toggleStyle(.switch)
                }
            }

            TGVariant(title: ".toggleStyle(.checkbox)") {
                TGCard(api: ".toggleStyle(.checkbox)") {
                    Toggle("Checkbox Style", isOn: $isOn2).toggleStyle(.checkbox)
                }
            }

            TGVariant(title: ".toggleStyle(.button)") {
                TGCard(api: ".toggleStyle(.button)") {
                    Toggle("Button Style", isOn: $isOn3).toggleStyle(.button)
                }
            }

            TGVariant(title: "Multiple toggles in a Form") {
                TGCard(api: "Form { Toggle(…); Toggle(…) }", height: 130) {
                    Form {
                        Toggle("Show Toolbar", isOn: $isOn1)
                        Toggle("Dark Mode", isOn: $isOn2)
                        Toggle("Spellcheck", isOn: $isOn3)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            TGVariant(title: "Disabled — on vs off") {
                HStack(spacing: 16) {
                    TGCard(api: ".constant(true) + .disabled(true)") {
                        Toggle("On (disabled)", isOn: .constant(true)).disabled(true)
                    }
                    TGCard(api: ".constant(false) + .disabled(true)") {
                        Toggle("Off (disabled)", isOn: .constant(false)).disabled(true)
                    }
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowTG(symbol: "checkmark.square", title: ".checkbox is the macOS-idiomatic style in Preferences.",
                      detail: "NSButton(checkboxType:) is the AppKit equivalent. Use .checkbox in forms or settings panels. Use .switch for prominent on/off states in toolbars or detail panes.")
            NoteRowTG(symbol: "button.programmable", title: ".button toggleStyle renders as a pressable button.",
                      detail: "Useful in toolbars and palettes. The button appears tinted (selected) when isOn is true. See also .toggleStyle(ToolbarToggleButtonStyle()) for toolbar-specific look.")
        }
    }
}

private struct TGCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let h = height {
                    content().frame(width: 340, height: h)
                } else {
                    content().frame(minWidth: 280, alignment: .leading)
                }
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TGVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowTG: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

extension ToggleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.toggle",
        title: "Toggle",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["Toggle"],
        blurb: "A control that toggles between on and off states. Bind isOn to a Boolean and supply a label that describes the switching behavior.",
        signature: "struct Toggle<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/toggle.md",
        page: { AnyView(ToggleGalleryPage()) }
    )
}

#Preview {
    ToggleGalleryPage().frame(width: 800, height: 900)
}
