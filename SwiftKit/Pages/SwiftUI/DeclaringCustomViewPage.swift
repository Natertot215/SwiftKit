import SwiftUI

// SwiftUI "Declaring a custom view" article reference page.
// Source: Documentation/SwiftUI/view-fundamentals/declaring-a-custom-view.md
// Article-stub: code snippets and HIG-flavored commentary.

private struct ProfileBadge: View {
    let name: String
    let title: String
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "person.crop.circle.fill")
                .font(.title2)
                .foregroundStyle(.tint)
            VStack(alignment: .leading) {
                Text(name).font(.headline)
                Text(title).font(.caption).foregroundStyle(.secondary)
            }
        }
        .padding(8)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
    }
}

struct DeclaringCustomViewPage: View {
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
            Text("Declaring a Custom View")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Define views and assemble them into a view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/declaring-a-custom-view.md \u{00b7} article")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "A small custom view") {
            ProfileBadge(name: "Ada Lovelace", title: "Compiler Engineer")
            snippet("""
            struct ProfileBadge: View {
                let name: String
                let title: String
                var body: some View {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                        VStack(alignment: .leading) {
                            Text(name).font(.headline)
                            Text(title).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
            """)
            APICallout("struct YourView: View { var body: some View { \u{2026} } }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Composing two custom views") {
                VStack(alignment: .leading, spacing: 6) {
                    ProfileBadge(name: "Ada Lovelace", title: "Compiler Engineer")
                    ProfileBadge(name: "Grace Hopper",  title: "Systems Architect")
                }
                APICallout("VStack { ProfileBadge(\u{2026}); ProfileBadge(\u{2026}) }")
                Text("Custom views compose like primitives. The compiler infers the surrounding TupleView.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Stored properties as inputs") {
                snippet("""
                struct ScoreCard: View {
                    let label: String
                    let value: Int
                    var body: some View {
                        VStack {
                            Text(label).font(.caption).foregroundStyle(.secondary)
                            Text("\\(value)").font(.title.weight(.bold))
                        }
                    }
                }

                ScoreCard(label: "Wins", value: 42)
                """)
                Text("Stored properties define the public API of your view. SwiftUI re-runs body when they change.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Generic over content") {
                snippet("""
                struct LabelBox<Label: View>: View {
                    @ViewBuilder let label: () -> Label
                    var body: some View {
                        label()
                            .padding(8)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    }
                }

                LabelBox { Text("Anything goes here") }
                """)
                Text("Generic over a content closure with @ViewBuilder is the pattern Apple uses for VStack, Group, Section, etc.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Block(title: "Same view, different inputs") {
            HStack(alignment: .top, spacing: 16) {
                ProfileBadge(name: "Ada Lovelace",  title: "Engineer")
                ProfileBadge(name: "Susan Kare",    title: "Designer")
                ProfileBadge(name: "Alan Turing",   title: "Researcher")
            }
            APICallout("ProfileBadge(name:title:) — three instances, three inputs")
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "Prefer many small views.",
              detail: "Apple's guidance: when a body grows past a screen, split it. Small views are easier to reason about, easier to preview, and SwiftUI is built to compose thousands of them cheaply.",
              symbol: "rectangle.split.3x3"),
        .init(title: "Pass data in via stored properties.",
              detail: "let / var inputs feed the view function. SwiftUI tracks them and re-evaluates body when they change. This is how unidirectional data flow falls out of the model.",
              symbol: "arrow.down.right.circle"),
        .init(title: "Use @ViewBuilder closures for slot-based APIs.",
              detail: "When your custom container should accept arbitrary content, take a `@ViewBuilder content: () -> Content` parameter — the same shape VStack, ForEach, NavigationStack, etc. use.",
              symbol: "square.dashed.inset.filled"),
        .init(title: "Previews thrive on small custom views.",
              detail: "Each view is independently previewable in Xcode. Splitting your UI into many small custom views lets you iterate on one piece at a time without firing up the full app.",
              symbol: "rectangle.on.rectangle")
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
    DeclaringCustomViewPage()
        .frame(width: 1100, height: 800)
}
