import SwiftUI

// SwiftUI `View/fileDialogImportsUnresolvedAliases(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/filedialogimportsunresolvedaliases(_:).md
// macOS 14.0+. Controls whether file dialogs return alias URLs as-is (unresolved) or resolved.

struct FileDialogImportsUnresolvedAliasesPage: View {
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
            Text("View/fileDialogImportsUnresolvedAliases(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the file dialog behavior when a user chooses an alias. Default: aliases are resolved to their target. Set to true to receive the alias URL itself.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/filedialogimportsunresolvedaliases(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FUASnippet(
            api: ".fileDialogImportsUnresolvedAliases(true)",
            code: """
            Button("Pick alias") { isImporting = true }
                .fileImporter(
                    isPresented: $isImporting,
                    allowedContentTypes: [.aliasFile, .data]
                ) { result in
                    // result.success returns the alias URL itself, NOT
                    // its target.
                }
                .fileDialogImportsUnresolvedAliases(true)
            """,
            note: "Pass true when you specifically want to handle alias files (e.g. an alias-management tool). Pass false (default) for normal file workflows."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Default behavior — false") {
                FUASnippet(
                    api: ".fileDialogImportsUnresolvedAliases(false)",
                    code: """
                    .fileDialogImportsUnresolvedAliases(false) // explicit default
                    """,
                    note: "Explicit default: aliases resolve to their target's URL before the closure runs."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                APICallout("func fileDialogImportsUnresolvedAliases(_ imports: Bool) -> some View")
            }
        }
    }

    private struct FUANote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FUANote] = [
        .init(title: "macOS-only behavior.",
              detail: "Aliases are a macOS file system concept. iOS and other platforms ignore this modifier.",
              symbol: "macwindow"),
        .init(title: "Default true → resolve.",
              detail: "Per Apple's docs, the system resolves aliases by default. Pass `true` only when your app needs the alias URL itself rather than the target.",
              symbol: "arrow.right.circle"),
        .init(title: "Use for alias-aware tools.",
              detail: "Backup utilities, alias managers, and workflow apps that operate on aliases as first-class objects need the unresolved URL. Most apps want the default.",
              symbol: "link"),
        .init(title: "Doesn't apply to symlinks.",
              detail: "macOS aliases are a different mechanism from POSIX symlinks. This modifier specifically governs Finder-style aliases (.alias files), not symlinks.",
              symbol: "info.circle")
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

private struct FUASnippet: View {
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
    FileDialogImportsUnresolvedAliasesPage()
        .frame(width: 1100, height: 800)
}
