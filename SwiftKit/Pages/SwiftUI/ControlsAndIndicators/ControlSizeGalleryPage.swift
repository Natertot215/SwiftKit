import SwiftUI

// SwiftUI `View/controlSize(_:)` + `ControlSize` reference page.
// Covers all ControlSize cases and how they affect Button, Picker, TextField, etc.
// macOS 10.15+

struct ControlSizeGalleryPage: View {
    @State private var selected = 0

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
            Text("View/controlSize(_:) · ControlSize")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adjusts the size of controls within a view. Affects Button, Picker, Toggle, TextField, Stepper, and more.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/controlsize.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        CSCard(api: ".controlSize(.regular)  // default") {
            Button("Regular Size") {}.controlSize(.regular)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            CSVariant(title: "ControlSize enum — all cases on Button") {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach([ControlSize.mini, .small, .regular, .large, .extraLarge], id: \.self) { size in
                        HStack(spacing: 16) {
                            Text(size.caseName)
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                                .frame(width: 80, alignment: .trailing)
                            Button("Button") {}.controlSize(size)
                        }
                    }
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                APICallout(".controlSize(.mini / .small / .regular / .large / .extraLarge)")
            }

            CSVariant(title: "Applied to Picker (.menu style)") {
                HStack(alignment: .top, spacing: 16) {
                    ForEach([ControlSize.small, .regular, .large], id: \.self) { size in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(size.caseName).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            Picker("Option", selection: $selected) {
                                Text("One").tag(0)
                                Text("Two").tag(1)
                            }
                            .pickerStyle(.menu)
                            .controlSize(size)
                        }
                    }
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                APICallout(".pickerStyle(.menu).controlSize(…)")
            }

            CSVariant(title: "Propagates to child controls") {
                CSCard(api: "VStack { Button(…); Picker(…) }.controlSize(.small)") {
                    VStack(alignment: .leading, spacing: 8) {
                        Button("Small Button") {}
                        Picker("Option", selection: $selected) {
                            Text("Alpha").tag(0)
                            Text("Beta").tag(1)
                        }.pickerStyle(.menu)
                        Toggle("Enable", isOn: .constant(true))
                    }
                    .controlSize(.small)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            CSVariant(title: "Disabled — controlSize preserved") {
                HStack(spacing: 16) {
                    CSCard(api: ".controlSize(.large) + .disabled(true)") {
                        Button("Large Disabled") {}.controlSize(.large).disabled(true)
                    }
                    CSCard(api: ".controlSize(.mini) + .disabled(true)") {
                        Button("Mini Disabled") {}.controlSize(.mini).disabled(true)
                    }
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowCS(symbol: "arrow.up.and.down", title: "ControlSize is inherited by all descendant controls.",
                      detail: "Apply .controlSize(_:) to a container (VStack, Form, Group) to uniformly size all controls inside. Individual controls can override by applying their own .controlSize(_:).")
            NoteRowCS(symbol: "info.circle", title: ".extraLarge may not be honored by all controls.",
                      detail: "Not every control adopts .extraLarge — some cap at .large. Button and TextField support all sizes; custom controls may need to read the ControlSize from the environment.")
        }
    }
}

private extension ControlSize {
    var caseName: String {
        switch self {
        case .mini: return ".mini"
        case .small: return ".small"
        case .regular: return ".regular"
        case .large: return ".large"
        case .extraLarge: return ".extraLarge"
        @unknown default: return "unknown"
        }
    }
}

private struct CSCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(minWidth: 240, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct CSVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowCS: View {
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

extension ControlSizeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.controlSize",
        title: "ControlSize",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: [
            "ControlSize",
            "View/controlSize(_:)"
        ],
        blurb: "The size classes — like regular, small, mini, large, and extraLarge — that you can apply to controls within a view via the controlSize(_:) modifier.",
        signature: "enum ControlSize",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/controlsize.md",
        page: { AnyView(ControlSizeGalleryPage()) }
    )
}

#Preview {
    ControlSizeGalleryPage().frame(width: 800, height: 900)
}
