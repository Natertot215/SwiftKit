import SwiftUI

// SwiftUI `View/pickerStyle(_:)` + `PickerStyle` reference page.
// Source: Documentation/SwiftUI/view-styles/pickerstyle(_:).md, pickerstyle.md
// macOS 10.15+ (palette: 13+, radioGroup macOS-only, navigationLink iOS-flavored).
// macOS-supported style values: .automatic, .menu, .inline, .segmented, .palette,
// .radioGroup, .wheel (limited), .navigationLink (limited).

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 220

private struct PSFlavor: Identifiable, Hashable {
    let id: Int
    let name: String
    let symbol: String
}

private let flavors: [PSFlavor] = [
    PSFlavor(id: 0, name: "Vanilla",    symbol: "leaf"),
    PSFlavor(id: 1, name: "Chocolate",  symbol: "drop.fill"),
    PSFlavor(id: 2, name: "Strawberry", symbol: "heart.fill"),
    PSFlavor(id: 3, name: "Mint",       symbol: "leaf.fill")
]

struct PickerStylePage: View {
    @State private var selection: Int = 0

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
            Text("View/pickerStyle(_:) + PickerStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for pickers within this view. PickerStyle is the protocol the built-in style values conform to.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/pickerstyle(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PSCard(title: ".automatic", api: ".pickerStyle(.automatic)") {
            samplePicker
                .pickerStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Six built-in PickerStyle values render on macOS; .wheel and .navigationLink are iOS-only.")
                .font(.callout)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                PSCard(title: ".automatic", api: ".pickerStyle(.automatic)") {
                    samplePicker.pickerStyle(.automatic)
                }
                PSCard(title: ".menu", api: ".pickerStyle(.menu)") {
                    samplePicker.pickerStyle(.menu)
                }
                PSCard(title: ".inline", api: ".pickerStyle(.inline)") {
                    samplePicker.pickerStyle(.inline)
                }
                PSCard(title: ".segmented", api: ".pickerStyle(.segmented)") {
                    samplePicker.pickerStyle(.segmented)
                }
                PSCard(title: ".palette", api: ".pickerStyle(.palette)") {
                    samplePicker.pickerStyle(.palette)
                }
                PSCard(title: ".radioGroup", api: ".pickerStyle(.radioGroup)") {
                    samplePicker.pickerStyle(.radioGroup)
                }
                PSCard(title: ".navigationLink — iOS-only", api: ".pickerStyle(.navigationLink) // unavailable on macOS") {
                    Text("Unavailable on macOS")
                        .font(.caption).foregroundStyle(.secondary)
                }
                PSCard(title: ".wheel — iOS-only", api: ".pickerStyle(.wheel) // unavailable on macOS") {
                    Text("Unavailable on macOS")
                        .font(.caption).foregroundStyle(.secondary)
                }
            }
        }
    }

    private var samplePicker: some View {
        Picker("Flavor", selection: $selection) {
            ForEach(flavors) { flavor in
                Label(flavor.name, systemImage: flavor.symbol).tag(flavor.id)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Disabled state propagates to every PickerStyle.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                PSCard(title: ".menu + disabled", api: ".disabled(true)") {
                    samplePicker
                        .pickerStyle(.menu)
                        .disabled(true)
                }
                PSCard(title: ".segmented + disabled", api: ".disabled(true)") {
                    samplePicker
                        .pickerStyle(.segmented)
                        .disabled(true)
                }
                PSCard(title: ".radioGroup + disabled", api: ".disabled(true)") {
                    samplePicker
                        .pickerStyle(.radioGroup)
                        .disabled(true)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("PickerStyle protocol surface")
                    .font(.headline)
                Text("PickerStyle is a marker protocol that pre-existing system style values conform to. SwiftKit does not author custom conformers per project hard constraint.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                PSCodeBlock(text:
                    """
                    @MainActor protocol PickerStyle {
                        // No required members exposed; SwiftUI ships
                        // private types you adopt via the .menu / .inline /
                        // .segmented / .palette / .radioGroup / .wheel /
                        // .navigationLink / .automatic literals.
                    }
                    """)
            }
        }
    }

    private struct PSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PSNote] = [
        .init(title: ".radioGroup is macOS-only.",
              detail: "Renders as a vertical stack of NSRadioButtons. Use it when the choices should ALL be visible simultaneously — common in Preferences.",
              symbol: "circle.inset.filled"),
        .init(title: ".menu is the default for macOS Preferences-style settings.",
              detail: "Pops a NSPopUpButton-equivalent menu. .automatic on macOS usually resolves to .menu in form-like contexts.",
              symbol: "menubar.dock.rectangle"),
        .init(title: ".segmented limits scaling — use only with short labels.",
              detail: "macOS draws segmented controls with proportional widths. Long labels truncate; over ~5 segments looks cramped. Use .menu for wider sets.",
              symbol: "rectangle.split.3x1"),
        .init(title: ".palette renders as a row of icon swatches.",
              detail: "Best paired with Label or symbolic content. Apple uses it for color palettes and shape pickers in formatting toolbars.",
              symbol: "paintpalette"),
        .init(title: ".wheel and .navigationLink are iOS-flavored.",
              detail: "Both render on macOS but feel out of place. Reach for .menu or .radioGroup for native macOS feel.",
              symbol: "iphone")
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

private struct PSCard<Content: View>: View {
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

private struct PSCodeBlock: View {
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
    PickerStylePage()
        .frame(width: 1200, height: 1100)
}
