import SwiftUI

// SwiftUI "Reducing view modifier maintenance" article reference page.
// Source: Documentation/SwiftUI/view-fundamentals/reducing-view-modifier-maintenance.md
// Article-stub: shows the before/after of bundling repeated modifiers.

private struct CardChromeStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.separator, lineWidth: 1))
            .foregroundStyle(.primary)
    }
}

private extension View {
    func cardChrome() -> some View { modifier(CardChromeStyle()) }
}

struct ReducingViewModifierMaintenancePage: View {
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
            Text("Reducing View Modifier Maintenance")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Bundle view modifiers that you regularly reuse into a custom view modifier.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/reducing-view-modifier-maintenance.md \u{00b7} article")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Bundled \u{2192} one call site, one place to change") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Card one").cardChrome()
                Text("Card two").cardChrome()
                Text("Card three").cardChrome()
            }
            APICallout(".cardChrome() — extension View { func cardChrome() -> some View }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Before \u{2014} repeated modifiers") {
                snippet("""
                Text("One")
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.separator, lineWidth: 1))
                Text("Two")
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.separator, lineWidth: 1))
                """)
                Text("Same chain repeated everywhere. Change the radius and you edit N call sites.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "After \u{2014} bundled into a ViewModifier") {
                snippet("""
                struct CardChromeStyle: ViewModifier {
                    func body(content: Content) -> some View {
                        content
                            .padding(12)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.separator, lineWidth: 1))
                    }
                }

                extension View {
                    func cardChrome() -> some View { modifier(CardChromeStyle()) }
                }

                Text("One").cardChrome()
                Text("Two").cardChrome()
                """)
                Text("One definition. Change the radius once and every card updates.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Parameterized") {
                snippet("""
                struct PadStyle: ViewModifier {
                    let inset: CGFloat
                    func body(content: Content) -> some View { content.padding(inset) }
                }

                extension View {
                    func pad(_ inset: CGFloat) -> some View { modifier(PadStyle(inset: inset)) }
                }
                """)
                Text("Pass arguments through the modifier struct to keep the call site terse but configurable.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Block(title: "Side-by-side: same chain, two call styles") {
            HStack(alignment: .top, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Inline chain").font(.caption).foregroundStyle(.secondary)
                    Text("Hello")
                        .padding(12)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.separator, lineWidth: 1))
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Bundled").font(.caption).foregroundStyle(.secondary)
                    Text("Hello").cardChrome()
                }
            }
            APICallout("Visually identical \u{2014} maintenance cost is not")
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "Bundle 2+ chained modifiers, not 1.",
              detail: "Wrapping a single modifier in another modifier adds indirection without payoff. The win shows up when 2+ modifiers always appear together.",
              symbol: "scissors"),
        .init(title: "Expose via a View extension.",
              detail: "Apple's pattern: private struct conforms to ViewModifier; public func on View calls .modifier(\u{2026}). Call sites read like first-party API.",
              symbol: "puzzlepiece"),
        .init(title: "Centralized = consistent.",
              detail: "Cards, pills, badges, section headers — when their styling lives in one ViewModifier, the whole app updates in one edit.",
              symbol: "paintbrush"),
        .init(title: "Easier previews.",
              detail: "Custom modifiers preview cleanly: Text(\"Sample\").cardChrome() in #Preview shows the styled output without scaffolding.",
              symbol: "rectangle.on.rectangle"),
        .init(title: "Don't over-bundle.",
              detail: "If a modifier chain is one-off, leave it inline. The goal is to remove repetition, not to invent vocabulary that obscures intent.",
              symbol: "exclamationmark.triangle")
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
    ReducingViewModifierMaintenancePage()
        .frame(width: 1100, height: 800)
}
