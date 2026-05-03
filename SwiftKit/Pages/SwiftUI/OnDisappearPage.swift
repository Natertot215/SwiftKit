import SwiftUI

// SwiftUI `View.onDisappear(perform:)` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/ondisappear(perform:).md
// Live demo: toggleable subview that bumps a counter on disappear.

struct OnDisappearPage: View {
    @State private var subviewVisible = true
    @State private var disappearances = 0
    @State private var lastEvent = "(none)"

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
            Text("View.onDisappear(perform:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds an action to perform after this view disappears.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/ondisappear(perform:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Counter increments on disappear") {
            VStack(alignment: .leading, spacing: 12) {
                if subviewVisible {
                    Text("I will report when I disappear")
                        .padding(8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        .onAppear  { lastEvent = "appeared" }
                        .onDisappear {
                            disappearances += 1
                            lastEvent = "disappeared"
                        }
                }
                HStack(spacing: 12) {
                    Toggle("Mounted", isOn: $subviewVisible).toggleStyle(.switch)
                    Spacer()
                    Text("disappearances: \(disappearances)  \u{00b7}  last: \(lastEvent)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
            APICallout(".onDisappear { disappearances += 1 }")
            Text("Toggle Mounted off; the counter ticks. Toggle back on to mount again.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Tear down a resource") {
                snippet("""
                MetricsChart()
                    .onAppear   { metrics.startStreaming() }
                    .onDisappear { metrics.stopStreaming() }
                """)
                Text("Pair .onAppear / .onDisappear to set up and tear down a side-effecting subscription tied to view presence.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Optional handler") {
                snippet("""
                Text("Hi").onDisappear() // no-op
                Text("Hi").onDisappear(perform: nil) // explicit nil
                """)
                Text("Like .onAppear, the action defaults to nil and the bare call compiles.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Fires after removal, not before") {
                snippet("""
                if showDetail {
                    DetailView().onDisappear { saveDraft() }
                }
                """)
                Text("The closure fires after SwiftUI removes the view. Reads of the view's @State at that point reflect the final value.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: ".task auto-cancels \u{2014} no .onDisappear needed") {
                snippet("""
                List(rows) { Text($0.name) }
                    .task { for await update in stream { \u{2026} } }
                """)
                Text(".task cancels its async closure automatically when the view disappears. Use .onDisappear only for synchronous side effects.")
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
        .init(title: "Fires after the view is removed.",
              detail: "Runs as part of the removal that takes the view out of the rendered tree, just after SwiftUI stops drawing it.",
              symbol: "eye.slash"),
        .init(title: "Fires on every removal.",
              detail: "Toggling visibility, scrolling out of a List, popping a navigation destination \u{2014} all of these fire .onDisappear. Not one-shot.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: "Don't rely on it for cleanup of async work.",
              detail: ".task cancellation is the right primitive for cancelling in-flight async work. .onDisappear is for fire-and-forget tear-down of synchronous resources.",
              symbol: "clock"),
        .init(title: "Pairs with .onAppear.",
              detail: "Together, they bracket the view's presence. Subscriptions, observers, and resource locks tied to view lifetime go in this pair.",
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
    OnDisappearPage()
        .frame(width: 1100, height: 800)
}
