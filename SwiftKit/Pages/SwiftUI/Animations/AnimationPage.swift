import SwiftUI

// SwiftUI Animation bundle.
// Covers:
//   Animation                              — the type
//   View/animation(_:)                     — deprecated form (no value)
//   View/animation(_:value:)               — preferred form
//   View/animation(_:body:)                — closure-scoped form (macOS 14+)
//   Binding/animation(_:)                  — animates binding changes
//   withAnimation(_:_:)                    — imperative animation
//   withAnimation(_:completionCriteria:_:completion:)  — with completion (macOS 14+)
// Sources: Documentation/SwiftUI/animations/animation*.md

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 180

struct AnimationPage: View {
    @State private var expanded = false
    @State private var bounceOffset = false
    @State private var bodyScaled = false
    @State private var bindingToggle = false
    @State private var imperativeScale = false
    @State private var completionMessage = ""

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
            Text("Animation")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type that defines how a change to a value animates between its old and new states. Applied via .animation(_:value:), withAnimation, or Binding.animation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/animation.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".animation(.spring, value: expanded)") {
            VStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.tint)
                    .frame(width: expanded ? 300 : 80, height: 48)
                    .animation(.spring, value: expanded)
                Button(expanded ? "Collapse" : "Expand") {
                    expanded.toggle()
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
            VariantBlock(title: "View/animation(_:value:) \u{2014} preferred, value-based") {
                DemoFrame(api: ".animation(.bouncy, value: bounceOffset)") {
                    VStack(spacing: 12) {
                        Circle()
                            .fill(.tint)
                            .frame(width: 40, height: 40)
                            .offset(y: bounceOffset ? -40 : 0)
                            .animation(.bouncy, value: bounceOffset)
                        Button("Bounce") { bounceOffset.toggle() }
                            .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "View/animation(_:body:) \u{2014} closure-scoped (macOS 14+)") {
                DemoFrame(api: ".animation(.easeInOut(duration: 0.6)) { $0.scaleEffect(bodyScaled ? 1.5 : 1) }") {
                    VStack(spacing: 12) {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.yellow)
                            .animation(.easeInOut(duration: 0.6)) { content in
                                content.scaleEffect(bodyScaled ? 1.5 : 1)
                            }
                        Button("Scale") { bodyScaled.toggle() }
                            .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "Binding/animation(_:) \u{2014} animates binding writes") {
                DemoFrame(api: "Toggle(isOn: $bindingToggle.animation(.easeOut))") {
                    VStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(bindingToggle ? Color.green : Color.secondary)
                            .frame(width: 160, height: 40)
                            .overlay(Text(bindingToggle ? "ON" : "OFF").foregroundStyle(.white).fontWeight(.semibold))
                        Toggle("Animate toggle", isOn: $bindingToggle.animation(.easeOut(duration: 0.4)))
                            .toggleStyle(.switch)
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
            VariantBlock(title: "withAnimation(_:_:) \u{2014} imperative animation") {
                DemoFrame(api: "withAnimation(.spring) { imperativeScale.toggle() }") {
                    VStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.tint)
                            .frame(width: 80, height: 80)
                            .scaleEffect(imperativeScale ? 1.6 : 1.0)
                        Button("withAnimation") {
                            withAnimation(.spring) { imperativeScale.toggle() }
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "withAnimation(completionCriteria:completion:) \u{2014} macOS 14+") {
                DemoFrame(api: "withAnimation(.easeIn, completionCriteria: .logicallyComplete) { \u{2026} } completion: { \u{2026} }") {
                    VStack(spacing: 12) {
                        Text(completionMessage.isEmpty ? "Waiting\u{2026}" : completionMessage)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .animation(.default, value: completionMessage)
                        Button("Animate with completion") {
                            completionMessage = ""
                            withAnimation(.easeIn(duration: 0.6), completionCriteria: .logicallyComplete) {
                                imperativeScale.toggle()
                            } completion: {
                                completionMessage = "Animation finished!"
                            }
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "Built-in Animation presets") {
                DemoFrame(api: ".linear | .easeIn | .easeOut | .easeInOut | .spring | .bouncy | .snappy") {
                    HStack(spacing: 8) {
                        ForEach([".linear", ".easeIn", ".spring", ".bouncy", ".snappy"], id: \.self) { name in
                            Text(name)
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                                .foregroundStyle(.tint)
                        }
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
        .init(title: "Prefer .animation(_:value:) over .animation(_:).",
              detail: "The value-less form .animation(_:) is deprecated because it re-animates on every state change in the subtree, not just the specific value that changed. Use the value: parameter to scope animation to the specific change.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Animation presets: .default, .linear, .easeIn/Out/InOut, .spring, .bouncy, .snappy.",
              detail: "Each preset has customizable duration and extra parameters: .spring(duration:bounce:), .interpolatingSpring(mass:stiffness:damping:), .easeIn(duration:), etc.",
              symbol: "chart.line.uptrend.xyaxis"),
        .init(title: "withAnimation is imperative; .animation(_:value:) is declarative.",
              detail: "Use withAnimation when the trigger is an imperative action (button tap, network response). Use .animation(_:value:) when the animated property is driven by view state that can change from multiple sources.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "Binding.animation(_:) wraps every write to the binding.",
              detail: "$myValue.animation(.spring) returns an AnimatableBinding. Any view that writes through that binding — Toggle, Slider, Stepper — will animate the resulting state change.",
              symbol: "link")
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
    AnimationPage()
        .frame(width: 1100, height: 900)
}
