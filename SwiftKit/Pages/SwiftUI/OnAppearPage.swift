import SwiftUI

// SwiftUI `View.onAppear(perform:)` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/onappear(perform:).md
// Live demo: a counter that increments each time the demo view appears.

struct OnAppearPage: View {
    @State private var appearances = 0
    @State private var subviewVisible = true
    @State private var loadedRows: [String] = []

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
            Text("View.onAppear(perform:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds an action to perform before this view appears.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/onappear(perform:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Counter increments on appear") {
            VStack(alignment: .leading, spacing: 12) {
                if subviewVisible {
                    Text("I appeared")
                        .padding(8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        .onAppear { appearances += 1 }
                }
                HStack(spacing: 12) {
                    Toggle("Mounted", isOn: $subviewVisible).toggleStyle(.switch)
                    Spacer()
                    Text("appearances: \(appearances)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
            APICallout(".onAppear { appearances += 1 }")
            Text("Toggle Mounted off and on; the counter increments each time the subview is inserted into the hierarchy.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Kick off a load") {
                VStack(alignment: .leading, spacing: 8) {
                    if loadedRows.isEmpty {
                        Text("(no rows yet)").foregroundStyle(.secondary).font(.caption)
                    } else {
                        ForEach(loadedRows, id: \.self) { Text($0) }
                    }
                    HStack {
                        Button("Reset") { loadedRows = [] }
                        Button("Load") {
                            loadedRows = ["Pacific", "Atlantic", "Indian"]
                        }
                    }
                }
                APICallout(".onAppear { loadedRows = fetchRows() }")
                Text("Common pattern: trigger initial data load when the view first appears. Modern code prefers .task { await load() } for async work.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Optional handler") {
                snippet("""
                Text("Hello").onAppear() // no-op overload
                Text("Hi").onAppear(perform: nil) // explicitly nil
                """)
                Text("The action parameter has a default of nil, so .onAppear() compiles. It's a no-op there \u{2014} useful for keeping a placeholder where logic might be added later.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Re-fires every time the view re-mounts") {
                snippet("""
                if isVisible {
                    SomeView().onAppear { count += 1 } // fires on each insertion
                }
                """)
                Text("If a view leaves the hierarchy and re-enters (toggled by an if, removed from a List, etc.), .onAppear fires again. It is not a one-time-only hook.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Prefer .task for async work") {
                snippet("""
                List(rows) { Text($0.name) }
                    .task { rows = await fetchRows() }
                """)
                Text(".task gives you structured concurrency, automatic cancellation when the view disappears, and an async closure. Use .onAppear for synchronous side effects.")
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
        .init(title: "Fires before the view becomes visible.",
              detail: "The action runs as part of the insertion that brings the view into the rendered tree, just before SwiftUI draws it for the first time.",
              symbol: "eye"),
        .init(title: "Fires on every insertion, not just the first.",
              detail: "If the view is removed from the hierarchy and added again (conditionals, list scrolling, navigation pushes), .onAppear fires each time. Not a one-shot.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: "Prefer .task for async + cancellation.",
              detail: "For async/await work that should be cancelled when the view disappears, use .task. .onAppear is the right tool for synchronous fire-and-forget side effects.",
              symbol: "clock"),
        .init(title: "Don't use .onAppear for one-time setup.",
              detail: "View 're-mount' is unpredictable. For genuinely once-per-app initialization, hoist the work into your App init or a @MainActor singleton.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Pairs with .onDisappear.",
              detail: ".onAppear / .onDisappear bookend the view's lifetime in the tree. Use the pair to set up and tear down resources tied to that view's presence.",
              symbol: "rectangle.dashed.and.paperclip")
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
    OnAppearPage()
        .frame(width: 1100, height: 800)
}
