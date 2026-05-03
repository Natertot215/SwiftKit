import SwiftUI

// SwiftUI `View.body` requirement reference page.
// Source: Documentation/SwiftUI/view-fundamentals/body-8kl5o.md
// `body` is a protocol requirement — code-snippet style.

struct ViewBodyPage: View {
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
            Text("View.body")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The content and behavior of the view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/body-8kl5o.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        BodySnippet(
            api: "@ViewBuilder @MainActor var body: Self.Body { get }",
            code: """
            struct Greeting: View {
                var body: some View {
                    Text("Hello, world.")
                }
            }
            """,
            note: "The single requirement of the View protocol. Returns the content this view describes."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            BodyVariant(title: "Implicit @ViewBuilder") {
                BodySnippet(
                    api: "body is implicitly @ViewBuilder \u{2014} multi-statement closures compose",
                    code: """
                    struct TwoLines: View {
                        var body: some View {
                            Text("Line one")
                            Text("Line two")
                        }
                    }
                    """,
                    note: "Two sibling Texts inside body are combined into a TupleView automatically by the result builder."
                )
            }

            BodyVariant(title: "Conditional content") {
                BodySnippet(
                    api: "if / else / switch produce _ConditionalContent",
                    code: """
                    struct StatusLabel: View {
                        let isReady: Bool
                        var body: some View {
                            if isReady {
                                Label("Ready", systemImage: "checkmark.circle")
                            } else {
                                Label("Loading", systemImage: "hourglass")
                            }
                        }
                    }
                    """,
                    note: "ViewBuilder lets you branch in body. Each branch must produce View; the builder erases to _ConditionalContent."
                )
            }

            BodyVariant(title: "Decomposed body") {
                BodySnippet(
                    api: "Break body into computed properties or @ViewBuilder methods",
                    code: """
                    struct Profile: View {
                        var body: some View {
                            VStack(alignment: .leading) {
                                avatar
                                details
                            }
                        }

                        private var avatar: some View {
                            Image(systemName: "person.crop.circle").font(.largeTitle)
                        }

                        @ViewBuilder
                        private var details: some View {
                            Text("Ada Lovelace").font(.headline)
                            Text("Compiler Engineer").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    """,
                    note: "When body grows, extract pieces into private computed properties or @ViewBuilder helpers — they cost nothing at runtime."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            BodyVariant(title: "Body recomputes when inputs change") {
                BodySnippet(
                    api: "@State / @Binding / @Environment / observed dependencies trigger recomputation",
                    code: """
                    struct Counter: View {
                        @State private var count = 0
                        var body: some View {
                            // body runs again every time `count` changes.
                            VStack {
                                Text("\\(count)")
                                Button("Increment") { count += 1 }
                            }
                        }
                    }
                    """,
                    note: "SwiftUI calls body whenever a tracked dependency invalidates. Keep body cheap and idempotent."
                )
            }

            BodyVariant(title: "Side effects belong outside body") {
                BodySnippet(
                    api: "Use .task / .onAppear / .onChange — never side-effect in body itself",
                    code: """
                    struct Loader: View {
                        @State private var rows: [String] = []
                        var body: some View {
                            List(rows, id: \\.self) { Text($0) }
                                .task { rows = await fetchRows() }
                        }

                        func fetchRows() async -> [String] { [] }
                    }
                    """,
                    note: "body might run many times per second. Network calls, logging, and mutation belong in lifecycle modifiers."
                )
            }
        }
    }

    private struct BodyNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [BodyNote] = [
        .init(title: "body is the only required View member.",
              detail: "Conforming to View means providing a body. The associated type Body is inferred from the return type — usually `some View` so the compiler picks it for you.",
              symbol: "shippingbox"),
        .init(title: "body returns `some View`, not a concrete type.",
              detail: "Opaque return types let the compiler reason about an unnameable, possibly enormous generic chain. Trying to spell the full type out is a pain and breaks every modifier chain.",
              symbol: "questionmark.diamond"),
        .init(title: "Implicit @ViewBuilder applies to body.",
              detail: "Even though you don't write @ViewBuilder, the protocol declares it. That's why multi-statement bodies, if/else, switch, and ForEach all work.",
              symbol: "rectangle.stack"),
        .init(title: "Primitive views' Body is Never.",
              detail: "Things like Text, Color, Image, Spacer have `typealias Body = Never`. They're terminal — SwiftUI renders them directly without recursing further.",
              symbol: "stop.circle"),
        .init(title: "Don't allocate or do work in body.",
              detail: "Body should be a pure description: return what should be on screen given current inputs. Side effects belong in .task, .onAppear, .onChange, or button actions.",
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
}

private struct BodySnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
            APICallout(api)
            if let note {
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct BodyVariant<Content: View>: View {
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
    ViewBodyPage()
        .frame(width: 1100, height: 800)
}
