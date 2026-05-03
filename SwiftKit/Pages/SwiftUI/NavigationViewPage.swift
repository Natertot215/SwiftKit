import SwiftUI

// SwiftUI `NavigationView` reference page.
// Source: Documentation/SwiftUI/navigation/navigationview.md
// macOS 10.15+ — DEPRECATED in 26.5 across all platforms.
// Replaced by NavigationStack (single-column push) and NavigationSplitView
// (two- or three-column sidebar/detail). NavigationView still compiles and
// renders, but new code should use the modern containers.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 300

private struct NVNote: Identifiable, Hashable {
    let title: String
    var id: String { title }
}

private let notesList: [NVNote] = [
    NVNote(title: "Groceries"),
    NVNote(title: "Project ideas"),
    NVNote(title: "Reading list")
]

struct NavigationViewPage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NavigationView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("DEPRECATED. A view for presenting a stack of views that represents a visible path in a navigation hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationview.md · macOS 10.15+ (deprecated 26.5)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "NavigationView { List { NavigationLink(\"…\", destination:) } }  // DEPRECATED") {
            NavigationView {
                List(notesList) { note in
                    NavigationLink(note.title, destination: noteDetail(note))
                }
                Text("Select a note")
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Modern equivalent — NavigationStack") {
                DemoCard(api: "NavigationStack { List { NavigationLink(_:value:) } .navigationDestination(for:) }") {
                    NavigationStack {
                        List(notesList) { note in
                            NavigationLink(note.title, value: note)
                        }
                        .navigationDestination(for: NVNote.self) { note in
                            noteDetail(note)
                        }
                    }
                }
            }

            VariantBlock(title: "Modern equivalent — NavigationSplitView (sidebar + detail)") {
                DemoCard(api: "NavigationSplitView { List(_:selection:) { … } } detail: { … }") {
                    NavigationSplitView {
                        List(notesList, id: \.id) { note in
                            Text(note.title)
                        }
                    } detail: {
                        Text("Detail")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("NavigationView is the legacy container; the modern primitives have separate state surfaces:")
                .font(.callout)
                .foregroundStyle(.secondary)
            VStack(alignment: .leading, spacing: 6) {
                APICallout("NavigationStack(path: $path) { … }                  // [Hashable] or NavigationPath")
                APICallout("NavigationSplitView(columnVisibility: $vis) { … }   // NavigationSplitViewVisibility")
                APICallout(".navigationDestination(for:) / (isPresented:) / (item:)  // routing")
            }
        }
    }

    private func noteDetail(_ note: NVNote) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Note body would render here.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    // MARK: Notes

    private struct NVPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NVPNote] = [
        .init(title: "DEPRECATED in macOS 26.5 / iOS 26.5 / iPadOS 26.5 / etc.",
              detail: "Apple has marked NavigationView deprecated across every platform as of the 26.5 SDK. New code should use NavigationStack for single-column push UIs and NavigationSplitView for sidebar/detail UIs.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Replacement table — single column → NavigationStack.",
              detail: "Anywhere you wrote `NavigationView { List { NavigationLink(_, destination:) } }` for a one-column drill-down, replace with NavigationStack and the value-based NavigationLink + .navigationDestination pattern.",
              symbol: "rectangle.stack"),
        .init(title: "Replacement table — multi-column → NavigationSplitView.",
              detail: "Anywhere you wrote `NavigationView { sidebarView; placeholderView }` to get the macOS / iPad sidebar + detail look, replace with `NavigationSplitView { sidebar } detail: { detail }` (or the three-column form).",
              symbol: "rectangle.split.3x1"),
        .init(title: "Migrating styles — .navigationViewStyle(_:) is deprecated too.",
              detail: "The companion `.navigationViewStyle(_:)` modifier and the `NavigationViewStyle` protocol are deprecated alongside NavigationView itself. NavigationStack has no style hook; NavigationSplitView uses .navigationSplitViewStyle(_:).",
              symbol: "paintbrush"),
        .init(title: "Why deprecate? Lazy destination construction + path-driven state.",
              detail: "The classic NavigationView built every NavigationLink destination eagerly and exposed no programmatic state surface. NavigationStack defers destination construction until the value-based link fires and offers Array / NavigationPath bindings for deep linking and persistence.",
              symbol: "checkmark.seal")
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

// MARK: - Page-local helpers

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
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
    NavigationViewPage()
        .frame(width: 1100, height: 800)
}
