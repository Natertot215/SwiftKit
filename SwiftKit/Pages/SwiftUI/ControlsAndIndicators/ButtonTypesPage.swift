import SwiftUI

// SwiftUI `ButtonBorderShape`, `ButtonRole`, `ButtonRepeatBehavior`, `ButtonSizing` reference page.
// Covers all supporting Button types in one consolidated page.
// macOS 12.0+ (ButtonBorderShape), macOS 12.0+ (ButtonRole), macOS 14.0+ (ButtonRepeatBehavior)

struct ButtonTypesPage: View {
    @State private var repeatCount = 0

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
            Text("ButtonBorderShape · ButtonRole · ButtonRepeatBehavior · ButtonSizing")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Supporting types that control Button appearance, semantic role, repeat behavior, and sizing.")
                .font(.callout).foregroundStyle(.secondary)
            Text("controls-and-indicators/buttonbordershape.md, buttonrole.md, buttonrepeatbehavior.md · macOS 12+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        BTCard(api: "Button(\"OK\", role: .cancel) { }") {
            Button("Cancel", role: .cancel) {}
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 32) {

            BTVariant(title: "ButtonRole values") {
                HStack(spacing: 16) {
                    BTCard(api: "role: .destructive") {
                        Button("Delete", role: .destructive) {}
                    }
                    BTCard(api: "role: .cancel") {
                        Button("Cancel", role: .cancel) {}
                    }
                    BTCard(api: "role: nil (default)") {
                        Button("OK") {}
                    }
                }
            }

            BTVariant(title: "ButtonBorderShape via .buttonBorderShape(_:)") {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 16) {
                        BTCard(api: ".buttonBorderShape(.automatic)") {
                            Button("Automatic") {}.buttonStyle(.bordered).buttonBorderShape(.automatic)
                        }
                        BTCard(api: ".buttonBorderShape(.roundedRectangle)") {
                            Button("Rounded") {}.buttonStyle(.bordered).buttonBorderShape(.roundedRectangle)
                        }
                    }
                    HStack(spacing: 16) {
                        BTCard(api: ".buttonBorderShape(.capsule)") {
                            Button("Capsule") {}.buttonStyle(.bordered).buttonBorderShape(.capsule)
                        }
                        BTCard(api: ".buttonBorderShape(.circle)") {
                            Button { } label: { Image(systemName: "plus") }
                                .buttonStyle(.bordered).buttonBorderShape(.circle)
                        }
                    }
                }
            }

            BTVariant(title: "ButtonRepeatBehavior via .buttonRepeatBehavior(_:)") {
                BTCard(api: ".buttonRepeatBehavior(.enabled) — fires repeatedly while held") {
                    HStack(spacing: 12) {
                        Button("Hold me: \(repeatCount)") { repeatCount += 1 }
                            .buttonRepeatBehavior(.enabled)
                        Button("Reset") { repeatCount = 0 }
                            .foregroundStyle(.secondary)
                    }
                }
            }

            BTVariant(title: "ButtonSizing via .controlSize(_:) — affects button height") {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach([ControlSize.mini, .small, .regular, .large, .extraLarge], id: \.self) { size in
                        HStack(spacing: 12) {
                            Text(size.label)
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                                .frame(width: 80, alignment: .trailing)
                            Button("Action") {}
                                .controlSize(size)
                        }
                    }
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                APICallout(".controlSize(.mini / .small / .regular / .large / .extraLarge)")
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            BTVariant(title: "ButtonRepeatBehavior disabled (default)") {
                BTCard(api: ".buttonRepeatBehavior(.disabled)") {
                    Button("No repeat") {}.buttonRepeatBehavior(.disabled)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRow2(symbol: "circle.fill", title: "ButtonBorderShape.circle requires a square-ish label.",
                     detail: "Best paired with image-only buttons. .circle clips the border to a perfect circle; asymmetric labels look odd.")
            NoteRow2(symbol: "repeat", title: "ButtonRepeatBehavior fires at system key-repeat rate.",
                     detail: "macOS key-repeat delay/rate settings affect .enabled behavior. Designed for steppers, volume controls, etc.")
            NoteRow2(symbol: "info.circle", title: "ButtonRole affects destructive action confirmation.",
                     detail: ".destructive turns the button red and informs the system this action is irreversible — relevant for alert buttons.")
        }
    }
}

private extension ControlSize {
    var label: String {
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

private struct BTCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(minWidth: 200, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct BTVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRow2: View {
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
    ButtonTypesPage().frame(width: 900, height: 900)
}
