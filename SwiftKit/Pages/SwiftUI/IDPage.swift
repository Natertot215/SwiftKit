import SwiftUI

// SwiftUI `View.id(_:)` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/id(_:).md
// Live demo: changing the id forces SwiftUI to replace the view, resetting @State.

struct IDPage: View {
    @State private var version = 0

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
            Text("View.id(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Binds a view's identity to the given proxy value.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/id(_:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Bumping the id replaces the view") {
            VStack(alignment: .leading, spacing: 12) {
                ResettableCounter()
                    .id(version)
                HStack(spacing: 12) {
                    Button("Reset (bump id)") { version += 1 }
                    Spacer()
                    Text("id = \(version)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
            APICallout(".id(version) — version: Hashable")
            Text("Tap Reset: SwiftUI sees a new identity, treats it as a new view, and re-creates @State from scratch.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Use a model identifier") {
                snippet("""
                ForEach(messages) { message in
                    MessageRow(message: message)
                        .id(message.id)
                }
                """)
                Text("ForEach uses Identifiable for identity by default. Apply .id(\u{2026}) explicitly when the data isn't Identifiable or you need a different identity key.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Force a clean reset") {
                snippet("""
                EditorPane(document: doc)
                    .id(doc.id) // a different document = a fresh editor
                """)
                Text("When the bound model changes wholesale (e.g. switching documents), .id(\u{2026}) gives the editor a clean state stack.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Anchor for ScrollViewReader") {
                snippet("""
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(rows) { row in
                            Text(row.name).id(row.id)
                        }
                    }
                    Button("Top") { proxy.scrollTo(rows.first!.id, anchor: .top) }
                }
                """)
                Text("ScrollViewReader scrolls to .id(\u{2026}) targets. Identity here is the addressable anchor.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Same id \u{2192} preserved state") {
                snippet("""
                CounterView().id("stable") // @State persists across recomputes
                """)
                Text("Identity is the contract that lets SwiftUI re-use a view across body recomputations. Stable id = stable state.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Different id \u{2192} fresh state") {
                snippet("""
                CounterView().id(version) // bumping `version` resets the counter
                """)
                Text("A new id is a new view from SwiftUI's perspective. The old one tears down (.onDisappear), the new one initializes (.onAppear, fresh @State).")
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
        .init(title: "Identity drives diffing.",
              detail: "SwiftUI compares the previous tree to the new one by identity to decide what to keep, animate, and tear down. .id(\u{2026}) lets you control that identity explicitly.",
              symbol: "fingerprint"),
        .init(title: "Bumping id is a destructive reset.",
              detail: "Changing the id discards the view's @State, @StateObject, animation state, scroll position, focus, and gestures. Use it when you want a clean slate.",
              symbol: "arrow.counterclockwise"),
        .init(title: "Don't use .id to fix layout bugs.",
              detail: "Reaching for .id to 'force a refresh' usually masks an underlying issue with state ownership or invalidation. Diagnose first.",
              symbol: "exclamationmark.triangle"),
        .init(title: "ID type must be Hashable.",
              detail: "The signature is `func id<ID>(_ id: ID) -> some View where ID: Hashable`. Strings, UUIDs, ints, enums \u{2014} anything with reasonable Hashable semantics works.",
              symbol: "checkmark.seal"),
        .init(title: "Pairs with ScrollViewReader.",
              detail: ".id(\u{2026}) targets are addressable by ScrollViewReader.scrollTo(\u{2026}). This is the canonical way to scroll to a specific row.",
              symbol: "scroll")
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

private struct ResettableCounter: View {
    @State private var count = 0
    var body: some View {
        HStack(spacing: 12) {
            Text("count: \(count)")
                .font(.headline)
                .frame(minWidth: 100, alignment: .leading)
            Button("+1") { count += 1 }
        }
        .padding(8)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
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
    IDPage()
        .frame(width: 1100, height: 800)
}
