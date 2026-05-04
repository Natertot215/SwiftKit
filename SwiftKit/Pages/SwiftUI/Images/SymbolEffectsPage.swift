import SwiftUI

// Symbol effects reference page.
// Covers: symbolEffect(_:options:isActive:), symbolEffect(_:options:value:),
//         symbolEffectsRemoved(_:), SymbolEffectTransition
// Source: Documentation/SwiftUI/images/
// macOS 14.0+

struct SymbolEffectsPage: View {
    @State private var isPulsing = false
    @State private var isBouncing = false
    @State private var rotateCounter = 0
    @State private var isVariableOn = false
    @State private var replaceCounter = 0

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
            Text("Symbol Effects")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Animate SF Symbols with discrete, continuous, and transition effects.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/symbolEffect(_:options:isActive:) · View/symbolEffect(_:options:value:) · symbolEffectsRemoved · SymbolEffectTransition · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SECard(api: ".symbolEffect(.pulse, isActive: isPulsing)") {
            VStack(spacing: 8) {
                Image(systemName: "heart.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                    .symbolEffect(.pulse, isActive: isPulsing)
                Button(isPulsing ? "Stop" : "Pulse") { isPulsing.toggle() }
                    .buttonStyle(.borderedProminent)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SEVariant(title: "Continuous effects — .pulse, .variableColor, .breathe") {
                HStack(alignment: .top, spacing: 16) {
                    SECard(api: ".symbolEffect(.pulse, isActive: …)") {
                        VStack(spacing: 6) {
                            Image(systemName: "wifi")
                                .font(.title)
                                .symbolEffect(.pulse, isActive: isPulsing)
                            Button(isPulsing ? "Stop" : "Run") { isPulsing.toggle() }
                                .font(.caption)
                        }
                    }
                    SECard(api: ".symbolEffect(.variableColor, isActive: …)") {
                        VStack(spacing: 6) {
                            Image(systemName: "speaker.wave.3.fill")
                                .font(.title)
                                .symbolEffect(.variableColor, isActive: isVariableOn)
                            Button(isVariableOn ? "Stop" : "Run") { isVariableOn.toggle() }
                                .font(.caption)
                        }
                    }
                    SECard(api: ".symbolEffect(.breathe, isActive: …)") {
                        VStack(spacing: 6) {
                            Image(systemName: "lungs.fill")
                                .font(.title)
                                .symbolEffect(.breathe, isActive: isPulsing)
                            Button(isPulsing ? "Stop" : "Run") { isPulsing.toggle() }
                                .font(.caption)
                        }
                    }
                }
            }

            SEVariant(title: "Discrete effects — triggered by value change") {
                HStack(alignment: .top, spacing: 16) {
                    SECard(api: ".symbolEffect(.bounce, value: counter)") {
                        VStack(spacing: 6) {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.title)
                                .symbolEffect(.bounce, value: rotateCounter)
                            Button("Bounce") { rotateCounter += 1 }
                                .font(.caption)
                        }
                    }
                    SECard(api: ".symbolEffect(.wiggle, value: counter)") {
                        VStack(spacing: 6) {
                            Image(systemName: "bell.fill")
                                .font(.title)
                                .symbolEffect(.wiggle, value: rotateCounter)
                            Button("Wiggle") { rotateCounter += 1 }
                                .font(.caption)
                        }
                    }
                    SECard(api: ".symbolEffect(.rotate, value: counter)") {
                        VStack(spacing: 6) {
                            Image(systemName: "gear")
                                .font(.title)
                                .symbolEffect(.rotate, value: rotateCounter)
                            Button("Rotate") { rotateCounter += 1 }
                                .font(.caption)
                        }
                    }
                }
            }

            SEVariant(title: "Replace effect — content transition") {
                SECard(api: ".contentTransition(.symbolEffect(.replace))") {
                    VStack(spacing: 8) {
                        Image(systemName: replaceCounter.isMultiple(of: 2) ? "play.fill" : "pause.fill")
                            .font(.largeTitle)
                            .contentTransition(.symbolEffect(.replace))
                        Button("Toggle") { replaceCounter += 1 }
                    }
                }
            }

            SEVariant(title: "symbolEffectsRemoved(_:) — opt out") {
                SECard(api: ".symbolEffectsRemoved()") {
                    HStack(spacing: 12) {
                        VStack(spacing: 4) {
                            Image(systemName: "wifi")
                                .font(.title)
                                .symbolEffect(.pulse, isActive: true)
                            Text("with effect").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 4) {
                            Image(systemName: "wifi")
                                .font(.title)
                                .symbolEffect(.pulse, isActive: true)
                                .symbolEffectsRemoved()
                            Text("effects removed").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            SEVariant(title: "SymbolEffectTransition") {
                SECard(api: ".transition(.symbolEffect)  — default symbol effect on appear/disappear") {
                    VStack(spacing: 6) {
                        if isBouncing {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.green)
                                .transition(.symbolEffect)
                        }
                        Button(isBouncing ? "Hide" : "Show") {
                            withAnimation { isBouncing.toggle() }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SEVariant(title: "Effect options — .speed, .repeat") {
                SECard(api: ".symbolEffect(.pulse.byLayer, options: .speed(2).repeat(3))") {
                    VStack(spacing: 8) {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.yellow)
                            .symbolEffect(.pulse.byLayer, options: .speed(2).repeat(3), isActive: isPulsing)
                        Button(isPulsing ? "Stop" : "Fast Pulse x3") { isPulsing.toggle() }
                    }
                }
            }
        }
    }

    private struct SENote { let title: String; let detail: String; let symbol: String }
    private let notes: [SENote] = [
        .init(title: "Two overloads: isActive (continuous) and value (discrete).", detail: "isActive: Bool keeps the effect running while true. value: some Equatable triggers the effect once each time the value changes.", symbol: "switch.2"),
        .init(title: "symbolEffectsRemoved() breaks inheritance.", detail: "Effects cascade down the view tree. Use .symbolEffectsRemoved() on a child view to opt out of a parent's effect.", symbol: "nosign"),
        .init(title: "SymbolEffectTransition works with withAnimation.", detail: ".transition(.symbolEffect) uses the symbol's built-in appear/disappear animation. Wrap the show/hide in withAnimation for it to fire.", symbol: "wand.and.stars"),
        .init(title: "Requires macOS 14 / iOS 17.", detail: "Symbol effects were introduced with the Symbols 5 update in 2023. Use #available guards for macOS 13 and earlier.", symbol: "info.circle"),
    ]

    @ViewBuilder private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct SECard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 140, minHeight: 80, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct SEVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    SymbolEffectsPage().frame(width: 1000, height: 1200)
}
