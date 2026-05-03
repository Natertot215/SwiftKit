import SwiftUI

// SwiftUI `View/fileDialogDefaultDirectory(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/filedialogdefaultdirectory(_:).md
// macOS 14.0+. Sets the directory the dialog opens to.

struct FileDialogDefaultDirectoryPage: View {
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
            Text("View/fileDialogDefaultDirectory(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the fileExporter / fileImporter / fileMover to open with the specified default directory.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/filedialogdefaultdirectory(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FDDSnippet(
            api: ".fileDialogDefaultDirectory(downloadsURL)",
            code: """
            let downloadsURL = FileManager.default.urls(
                for: .downloadsDirectory,
                in: .userDomainMask
            ).first

            Button("Import…") { isImporting = true }
                .fileImporter(
                    isPresented: $isImporting,
                    allowedContentTypes: [.image]
                ) { result in … }
                .fileDialogDefaultDirectory(downloadsURL)
            """,
            note: "Pick a sensible starting folder for the user's task."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Pass nil to use the system default") {
                FDDSnippet(
                    api: ".fileDialogDefaultDirectory(nil)",
                    code: """
                    .fileDialogDefaultDirectory(nil)
                    """,
                    note: "Reverts to the system-default directory (typically the user's home or last-used location)."
                )
            }

            VariantBlock(title: "Common starting folders") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".downloadsDirectory")
                    APICallout(".documentsDirectory")
                    APICallout(".picturesDirectory")
                    APICallout(".desktopDirectory")
                    APICallout("URL(fileURLWithPath: \"/some/specific/path\")")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                APICallout("func fileDialogDefaultDirectory(_ defaultDirectory: URL?) -> some View")
            }
        }
    }

    private struct FDDNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FDDNote] = [
        .init(title: "Customization ID overrides this after first use.",
              detail: "If the same view also has .fileDialogCustomizationID, the user's last directory wins on subsequent launches. The default directory only applies on the very first invocation.",
              symbol: "arrow.triangle.swap"),
        .init(title: "URL? — pass a file URL, not a path string.",
              detail: "Build with `URL(fileURLWithPath:)` or `FileManager.default.urls(for:in:)`. The dialog accepts only file URLs.",
              symbol: "link"),
        .init(title: "Sandbox: requires permission for the path.",
              detail: "On sandboxed apps, the default directory must be reachable — system-defined SearchPathDirectory values are safe; arbitrary paths require user-granted access.",
              symbol: "lock.shield"),
        .init(title: "Pair with .fileDialogCustomizationID.",
              detail: "Default directory + customization ID is the standard recipe: opens at a sensible default the FIRST time, then remembers wherever the user navigated to next time.",
              symbol: "rectangle.stack")
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

private struct FDDSnippet: View {
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
    FileDialogDefaultDirectoryPage()
        .frame(width: 1100, height: 800)
}
