import SwiftUI

// SwiftUI `View/fileDialogURLEnabled(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/filedialogurlenabled(_:).md
// macOS 14.0+. Conditionally disables specific URLs in the dialog.

struct FileDialogURLEnabledPage: View {
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
            Text("View/fileDialogURLEnabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the fileImporter / fileMover to conditionally disable presented URLs based on a Predicate. Use it to grey-out files that don't match an additional rule the contentTypes filter can't express.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/filedialogurlenabled(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FUSnippet(
            api: ".fileDialogURLEnabled(#Predicate { $0.lastPathComponent.hasPrefix(\"DRAFT-\") })",
            code: """
            Button("Open draft") { isImporting = true }
                .fileImporter(
                    isPresented: $isImporting,
                    allowedContentTypes: [.text]
                ) { result in … }
                .fileDialogURLEnabled(
                    #Predicate { url in
                        url.lastPathComponent.hasPrefix("DRAFT-")
                    }
                )
            """,
            note: "Only files whose names start with \"DRAFT-\" remain selectable. Apple's docs warn the predicate must be CONSTANT-time — don't read file contents."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Common predicates") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout("#Predicate { $0.pathExtension == \"swift\" }")
                    APICallout("#Predicate { !$0.lastPathComponent.hasPrefix(\".\") }")
                    APICallout("#Predicate { $0.path.contains(\"/Active/\") }")
                }
                Text("Apple-recommended scope: inspect the path or filename only — the predicate must be constant-time and avoid filesystem access.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                APICallout("func fileDialogURLEnabled(_ predicate: Predicate<URL>) -> some View")
            }
        }
    }

    private struct FUNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FUNote] = [
        .init(title: "Predicate, not closure.",
              detail: "The parameter is the new Foundation Predicate<URL> type. Build it with the #Predicate macro.",
              symbol: "function"),
        .init(title: "Constant-time only.",
              detail: "The predicate runs for every visible URL during folder browsing. Apple explicitly says don't access file contents or expensive metadata. Inspect the path / filename / extension only.",
              symbol: "speedometer"),
        .init(title: "Filter, don't replace contentTypes.",
              detail: "Use .allowedContentTypes for the broad type filter (\"any image\"). Use .fileDialogURLEnabled to layer additional rules (\"…that lives under /Brand/\").",
              symbol: "line.3.horizontal.decrease.circle"),
        .init(title: "Disabled vs hidden.",
              detail: "Disabled URLs remain VISIBLE but greyed out and unselectable. To hide files entirely, no SwiftUI modifier exists — set up a custom UTType or use AppKit's NSOpenPanel directly.",
              symbol: "eye.slash"),
        .init(title: "macOS-only.",
              detail: "iOS document pickers don't support per-URL predicates.",
              symbol: "macwindow")
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

private struct FUSnippet: View {
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
    FileDialogURLEnabledPage()
        .frame(width: 1100, height: 800)
}
