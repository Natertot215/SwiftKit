import SwiftUI

// SwiftUI dialogIcon reference page — bundles the View and Scene overloads:
// • View/dialogIcon(_:)
// • Scene/dialogIcon(_:)
// Source: Documentation/SwiftUI/modal-presentations/dialogicon(_:).md
// macOS 15.0+. Replaces the default app icon shown alongside the dialog text.

struct DialogIconPage: View {
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
            Text("View/dialogIcon(_:) + Scene/dialogIcon(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the icon used by alerts. On macOS this icon replaces the default app icon shown next to the alert text.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/dialogicon(_:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DISnippet(
            api: ".dialogIcon(Image(systemName: \"trash\"))",
            code: """
            Button("Delete items") { isShowingDialog = true }
                .alert(
                    "Are you sure you want to erase these items?",
                    isPresented: $isShowingDialog
                ) {
                    Button("Erase", role: .destructive) { … }
                    Button("Cancel", role: .cancel) { }
                }
                .dialogIcon(Image(systemName: "trash"))
            """,
            note: "View modifier form. Attaches a custom icon to the alert presented from this view."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Scene form — applies to AlertScene") {
                DISnippet(
                    api: "Scene/dialogIcon(_:)",
                    code: """
                    @main
                    struct MyApp: App {
                        @State private var isShowingDialog = false
                        var body: some Scene {
                            Window("Main", id: "main") {
                                Button("Delete items") { isShowingDialog = true }
                            }

                            AlertScene(
                                "Are you sure you want to erase these items?",
                                isPresented: $isShowingDialog
                            ) {
                                Button("Erase", role: .destructive) { … }
                                Button("Cancel", role: .cancel) { }
                            }
                            .dialogIcon(Image("Trash"))
                        }
                    }
                    """,
                    note: "Scene modifier form — required to set the icon on AlertScene presentations."
                )
            }

            VariantBlock(title: "Pass nil to revert to the app icon") {
                DISnippet(
                    api: ".dialogIcon(nil)",
                    code: """
                    .dialogIcon(nil)   // restores the default app icon
                    """,
                    note: "The icon parameter is Image? — nil means \"use the default app icon\"."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Both surfaces share the same signature") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout("func dialogIcon(_ icon: Image?) -> some View")
                    APICallout("func dialogIcon(_ icon: Image?) -> some Scene")
                }
            }
        }
    }

    private struct DINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DINote] = [
        .init(title: "macOS-only effect.",
              detail: "iOS / iPadOS alerts don't render an icon, so the modifier is a no-op there. macOS alerts always show an icon (defaults to the app icon).",
              symbol: "macwindow"),
        .init(title: "Image only — not Label or text.",
              detail: "The parameter is `Image?`. Provide a system image (`Image(systemName:)`), an asset image, or nil. Custom views aren't supported.",
              symbol: "photo"),
        .init(title: "Pair with .dialogSeverity for destructive context.",
              detail: "A custom icon plus `.dialogSeverity(.critical)` is the standard recipe for permanent-deletion confirmations.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Two surfaces — pick the right one.",
              detail: "Use the View modifier when the alert is presented from a view (.alert(_:isPresented:…)). Use the Scene modifier when targeting AlertScene at the App level.",
              symbol: "square.split.2x1")
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

private struct DISnippet: View {
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
    DialogIconPage()
        .frame(width: 1100, height: 800)
}
