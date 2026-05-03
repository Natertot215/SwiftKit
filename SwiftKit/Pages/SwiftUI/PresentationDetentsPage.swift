import SwiftUI

// SwiftUI presentationDetents reference page — bundles four symbols:
// • View/presentationDetents(_:)
// • View/presentationDetents(_:selection:)
// • PresentationDetent (struct: .large .medium .height(_) .fraction(_) .custom(_))
// • CustomPresentationDetent (protocol)
// Source: Documentation/SwiftUI/modal-presentations/presentationdetents(_:).md +
//         presentationdetents(_:selection:).md + presentationdetent.md + custompresentationdetent.md
// macOS 13.0+ — but on macOS sheets default to .formSheet style and detents are most visible on iOS.

private let demoFrameWidth: CGFloat = 480

struct PresentationDetentsPage: View {
    @State private var isShowingBasic = false
    @State private var isShowingControlled = false
    @State private var selectedDetent: PresentationDetent = .medium

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
            Text("View/presentationDetents(_:[selection:]) + PresentationDetent + CustomPresentationDetent")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the available detents (resting heights) for the enclosing sheet. iOS-flavored — on macOS, sheets use a fixed window-style size and detents have minimal visual effect.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/presentationdetent.md \u{00b7} macOS 13.0+ (iOS-flavored)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".sheet(isPresented:) { … .presentationDetents([.medium, .large]) }") {
            Button("Open detent sheet") { isShowingBasic = true }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isShowingBasic) {
                    DetentSheetBody(label: "Drag to resize between .medium and .large")
                        .presentationDetents([.medium, .large])
                }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Controlled — bind selection") {
                DemoCard(api: ".presentationDetents([.medium, .large], selection: $selectedDetent)") {
                    HStack(spacing: 12) {
                        Button("Open controlled sheet") { isShowingControlled = true }
                        Picker("Detent", selection: $selectedDetent) {
                            Text("medium").tag(PresentationDetent.medium)
                            Text("large").tag(PresentationDetent.large)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 200)
                    }
                    .sheet(isPresented: $isShowingControlled) {
                        DetentSheetBody(label: "Programmatic detent: \(detentLabel(selectedDetent))")
                            .presentationDetents([.medium, .large], selection: $selectedDetent)
                    }
                }
            }

            VariantBlock(title: "Built-in detents") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".large — full sheet height")
                    APICallout(".medium — half-height (iOS)")
                    APICallout(".height(_ height: CGFloat) — fixed pixel height")
                    APICallout(".fraction(_ fraction: CGFloat) — fraction of available height")
                    APICallout(".custom(_ type: CustomPresentationDetent.Type) — your own conforming type")
                }
            }

            VariantBlock(title: "Custom detent — CustomPresentationDetent") {
                Text("""
                extension PresentationDetent {
                    static let bar = Self.custom(BarDetent.self)
                    static let small = Self.height(100)
                    static let extraLarge = Self.fraction(0.75)
                }

                private struct BarDetent: CustomPresentationDetent {
                    static func height(in context: Context) -> CGFloat? {
                        max(44, context.maxDetentValue * 0.1)
                    }
                }
                """)
                .font(.caption)
                .fontDesign(.monospaced)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Compose with .presentationDragIndicator") {
                Text("""
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                }
                """)
                .font(.caption)
                .fontDesign(.monospaced)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            }
        }
    }

    private struct DetNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DetNote] = [
        .init(title: "macOS uses .formSheet style.",
              detail: "Detents are an iOS pattern — the sheet rests at multiple heights and users drag between them. On macOS sheets are window-attached and resting heights aren't user-adjustable in the same way.",
              symbol: "macwindow"),
        .init(title: "Default is .large only.",
              detail: "Without this modifier, sheets support only the .large detent. Add .medium to enable the half-height resting position.",
              symbol: "rectangle.bottomthird.inset.filled"),
        .init(title: "Selection binding must match the set.",
              detail: "If you bind `selection`, the value MUST be one of the detents in the array. Drift causes runtime warnings.",
              symbol: "exclamationmark.triangle"),
        .init(title: "PresentationDetent conforms to Hashable + Sendable.",
              detail: "Use as Set / Picker tag values without trouble. Equatable defines detent identity for the system.",
              symbol: "checkmark.seal"),
        .init(title: "CustomPresentationDetent.Context provides maxDetentValue.",
              detail: "Use context.maxDetentValue to calculate heights relative to the available space — the recommended pattern for percentage-based custom detents.",
              symbol: "ruler")
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

    private func detentLabel(_ detent: PresentationDetent) -> String {
        if detent == .medium { return ".medium" }
        if detent == .large { return ".large" }
        return "\(detent)"
    }
}

private struct DetentSheetBody: View {
    let label: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text(label)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Button("Dismiss") { dismiss() }
                .keyboardShortcut(.defaultAction)
        }
        .padding(32)
        .frame(minWidth: 320, minHeight: 200)
    }
}

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, alignment: .leading)
                .padding(12)
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
    PresentationDetentsPage()
        .frame(width: 1100, height: 800)
}
