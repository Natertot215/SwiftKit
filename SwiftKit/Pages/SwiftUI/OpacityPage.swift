import SwiftUI

// SwiftUI `View/opacity(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/opacity(_:).md
// macOS 10.15+. Sets transparency from 0 (fully transparent) to 1 (fully opaque).

struct OpacityPage: View {
    @State private var opacity: Double = 0.5

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
            Text("View/opacity(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the transparency of this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/opacity(_:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Color.red.frame(width: 100, height: 100)
                    .offset(x: -20, y: -20)
                Color.yellow.frame(width: 100, height: 100)
                    .offset(x: 20, y: 20)
                    .opacity(0.5)
            }
            .frame(width: 200, height: 200)
            APICallout(".opacity(0.5)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            OpacityVariantRow(title: "Discrete steps") {
                HStack(spacing: 16) {
                    ForEach([0.0, 0.25, 0.5, 0.75, 1.0], id: \.self) { value in
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.tint)
                                .frame(width: 64, height: 64)
                                .opacity(value)
                            Text(String(format: ".opacity(%.2f)", value))
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }

            OpacityVariantRow(title: "Multiplicative \u{2014} stacking opacity modifiers") {
                VStack(alignment: .leading, spacing: 8) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.tint)
                        .frame(width: 120, height: 60)
                        .opacity(0.5)
                        .opacity(0.5)
                    APICallout(".opacity(0.5).opacity(0.5) \u{2192} effective 0.25")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            OpacityVariantRow(title: "Interactive \u{2014} bound to a Slider") {
                VStack(alignment: .leading, spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.tint)
                        .frame(width: 240, height: 120)
                        .opacity(opacity)
                    HStack {
                        Text("0").font(.caption).foregroundStyle(.secondary)
                        Slider(value: $opacity, in: 0...1)
                            .frame(maxWidth: 240)
                        Text("1").font(.caption).foregroundStyle(.secondary)
                    }
                    Text(String(format: "opacity = %.2f", opacity))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct OpacityNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [OpacityNote] = [
        .init(title: "0 = fully transparent, 1 = fully opaque.",
              detail: "Values outside the closed unit interval are clamped. The view still occupies layout space and remains in the hierarchy regardless of opacity.",
              symbol: "circle.lefthalf.filled"),
        .init(title: "Stacking opacity modifiers multiplies their effect.",
              detail: "Two .opacity(0.5) modifiers compose to an effective 0.25. To override an inherited opacity, you generally need to push the value back to 1 explicitly.",
              symbol: "square.stack.3d.up"),
        .init(title: "Hit-testing still happens at opacity 0.",
              detail: "Unlike .hidden(), an opacity-0 view continues to receive interactions. Use .allowsHitTesting(false) alongside if you also need to disable input.",
              symbol: "hand.point.up.left"),
        .init(title: "Animatable \u{2014} pairs naturally with .animation / withAnimation.",
              detail: "opacity is one of SwiftUI's native animatable properties. Wrap state changes in withAnimation to fade views in and out without an explicit transition.",
              symbol: "wand.and.stars"),
        .init(title: "Prefer .opacity over .foregroundStyle for fades.",
              detail: "Adjusting foreground style with translucent colors mixes with the underlying material differently. .opacity gives a uniform, predictable fade across the whole subtree.",
              symbol: "paintbrush")
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

private struct OpacityVariantRow<Content: View>: View {
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
    OpacityPage()
        .frame(width: 1100, height: 800)
}
