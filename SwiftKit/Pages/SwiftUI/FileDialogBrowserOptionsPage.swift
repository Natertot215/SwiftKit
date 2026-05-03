import SwiftUI

// SwiftUI fileDialogBrowserOptions reference page — bundles two symbols:
// • View/fileDialogBrowserOptions(_:)
// • FileDialogBrowserOptions (OptionSet: .displayFileExtensions .enumeratePackages .includeHiddenFiles)
// Source: Documentation/SwiftUI/modal-presentations/filedialogbrowseroptions(_:).md +
//         filedialogbrowseroptions.md
// macOS 14.0+. Configures how file dialogs present the file system.

struct FileDialogBrowserOptionsPage: View {
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
            Text("View/fileDialogBrowserOptions(_:) + FileDialogBrowserOptions")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures how the file dialog browses the file system. OptionSet with three flags: showing extensions, treating packages as folders, and showing hidden files.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/filedialogbrowseroptions.md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FDBSnippet(
            api: ".fileDialogBrowserOptions([.displayFileExtensions, .includeHiddenFiles])",
            code: """
            .fileImporter(
                isPresented: $isImporting,
                allowedContentTypes: [.image]
            ) { result in … }
            .fileDialogBrowserOptions([.displayFileExtensions, .includeHiddenFiles])
            """,
            note: "Combine flags via the OptionSet array literal. Attach to the same view as the file dialog."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "FileDialogBrowserOptions members") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".displayFileExtensions — show .png / .jpg etc. in the file list")
                    APICallout(".enumeratePackages — descend into .app / .photoslibrary etc. as folders")
                    APICallout(".includeHiddenFiles — show files starting with .")
                }
            }

            VariantBlock(title: "Composed with array literal") {
                FDBSnippet(
                    api: ".fileDialogBrowserOptions([.displayFileExtensions, .enumeratePackages])",
                    code: """
                    .fileDialogBrowserOptions([
                        .displayFileExtensions,
                        .enumeratePackages
                    ])
                    """,
                    note: "OptionSet conforms to ExpressibleByArrayLiteral, so array syntax composes the flags."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Conformances") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout("OptionSet, RawRepresentable, ExpressibleByArrayLiteral")
                    APICallout("Equatable, Sendable")
                }
            }
        }
    }

    private struct FDBNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FDBNote] = [
        .init(title: "macOS-only effect.",
              detail: "These flags map to NSOpenPanel / NSSavePanel options. iOS document pickers ignore them.",
              symbol: "macwindow"),
        .init(title: ".enumeratePackages turns bundles into folders.",
              detail: "Without this, the dialog treats .app and other UTType.package types as opaque files. With it, users can drill into them.",
              symbol: "shippingbox"),
        .init(title: ".includeHiddenFiles overrides the default.",
              detail: "Files like .git, .DS_Store, etc. are hidden by default. Use only when your import target genuinely needs them (e.g. dotfile editor).",
              symbol: "eye.slash"),
        .init(title: "OptionSet — combine with array literals.",
              detail: "Pass [] for none, or array literals for combinations. Use [.displayFileExtensions] over .displayFileExtensions to keep the option-set semantics clear.",
              symbol: "list.bullet")
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

private struct FDBSnippet: View {
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
    FileDialogBrowserOptionsPage()
        .frame(width: 1100, height: 800)
}
