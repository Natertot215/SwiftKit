import SwiftUI

// SwiftUI `ColorPicker` reference page.
// Covers: basic binding, supportsOpacity, and label forms.
// macOS 11.0+

struct ColorPickerPage: View {
    @State private var color = Color.accentColor
    @State private var colorNoOpacity = Color.blue
    @State private var labelColor = Color.red

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
            Text("ColorPicker")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control that allows the user to select a color. On macOS opens the system NSColorPanel.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/colorpicker.md · macOS 11.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        CPCard(api: "ColorPicker(\"Accent\", selection: $color)") {
            ColorPicker("Accent", selection: $color)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            CPVariant(title: "String label") {
                CPCard(api: "ColorPicker(\"Background\", selection: $color)") {
                    ColorPicker("Background", selection: $color)
                }
            }

            CPVariant(title: "supportsOpacity: false — hides alpha slider") {
                CPCard(api: "ColorPicker(\"Color\", selection: $color, supportsOpacity: false)") {
                    ColorPicker("Solid Color", selection: $colorNoOpacity, supportsOpacity: false)
                }
            }

            CPVariant(title: "View-builder label") {
                CPCard(api: "ColorPicker(selection: $color) { Label(\"Text Color\", systemImage: \"textformat\") }") {
                    ColorPicker(selection: $labelColor) {
                        Label("Text Color", systemImage: "textformat")
                    }
                }
            }

            CPVariant(title: "Current color preview") {
                CPCard(api: "RoundedRectangle().fill(color)  // show selection") {
                    HStack(spacing: 12) {
                        ColorPicker("Pick", selection: $color)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(color)
                            .frame(width: 40, height: 24)
                            .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            CPVariant(title: "Disabled") {
                CPCard(api: "ColorPicker(…).disabled(true)") {
                    ColorPicker("Disabled", selection: $color).disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowCP(symbol: "eyedropper", title: "Opens NSColorPanel on macOS.",
                      detail: "The swatch button opens the macOS system color picker panel. The panel persists across the app session. Closing it doesn't reset the selected color.")
            NoteRowCP(symbol: "a.magnify", title: "Bind to Color, not CGColor.",
                      detail: "ColorPicker works with SwiftUI's Color type. If you need CGColor or NSColor (e.g. for layer rendering), use Color's .cgColor or NSColor(color) initializer.")
        }
    }
}

private struct CPCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(minWidth: 280, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct CPVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowCP: View {
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

#Preview {
    ColorPickerPage().frame(width: 800, height: 700)
}
