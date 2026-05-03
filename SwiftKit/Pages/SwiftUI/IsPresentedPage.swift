import SwiftUI

// SwiftUI `EnvironmentValues/isPresented` reference page.
// Source: Documentation/SwiftUI/modal-presentations/ispresented.md
// macOS 12.0+. Read-only Bool that indicates whether the enclosing presentation is currently showing.

private let demoFrameWidth: CGFloat = 480

struct IsPresentedPage: View {
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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("EnvironmentValues/isPresented")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A Boolean value that indicates whether the view associated with this environment is currently presented.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/ispresented.md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "@Environment(\\.isPresented) private var isPresented") {
            VStack(alignment: .leading, spacing: 8) {
                Button("Open sheet") { showSheet = true }
                    .buttonStyle(.borderedProminent)
                Text("Sheet body reads `\\.isPresented` from the environment to know it's currently in a sheet — useful for one-time setup work.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .sheet(isPresented: $showSheet) {
                IsPresentedSheetBody()
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Read on a value change with .onChange") {
                IPSnippet(
                    api: ".onChange(of: isPresented) { _, isPresented in … }",
                    code: """
                    @Environment(\\.isPresented) private var isPresented

                    var body: some View {
                        SettingsView()
                            .onChange(of: isPresented) { _, isPresented in
                                if isPresented {
                                    // First-presentation work — runs once,
                                    // not on every re-appear.
                                }
                            }
                    }
                    """,
                    note: "isPresented changes ONCE when the view becomes presented; .onAppear can fire repeatedly on navigation back."
                )
            }

            VariantBlock(title: "Difference from .onAppear") {
                IPSnippet(
                    api: "Compare with .onAppear",
                    code: """
                    // .onAppear: fires every time the view appears,
                    //            including navigations BACK to it.
                    .onAppear { … }

                    // isPresented .onChange: fires only when the view's
                    //            presentation status changes.
                    @Environment(\\.isPresented) private var isPresented
                    .onChange(of: isPresented) { _, p in
                        if p { /* presented for the first time */ }
                    }
                    """,
                    note: "Per Apple: \"This behaves differently than View/onAppear(perform:), which SwiftUI can call more than once for a given presentation.\""
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Read-only — no setter") {
                IPSnippet(
                    api: "var isPresented: Bool { get }",
                    code: """
                    @Environment(\\.isPresented) private var isPresented
                    // Read it. To DISMISS programmatically, use \\.dismiss.
                    @Environment(\\.dismiss) private var dismiss
                    """,
                    note: "isPresented is read-only. To dismiss, use \\.dismiss — calling dismiss() is what flips isPresented back to false."
                )
            }
        }
    }

    private struct IPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [IPNote] = [
        .init(title: "Read with @Environment(\\.isPresented).",
              detail: "Always include the keypath. Don't try to construct the value yourself — it's set by the framework based on the parent presentation context.",
              symbol: "envelope"),
        .init(title: "Defaults to false outside any presentation.",
              detail: "If you read \\.isPresented from a view that isn't inside a sheet/popover/inspector, the value is false. Use it as a 'am I in a sheet right now?' check.",
              symbol: "questionmark.circle"),
        .init(title: "Pair with \\.dismiss for write access.",
              detail: "isPresented reads the state; dismiss() changes it. To dismiss the current presentation: `@Environment(\\.dismiss) private var dismiss; Button(\"Done\") { dismiss() }`.",
              symbol: "xmark.circle"),
        .init(title: "Use .onChange(of:) for first-presentation work.",
              detail: "Apple's recommended pattern: observe isPresented with .onChange to trigger setup that should fire ONCE per presentation, not every time the view re-appears.",
              symbol: "play.circle")
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

private struct IsPresentedSheetBody: View {
    @Environment(\.isPresented) private var isPresented
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text("isPresented = \(String(describing: isPresented))")
                .font(.title3)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
            Text("Read inside the sheet body — the framework sets it to true while this sheet is showing.")
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button("Dismiss") { dismiss() }
                .keyboardShortcut(.defaultAction)
        }
        .padding(32)
        .frame(minWidth: 360, minHeight: 220)
    }
}

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, alignment: .leading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct IPSnippet: View {
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
                Text(note).font(.footnote).foregroundStyle(.secondary)
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

#Preview {
    IsPresentedPage()
        .frame(width: 1100, height: 800)
}
