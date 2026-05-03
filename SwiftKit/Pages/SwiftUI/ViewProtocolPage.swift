import SwiftUI

// SwiftUI `View` protocol reference page.
// Source: Documentation/SwiftUI/view-fundamentals/view.md
// View is a protocol — it cannot be rendered inline. This page documents the
// protocol shape with code snippets and explanatory notes.

struct ViewProtocolPage: View {
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
            Text("View")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type that represents part of your app's user interface and provides modifiers that you use to configure views.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/view.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        ViewSnippet(
            api: "@MainActor @preconcurrency protocol View",
            code: """
            struct GreetingView: View {
                var body: some View {
                    Text("Hello, world.")
                }
            }
            """,
            note: "The simplest custom view: a struct that conforms to View and returns one primitive from body."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VPVariant(title: "Composing primitives") {
                ViewSnippet(
                    api: "var body: some View { VStack { \u{2026} } }",
                    code: """
                    struct ProfileRow: View {
                        let name: String
                        let role: String
                        var body: some View {
                            VStack(alignment: .leading) {
                                Text(name).font(.headline)
                                Text(role).font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }
                    """,
                    note: "Compose Apple primitives directly. SwiftKit's hard rule: never re-implement what already exists in SwiftUI."
                )
            }

            VPVariant(title: "Stored properties feed body") {
                ViewSnippet(
                    api: "let / var stored properties become inputs to the view function",
                    code: """
                    struct Badge: View {
                        let count: Int
                        var body: some View {
                            Text("\\(count)")
                                .font(.caption2)
                                .padding(.horizontal, 6)
                                .background(.tint, in: Capsule())
                        }
                    }
                    """,
                    note: "Pass data in via stored properties. SwiftUI re-invokes body when those properties change."
                )
            }

            VPVariant(title: "State drives body") {
                ViewSnippet(
                    api: "@State private var \u{2026}",
                    code: """
                    struct Toggleable: View {
                        @State private var on = false
                        var body: some View {
                            Toggle("On", isOn: $on)
                        }
                    }
                    """,
                    note: "Mutable view-local data uses @State. Bindings (`$on`) hand the property's read/write pair to a child."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VPVariant(title: "Some View vs. concrete return") {
                ViewSnippet(
                    api: "var body: some View",
                    code: """
                    // Idiomatic — opaque return type lets the compiler infer the view tree.
                    var body: some View {
                        VStack { Text("A"); Text("B") }
                    }

                    // Rare — naming a concrete type defeats most generic helpers.
                    var body: VStack<TupleView<(Text, Text)>> {
                        VStack { Text("A"); Text("B") }
                    }
                    """,
                    note: "Always prefer `some View`. Concrete return types break composition and modifier chains."
                )
            }

            VPVariant(title: "Body cannot be empty") {
                ViewSnippet(
                    api: "body: Self.Body — Body must conform to View",
                    code: """
                    // Use EmptyView when a code path renders nothing.
                    struct OptionalLabel: View {
                        let text: String?
                        var body: some View {
                            if let text {
                                Text(text)
                            } else {
                                EmptyView()
                            }
                        }
                    }
                    """,
                    note: "EmptyView, Color, and the primitives are all View conformers. Body returns Never only for primitive views Apple ships."
                )
            }
        }
    }

    private struct VPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [VPNote] = [
        .init(title: "Views are values, not objects.",
              detail: "A View is a description of UI, not a live instance. SwiftUI re-evaluates body whenever inputs change and reconciles a tree of value types into a render hierarchy.",
              symbol: "doc.plaintext"),
        .init(title: "@MainActor isolation is implicit.",
              detail: "The protocol is @MainActor @preconcurrency. Bodies always run on the main actor — that's why @State and @Environment can be touched without async hops.",
              symbol: "cpu"),
        .init(title: "Conforming types are usually structs.",
              detail: "Value semantics make diffing cheap and predictable. Reference-typed conformers are technically allowed but lose the storage guarantees @State and friends rely on.",
              symbol: "cube"),
        .init(title: "Body must be pure.",
              detail: "Don't perform side effects in body — no network calls, no mutating shared state, no logging that fires every frame. Move work into .task / .onAppear / event handlers.",
              symbol: "function"),
        .init(title: "Modifiers return a new View.",
              detail: "Every modifier (.padding, .foregroundStyle, .frame, etc.) is a function on View that returns ModifiedContent<Self, SomeModifier>. The chain is the tree.",
              symbol: "wand.and.stars")
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

private struct ViewSnippet: View {
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

private struct VPVariant<Content: View>: View {
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
    ViewProtocolPage()
        .frame(width: 1100, height: 800)
}
