import SwiftUI

// SwiftUI ContentTransition bundle.
// Covers:
//   ContentTransition            — the type (enum-like)
//   View/contentTransition(_:)   — applies a content transition
//   EnvironmentValues/contentTransition                — env key
//   EnvironmentValues/contentTransitionAddsDrawingGroup — env key
// Source: Documentation/SwiftUI/animations/contenttransition*.md
// macOS 13.0+

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 180

struct ContentTransitionPage: View {
    @State private var counter = 0
    @State private var counterNumeric = 0
    @State private var counterInterp = 0
    @State private var useDrawingGroup = false

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
            Text("ContentTransition")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Controls how a view transitions when its content changes (not when the view is inserted or removed). Applied via .contentTransition(_:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/contenttransition.md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".contentTransition(.opacity)") {
            VStack(spacing: 12) {
                Text("\(counter)")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundStyle(.tint)
                    .contentTransition(.opacity)
                Button("Increment") {
                    withAnimation(.easeInOut(duration: 0.3)) { counter += 1 }
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".numericText() \u{2014} counts up or down with directional animation") {
                DemoFrame(api: ".contentTransition(.numericText())") {
                    VStack(spacing: 12) {
                        Text("\(counterNumeric)")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundStyle(.tint)
                            .contentTransition(.numericText())
                        HStack(spacing: 8) {
                            Button("-") {
                                withAnimation(.spring) { counterNumeric -= 1 }
                            }
                            .buttonStyle(.bordered)
                            Button("+") {
                                withAnimation(.spring) { counterNumeric += 1 }
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: ".interpolate \u{2014} cross-fades between vector-drawable content") {
                DemoFrame(api: ".contentTransition(.interpolate)") {
                    VStack(spacing: 12) {
                        Text("\(counterInterp)")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundStyle(.tint)
                            .contentTransition(.interpolate)
                        Button("Change") {
                            withAnimation(.easeOut(duration: 0.4)) { counterInterp += 1 }
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: ".identity \u{2014} no visual transition") {
                DemoFrame(api: ".contentTransition(.identity)") {
                    VStack(spacing: 8) {
                        Text("ContentTransition.identity disables the transition: content changes immediately without animation, even inside withAnimation.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "contentTransitionAddsDrawingGroup \u{2014} performance hint") {
                DemoFrame(api: "@Environment(\\.contentTransitionAddsDrawingGroup) var addsDrawingGroup") {
                    VStack(spacing: 8) {
                        Text("contentTransitionAddsDrawingGroup is an environment Bool that tells the system whether to add a drawingGroup() layer automatically during a content transition, improving performance for complex views.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    private struct NoteItem {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NoteItem] = [
        .init(title: "ContentTransition animates content replacement, not view insertion/removal.",
              detail: "Unlike .transition(_:), .contentTransition(_:) fires when a view that is already present changes its rendered content — e.g. a counter incrementing, a label text changing.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: ".numericText() is best for changing numbers.",
              detail: "It reads the direction of change (positive = count up, negative = count down) and applies a directional sliding blur for a native feel. Use .numericText(countsDown: true) to invert.",
              symbol: "number"),
        .init(title: ".interpolate blends between compatible vector shapes.",
              detail: "Works well for SF Symbol state changes and path-compatible shapes. Requires the source and destination to share the same draw-call structure.",
              symbol: "wand.and.stars"),
        .init(title: "Must be used with withAnimation or .animation(_:value:).",
              detail: ".contentTransition(_:) declares the style but the animation itself is driven by the surrounding animation context. Without an animation, content changes instantly regardless of the transition style.",
              symbol: "play.fill")
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
    ContentTransitionPage()
        .frame(width: 1100, height: 900)
}
