import SwiftUI

// SwiftUI `View.equatable()` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/equatable().md
// Performance hint: skip body re-evaluation when inputs are equal.

private struct StaticBadge: View, Equatable {
    let label: String
    var body: some View {
        Text(label)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(.tint, in: Capsule())
            .foregroundStyle(.white)
    }
}

struct EquatablePage: View {
    @State private var unrelatedTick = 0
    @State private var label = "BETA"

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
            Text("View.equatable()")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Prevents the view from updating its child view when its new value is the same as its old value.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/equatable().md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Equatable-conforming view, wrapped with .equatable()") {
            VStack(alignment: .leading, spacing: 12) {
                StaticBadge(label: label).equatable()
                HStack(spacing: 12) {
                    TextField("Label", text: $label).frame(maxWidth: 200)
                    Button("Unrelated tick (\(unrelatedTick))") { unrelatedTick += 1 }
                    Spacer()
                }
            }
            APICallout("StaticBadge(label:).equatable() — StaticBadge: View, Equatable")
            Text("StaticBadge conforms to Equatable on `label`. Unrelated state changes (the tick) won't recompute its body. Edit Label to change inputs and see it re-render.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Conform a view to Equatable") {
                snippet("""
                struct StaticBadge: View, Equatable {
                    let label: String
                    var body: some View { \u{2026} }
                }

                // Use .equatable() at the call site:
                StaticBadge(label: \"BETA\").equatable()
                """)
                Text("Mark the view Equatable; SwiftUI synthesizes == from the stored properties. Then call .equatable() to opt the view into equality-based update skipping.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Wrap a non-Equatable view") {
                snippet("""
                EquatableView(content: BadgeView(label: label))
                """)
                Text(".equatable() returns an EquatableView<Self>. You can also construct one directly when working with views you don't own.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Same inputs \u{2192} body skipped") {
                snippet("""
                // Parent state changes; child inputs don't.
                @State var counter = 0
                Button(\"+1\") { counter += 1 }
                StaticBadge(label: \"BETA\").equatable() // body NOT re-run
                """)
                Text("As long as the badge's inputs compare equal, SwiftUI skips re-running its body even when the parent recomputes.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Different inputs \u{2192} body runs") {
                snippet("""
                StaticBadge(label: latestLabel).equatable() // body re-runs only when label changes
                """)
                Text("Equality on inputs is the gate. Change an input and the body recomputes as usual.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "A performance hint, not a correctness tool.",
              detail: ".equatable() opts a view into update skipping when inputs compare equal. SwiftUI may or may not actually skip \u{2014} treat it as a hint, not a guarantee.",
              symbol: "speedometer"),
        .init(title: "Requires View: Equatable.",
              detail: "Conform your view to Equatable. Synthesized == over stored properties is usually enough; provide a custom == when you have transient stored state that shouldn't gate updates.",
              symbol: "checkmark.seal"),
        .init(title: "Useful for expensive bodies.",
              detail: "Reach for .equatable() when a view's body is genuinely expensive (heavy layout, allocations, derived computations) and you can prove equality is meaningful for it.",
              symbol: "hourglass"),
        .init(title: "Don't sprinkle it everywhere.",
              detail: "Most SwiftUI views are cheap enough that .equatable() adds noise without benefit. Profile first; apply where it actually moves the needle.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Returns an EquatableView<Self>.",
              detail: "The opaque return is EquatableView wrapping the original. You rarely need to name it \u{2014} use `some View` downstream and chain modifiers normally.",
              symbol: "rectangle.stack")
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

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

private struct Block<Content: View>: View {
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
    EquatablePage()
        .frame(width: 1100, height: 800)
}
