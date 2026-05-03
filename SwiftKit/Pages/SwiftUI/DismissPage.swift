import SwiftUI

// SwiftUI dismiss surface reference page.
// Sources:
//   Documentation/SwiftUI/windows/dismiss.md            (environment property)
//   Documentation/SwiftUI/windows/dismissaction.md      (DismissAction struct)
//   Documentation/SwiftUI/windows/dismissbehavior.md    (DismissBehavior, .interactive / .destructive)
// macOS 12.0+ for dismiss; macOS 14.0+ for DismissBehavior.
// dismiss closes whatever presentation context surrounds the caller.

struct DismissPage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showSheet = false

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
            Text("EnvironmentValues/dismiss")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A DismissAction in the environment that dismisses the current presentation \u{2014} sheet, popover, NavigationStack push, or window.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/dismiss.md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button("Show Sheet") {
                showSheet = true
            }
            .buttonStyle(.bordered)
            .sheet(isPresented: $showSheet) {
                SheetContents()
                    .frame(width: 320, height: 200)
            }
            APICallout("dismiss() inside the sheet \u{2014} reads @Environment(\\.dismiss)")
            Text("Live demo \u{2014} present a sheet, then tap Done. The sheet's Done button calls dismiss() from its own environment to close itself.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Inside a sheet \u{2014} closes the sheet") {
                WindowSnippet(
                    api: "dismiss() inside the sheet's content closure",
                    code: """
                    private struct SheetContents: View {
                        @Environment(\\.dismiss) private var dismiss
                        var body: some View {
                            Button("Done") { dismiss() }
                        }
                    }

                    .sheet(isPresented: $isShown) {
                        SheetContents()
                    }
                    """,
                    note: "The action's effect is determined by the environment it's read from \u{2014} read it inside the sheet, not in the presenting view."
                )
            }

            VariantBlock(title: "Inside a NavigationStack \u{2014} pops the current view") {
                WindowSnippet(
                    api: "dismiss() pops one entry off the stack",
                    code: """
                    NavigationStack {
                        NavigationLink("Detail") {
                            DetailView()
                        }
                    }

                    struct DetailView: View {
                        @Environment(\\.dismiss) private var dismiss
                        var body: some View {
                            Button("Back") { dismiss() }
                        }
                    }
                    """,
                    note: "Same action; different effect by virtue of where it's read."
                )
            }

            VariantBlock(title: "At a window's root \u{2014} closes the window") {
                WindowSnippet(
                    api: "dismiss() at the window root closes the window",
                    code: """
                    struct AccountDetail: View {
                        @Environment(\\.dismiss) private var dismiss
                        var body: some View {
                            Button("Dismiss") { dismiss() }
                        }
                    }
                    """,
                    note: "When read directly from a window's root view, dismiss() closes the window. Apple recommends DismissWindowAction for this case (more specific, harder to misroute)."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "DismissBehavior \u{2014} forcing past blocking modals (macOS 14+)") {
                WindowSnippet(
                    api: "withTransaction(\\.dismissBehavior, .destructive) { dismissWindow(\u{2026}) }",
                    code: """
                    struct DismissWindowButton: View {
                        @Environment(\\.dismissWindow) private var dismissWindow
                        var body: some View {
                            Button("Close Auxiliary Window") {
                                withTransaction(\\.dismissBehavior, .destructive) {
                                    dismissWindow(id: "auxiliary")
                                }
                            }
                        }
                    }
                    """,
                    note: "DismissBehavior has two values: .interactive (default \u{2014} respects modal dismissal blocks) and .destructive (closes anyway). Wrap the call in withTransaction to scope the choice."
                )
            }

            VariantBlock(title: "What dismiss() does NOT do") {
                BehaviorList(items: [
                    "Has no effect on a view that isn't currently presented \u{2014} no-op.",
                    "Doesn't close the parent window if you're inside a sheet/popover \u{2014} dismisses the modal first.",
                    "Doesn't navigate \u{2014} use NavigationLink for forward, NavigationPath for programmatic push.",
                    "Doesn't invoke onDismiss closures \u{2014} those fire from the .sheet(\u{2026}, onDismiss:) closure regardless of how the sheet was dismissed."
                ])
            }
        }
    }

    // MARK: Notes

    private struct DNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DNote] = [
        .init(title: "DismissAction.callAsFunction() \u{2014} that's the whole API.",
              detail: "DismissAction has exactly one method: callAsFunction(). The action figures out what to dismiss based on the environment it was read from.",
              symbol: "function"),
        .init(title: "Read dismiss in the environment that owns the presentation.",
              detail: "If you declare @Environment(\\.dismiss) on the presenting view and call it from inside the .sheet(\u{2026}) closure, you'll dismiss the presenting view's parent context, not the sheet. Read dismiss inside the sheet content type itself.",
              symbol: "scope"),
        .init(title: "Prefer DismissWindowAction for window dismissal.",
              detail: "Per Apple's note: while dismiss() can close a window, dismissWindow is the purpose-built action and disambiguates intent. Reach for plain dismiss only when the same site might also be inside a sheet/stack.",
              symbol: "rectangle.portrait.and.arrow.right"),
        .init(title: "DismissBehavior has two values.",
              detail: ".interactive (default) respects modal dismissal blocks like .interactiveDismissDisabled. .destructive forces the dismiss through.",
              symbol: "switch.2"),
        .init(title: "Pair with @Environment(\\.isPresented) when you need to query state.",
              detail: "isPresented tells you whether the surrounding presentation is currently active. Useful for guarding work that should only happen when the presentation is live.",
              symbol: "questionmark.circle")
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

// MARK: - Page-local sheet contents (live demo)

private struct SheetContents: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text("Sheet contents")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("This sheet's Done button calls dismiss() from its own environment.")
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button("Done") { dismiss() }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

// MARK: - Reusable demo helpers (page-local)

private struct WindowSnippet: View {
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

private struct BehaviorList: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                Label {
                    Text(item)
                        .font(.callout)
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.tint)
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

#Preview {
    DismissPage()
        .frame(width: 1100, height: 800)
}
