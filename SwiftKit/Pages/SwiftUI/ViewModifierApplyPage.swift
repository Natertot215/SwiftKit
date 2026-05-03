import SwiftUI

// SwiftUI `View.modifier(_:)` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/modifier(_:).md
// Demonstrates applying a custom ViewModifier with .modifier(_:).

private struct PillStyle: ViewModifier {
    let tint: Color
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(tint, in: Capsule())
    }
}

private struct OutlinedStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint, lineWidth: 1))
    }
}

struct ViewModifierApplyPage: View {
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
            Text("View.modifier(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Applies a modifier to a view and returns a new view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/modifier(_:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Apply a custom modifier") {
            HStack(spacing: 12) {
                Text("New").modifier(PillStyle(tint: .blue))
                Text("Hot").modifier(PillStyle(tint: .red))
                Text("Beta").modifier(PillStyle(tint: .orange))
            }
            APICallout("Text(\"New\").modifier(PillStyle(tint: .blue))")
            Text("Returns ModifiedContent<Self, T> where T is your ViewModifier.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Chained modifiers") {
                Text("Outlined pill").modifier(PillStyle(tint: .indigo)).modifier(OutlinedStyle())
                APICallout(".modifier(PillStyle(tint: .indigo)).modifier(OutlinedStyle())")
                Text("Each .modifier(_:) returns a new ModifiedContent. Chain freely.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Sugared via View extension") {
                snippet("""
                extension View {
                    func pillStyle(tint: Color) -> some View { modifier(PillStyle(tint: tint)) }
                }

                Text("Cleaner").pillStyle(tint: .blue)
                """)
                Text("Apple recommends wrapping .modifier(\u{2026}) in a View extension so call sites read like first-party API.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Different parameter values") {
                HStack(spacing: 12) {
                    Text(".tint .blue").modifier(PillStyle(tint: .blue))
                    Text(".tint .green").modifier(PillStyle(tint: .green))
                    Text(".tint .pink").modifier(PillStyle(tint: .pink))
                    Text(".tint .gray").modifier(PillStyle(tint: .gray))
                }
                APICallout("PillStyle(tint:) — same modifier type, varied input")
            }
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: ".modifier(_:) is the user-facing application API.",
              detail: "ViewModifier defines the transform; .modifier(_:) on View applies it. They're a pair — you almost never call one without the other.",
              symbol: "link"),
        .init(title: "Returns ModifiedContent<Self, T>.",
              detail: "The opaque return type chain accumulates. Don't try to spell it out; use `some View` everywhere downstream.",
              symbol: "arrow.up.right"),
        .init(title: "Wrap in a View extension for ergonomics.",
              detail: "`extension View { func pillStyle(tint:) -> some View { modifier(PillStyle(tint: tint)) } }` — call sites read like Apple's built-in modifiers.",
              symbol: "puzzlepiece"),
        .init(title: "Order of application matters.",
              detail: "Modifiers are applied outward. .padding().background() draws background around padding; .background().padding() inserts padding outside the background. Same as built-ins.",
              symbol: "arrow.up.and.down")
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
    ViewModifierApplyPage()
        .frame(width: 1100, height: 800)
}
