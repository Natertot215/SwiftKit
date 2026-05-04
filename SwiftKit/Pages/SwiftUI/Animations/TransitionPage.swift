import SwiftUI

// SwiftUI Transition bundle.
// Covers:
//   Transition                 — protocol (macOS 14+)
//   AnyTransition              — type-erased transition
//   AsymmetricTransition       — different in/out transitions
//   AnyTransition/scale        — scale transition
//   AnyTransition/slide        — slide transition
//   TransitionPhase            — enum (inserted/identity/removed)
//   TransitionProperties       — struct
//   View/transition(_:)        — applies a transition
// Source: Documentation/SwiftUI/animations/

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 180

struct TransitionPage: View {
    @State private var showFade = true
    @State private var showSlide = true
    @State private var showScale = true
    @State private var showAsymmetric = true
    @State private var showMove = true
    @State private var showCustom = true

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
            Text("Transition / AnyTransition")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Defines how a view appears and disappears in response to insertion or removal from the view hierarchy. Applied via .transition(_:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/anytransition.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".transition(.slide)") {
            VStack(spacing: 12) {
                if showSlide {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.tint)
                        .frame(width: 200, height: 50)
                        .transition(.slide)
                }
                Button(showSlide ? "Remove" : "Insert") {
                    withAnimation(.easeInOut(duration: 0.4)) { showSlide.toggle() }
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
            VariantBlock(title: ".opacity \u{2014} fade in/out") {
                DemoFrame(api: ".transition(.opacity)") {
                    TransitionDemo(transition: .opacity, label: "Fade view", show: $showFade)
                }
            }

            VariantBlock(title: ".scale \u{2014} AnyTransition/scale") {
                DemoFrame(api: ".transition(.scale)") {
                    TransitionDemo(transition: .scale, label: "Scale view", show: $showScale)
                }
            }

            VariantBlock(title: ".move(edge:) \u{2014} slides from an edge") {
                DemoFrame(api: ".transition(.move(edge: .trailing))") {
                    TransitionDemo(transition: .move(edge: .trailing), label: "Move from trailing", show: $showMove)
                }
            }

            VariantBlock(title: "AsymmetricTransition \u{2014} different insertion and removal") {
                DemoFrame(api: ".transition(.asymmetric(insertion: .scale, removal: .opacity))") {
                    TransitionDemo(
                        transition: .asymmetric(insertion: .scale, removal: .opacity),
                        label: "Scale in, fade out",
                        show: $showAsymmetric
                    )
                }
            }

            VariantBlock(title: ".combined(with:) \u{2014} stacking transitions") {
                DemoFrame(api: ".transition(.slide.combined(with: .opacity))") {
                    TransitionDemo(
                        transition: .slide.combined(with: .opacity),
                        label: "Slide + fade",
                        show: $showCustom
                    )
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "TransitionPhase \u{2014} .willAppear / .identity / .didDisappear") {
                DemoFrame(api: ".transition(MyTransition()) where body(content:phase:) observes phase") {
                    VStack(spacing: 8) {
                        HStack(spacing: 8) {
                            ForEach(["willAppear", "identity", "didDisappear"], id: \.self) { phase in
                                Text(phase)
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 3)
                                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                                    .foregroundStyle(.tint)
                            }
                        }
                        Text("TransitionPhase lets custom Transition conformances apply\ndifferent transforms for each animation phase.")
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
        .init(title: "AnyTransition is the older pre-protocol API; Transition is the macOS 14+ protocol.",
              detail: "AnyTransition.slide, .scale, .opacity, .move, .asymmetric all remain available. In macOS 14+ you can also conform custom types to the Transition protocol and pass them directly to .transition(_:).",
              symbol: "arrow.up.arrow.down"),
        .init(title: ".transition(_:) only fires on insertion and removal \u{2014} not every state change.",
              detail: "A transition runs when the view goes from absent to present (insertion) or present to absent (removal). Wrapping the if/else in withAnimation or pairing with .animation(_:value:) provides the animation curve.",
              symbol: "play.fill"),
        .init(title: "AsymmetricTransition composes two transitions.",
              detail: ".asymmetric(insertion:removal:) lets you choose completely different entry and exit behaviors \u{2014} e.g., a view scales in from zero but slides out to the trailing edge.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "TransitionProperties declares whether a transition affects identity.",
              detail: "Custom Transition conformances can return TransitionProperties(hasMotion:) to hint to the system whether the transition animates position/scale (hasMotion: true) or is purely cosmetic.",
              symbol: "info.circle")
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

private struct TransitionDemo: View {
    let transition: AnyTransition
    let label: String
    @Binding var show: Bool

    var body: some View {
        VStack(spacing: 12) {
            if show {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.tint)
                    .frame(width: 200, height: 50)
                    .overlay(Text(label).foregroundStyle(.white).font(.callout).fontWeight(.medium))
                    .transition(transition)
            }
            Button(show ? "Remove" : "Insert") {
                withAnimation(.easeInOut(duration: 0.4)) { show.toggle() }
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    TransitionPage()
        .frame(width: 1100, height: 900)
}
