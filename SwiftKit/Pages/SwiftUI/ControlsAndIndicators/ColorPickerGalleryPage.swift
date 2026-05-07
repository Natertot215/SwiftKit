import SwiftUI

// Dense ColorPicker reference page. Structural rewrite to match the
// TypographyPage / ButtonPage rhythm — ColorPicker has NO style protocol
// or absorbed sibling APIs in SwiftUI, so this page documents only the
// ColorPicker initializers, the supportsOpacity flag, and the disabled state.
//
// Source docs:
//   Documentation/SwiftUI/controls-and-indicators/colorpicker.md
//
// Mirrors TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly —
// no custom wrapper views.

struct ColorPickerGalleryPage: View {
    @State private var color: Color = .accentColor
    @State private var bgColor: Color = .blue
    @State private var solidColor: Color = .green
    @State private var labelColor: Color = .red
    @State private var swatchColor: Color = .purple

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                defaultColorPickerSection
                colorPickerVariantsSection
                opacityHandlingSection
                colorPickerStatesSection
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
            Text("ColorPicker")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control that allows the user to select a color. On macOS the swatch button opens the system NSColorPanel. Bind to a SwiftUI Color value; the system handles the chrome.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/colorpicker.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("ColorPicker  \u{00b7}  init(_:selection:supportsOpacity:)  \u{00b7}  init(selection:supportsOpacity:label:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default ColorPicker

    private var defaultColorPickerSection: some View {
        PageSection("Default ColorPicker", subtitle: "ColorPicker(\"Label\", selection: $color) \u{00b7} default supportsOpacity = true") {
            VStack(alignment: .leading, spacing: 12) {
                ColorPicker("Accent", selection: $color)
                Text("color = \(color.description)")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                APICallout("ColorPicker(\"Accent\", selection: $color)")
            }
        }
    }

    // MARK: ColorPicker variants

    private var colorPickerVariantsSection: some View {
        PageSection("ColorPicker variants", subtitle: "String label, view-builder label, and current-color preview") {
            VStack(alignment: .leading, spacing: 24) {
                styleSpecimen(title: "String label", api: "ColorPicker(\"Background\", selection: $bgColor)") {
                    ColorPicker("Background", selection: $bgColor)
                }

                styleSpecimen(title: "View-builder label \u{2014} Label(\u{2026}, systemImage:)", api: "ColorPicker(selection: $labelColor) { Label(\"Text Color\", systemImage: \"textformat\") }") {
                    ColorPicker(selection: $labelColor) {
                        Label("Text Color", systemImage: "textformat")
                    }
                }

                styleSpecimen(title: "Current-color preview alongside the swatch", api: "RoundedRectangle().fill(color) // show selection") {
                    HStack(spacing: 12) {
                        ColorPicker("Pick", selection: $swatchColor)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(swatchColor)
                            .frame(width: 40, height: 24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .strokeBorder(.separator)
                            )
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("init(_ titleKey: LocalizedStringKey, selection: Binding<Color>, supportsOpacity: Bool = true)")
                    APICallout("init<S: StringProtocol>(_ title: S, selection: Binding<Color>, supportsOpacity: Bool = true)")
                    APICallout("init(selection: Binding<Color>, supportsOpacity: Bool = true, @ViewBuilder label: () -> some View)")
                }
            }
        }
    }

    // MARK: supportsOpacity

    private var opacityHandlingSection: some View {
        PageSection("Opacity handling \u{2014} supportsOpacity:", subtitle: "supportsOpacity: Bool \u{00b7} default true \u{00b7} hides alpha slider when false") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Pass supportsOpacity: false to hide the alpha slider in the system NSColorPanel and force the bound Color to fully-opaque values.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: "supportsOpacity: true (default)", api: "ColorPicker(\"With opacity\", selection: $color)") {
                    ColorPicker("With opacity", selection: $color)
                }
                styleSpecimen(title: "supportsOpacity: false", api: "ColorPicker(\"Solid\", selection: $solid, supportsOpacity: false)") {
                    ColorPicker("Solid", selection: $solidColor, supportsOpacity: false)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "supportsOpacity: false hides the alpha slider entirely.",
                        detail: "The bound Color is constrained to fully-opaque values. Useful for app-tint settings or chart palettes where translucency would be visual noise.",
                        symbol: "drop"
                    )
                    noteRow(
                        title: "Default is supportsOpacity: true.",
                        detail: "Omit the parameter and the user can dial alpha in the NSColorPanel. The bound Color carries opacity through to your view tree.",
                        symbol: "checkmark.circle"
                    )
                }
            }
        }
    }

    // MARK: ColorPicker states

    private var colorPickerStatesSection: some View {
        PageSection("ColorPicker states", subtitle: ".disabled(true) \u{00b7} dims the swatch and prevents NSColorPanel presentation") {
            VStack(alignment: .leading, spacing: 12) {
                styleSpecimen(title: ".disabled(true)", api: "ColorPicker(\"Disabled\", selection: $color).disabled(true)") {
                    ColorPicker("Disabled", selection: $color)
                        .disabled(true)
                }
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on ColorPicker, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Opens the system NSColorPanel on macOS.",
                    detail: "The swatch button presents the macOS system color picker panel. The panel persists across the app session; closing it doesn't reset the selected color. Use the system control \u{2014} don't reimplement.",
                    symbol: "eyedropper"
                )
                noteRow(
                    title: "Bind to Color, not CGColor or NSColor.",
                    detail: "ColorPicker works with SwiftUI's Color type. If you need CGColor or NSColor (e.g. for layer rendering or AppKit interop), convert via Color's .cgColor / NSColor(_:) initializer at the use site.",
                    symbol: "paintpalette"
                )
                noteRow(
                    title: "supportsOpacity controls the alpha slider, nothing else.",
                    detail: "Setting it to false hides the alpha control in the panel and constrains the bound Color to fully-opaque values. It does NOT change the rendered swatch chrome.",
                    symbol: "drop"
                )
                noteRow(
                    title: "View-builder labels follow Label / .accessibilityLabel rules.",
                    detail: "Pair Label(_, systemImage:) so the SF Symbol's stroke weight matches the surrounding text weight. Image-only labels need .accessibilityLabel for VoiceOver.",
                    symbol: "accessibility"
                )
                noteRow(
                    title: "ColorPicker has NO style protocol.",
                    detail: "Unlike Picker / DatePicker, ColorPicker does not expose a ColorPickerStyle protocol or .colorPickerStyle(_:) modifier. The system NSColorPanel is the only renderer.",
                    symbol: "lock"
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
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
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

extension ColorPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.colorPicker",
        title: "ColorPicker",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["ColorPicker"],
        blurb: "A control used to select a color from the system color picker UI. Supports opacity by default; toggle supportsOpacity to disable.",
        signature: "struct ColorPicker<Label> where Label : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/colorpicker.md",
        page: { AnyView(ColorPickerGalleryPage()) }
    )
}

#Preview {
    ColorPickerGalleryPage()
        .frame(width: 900, height: 800)
}
