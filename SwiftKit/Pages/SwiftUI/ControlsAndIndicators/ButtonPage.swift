import SwiftUI

// SwiftUI `Button` reference page.
// Covers: Button init variants, roles, and common usage patterns.
// macOS 10.15+

struct ButtonPage: View {
    @State private var tappedLabel = "—"

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
            Text("Button")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control that initiates an action. The most fundamental interactive primitive in SwiftUI.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/button.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        BCard(api: "Button(\"Label\") { action() }") {
            Button("Tap Me") { tappedLabel = "Tapped!" }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            BVariant(title: "String label") {
                BCard(api: "Button(\"Save\") { }") {
                    Button("Save") {}
                }
            }

            BVariant(title: "Label with system image") {
                BCard(api: "Button { } label: { Label(\"Delete\", systemImage: \"trash\") }") {
                    Button { } label: { Label("Delete", systemImage: "trash") }
                }
            }

            BVariant(title: "Image-only") {
                BCard(api: "Button { } label: { Image(systemName: \"plus\") }") {
                    Button { } label: { Image(systemName: "plus") }
                }
            }

            BVariant(title: ".destructive role") {
                BCard(api: "Button(\"Delete\", role: .destructive) { }") {
                    Button("Delete", role: .destructive) {}
                }
            }

            BVariant(title: ".cancel role") {
                BCard(api: "Button(\"Cancel\", role: .cancel) { }") {
                    Button("Cancel", role: .cancel) {}
                }
            }

            BVariant(title: "Multiple buttons — layout") {
                BCard(api: "HStack { Button(\"OK\") {}; Button(\"Cancel\", role: .cancel) {} }") {
                    HStack(spacing: 12) {
                        Button("OK") {}
                        Button("Cancel", role: .cancel) {}
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            BVariant(title: "Disabled") {
                HStack(spacing: 16) {
                    BCard(api: ".disabled(true)") {
                        Button("Action") {}.disabled(true)
                    }
                    BCard(api: "destructive + .disabled(true)") {
                        Button("Delete", role: .destructive) {}.disabled(true)
                    }
                }
            }

            BVariant(title: "Tapped feedback via @State") {
                BCard(api: "Button(\"Tap\") { tappedLabel = \"Tapped!\" }") {
                    VStack(spacing: 8) {
                        Button("Tap Me") { tappedLabel = "Tapped!" }
                        Text("Last: \(tappedLabel)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRow(symbol: "lightbulb", title: "Use roles for semantic meaning, not just color.",
                    detail: ".destructive renders red on macOS and iOS. .cancel on macOS is equivalent to .plain styling. The system renders the appropriate chrome for each context (alert, sheet, toolbar).")
            NoteRow(symbol: "paintbrush", title: "Style via .buttonStyle(_:).",
                    detail: "System styles: .automatic, .bordered, .borderedProminent, .borderless, .plain, .glass, .glassProminent. See View/buttonStyle(_:) page for full coverage.")
            NoteRow(symbol: "keyboard", title: "Keyboard shortcut via .keyboardShortcut(_:).",
                    detail: "Attach .keyboardShortcut(.return) to the primary action button in dialogs. Applies on macOS automatically in certain contexts.")
        }
    }
}

private struct BCard<Content: View>: View {
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

private struct BVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRow: View {
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
    ButtonPage().frame(width: 900, height: 800)
}
