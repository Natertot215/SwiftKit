import SwiftUI

// SwiftUI fileMover reference page — bundles all four overloads:
// • View/fileMover(isPresented:file:onCompletion:)
// • View/fileMover(isPresented:file:onCompletion:onCancellation:)
// • View/fileMover(isPresented:files:onCompletion:)
// • View/fileMover(isPresented:files:onCompletion:onCancellation:)
// Source: Documentation/SwiftUI/modal-presentations/filemover(*).md
// macOS 11.0+. Single-file and multi-file forms, each with optional onCancellation.

private let demoFrameWidth: CGFloat = 480

struct FileMoverPage: View {
    @State private var isShowing = false

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
            Text("View/fileMover(…) — four overloads")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a system interface for moving an existing file (or files) to a new on-disk location.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/filemover(*).md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".fileMover(isPresented: $isShowing, file: url) { result in … }") {
            HStack(spacing: 12) {
                Button("Toggle mover flag") { isShowing.toggle() }
                    .buttonStyle(.borderedProminent)
                Text("isShowing = \(String(describing: isShowing))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            Text("Demo trigger only flips the flag; it does NOT open a real file panel. See snippets for production form.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "1. Single file — fileMover(isPresented:file:onCompletion:)") {
                FMSnippet(
                    api: "fileMover(isPresented:file:onCompletion:)",
                    code: """
                    .fileMover(
                        isPresented: $isMoving,
                        file: sourceURL
                    ) { result in
                        switch result {
                        case .success(let newURL):
                            let didStart = newURL.startAccessingSecurityScopedResource()
                            defer { if didStart { newURL.stopAccessingSecurityScopedResource() } }
                            // Track the new location…
                        case .failure(let error):
                            print("Move failed: \\(error)")
                        }
                    }
                    """,
                    note: "Returned URLs are security-scoped — wrap reads in start/stop accessing."
                )
            }

            VariantBlock(title: "2. Single file + onCancellation") {
                FMSnippet(
                    api: "fileMover(isPresented:file:onCompletion:onCancellation:)",
                    code: """
                    .fileMover(
                        isPresented: $isMoving,
                        file: sourceURL,
                        onCompletion: { result in … },
                        onCancellation: { print("User cancelled") }
                    )
                    """,
                    note: "onCancellation runs when the user dismisses without selecting a destination."
                )
            }

            VariantBlock(title: "3. Multiple files — fileMover(isPresented:files:onCompletion:)") {
                FMSnippet(
                    api: "fileMover(isPresented:files:onCompletion:)",
                    code: """
                    .fileMover(
                        isPresented: $isMoving,
                        files: [url1, url2, url3]
                    ) { result in
                        switch result {
                        case .success(let urls): /* new locations */
                        case .failure(let error): print(error)
                        }
                    }
                    """,
                    note: "Multi-file form opens a folder picker; the framework moves each into the chosen folder."
                )
            }

            VariantBlock(title: "4. Multiple files + onCancellation") {
                FMSnippet(
                    api: "fileMover(isPresented:files:onCompletion:onCancellation:)",
                    code: """
                    .fileMover(
                        isPresented: $isMoving,
                        files: urls,
                        onCompletion: { … },
                        onCancellation: { … }
                    )
                    """,
                    note: "Multi-file with cancellation handler."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Two-state contract") {
                Text("The panel appears only when isPresented is true AND the file/files binding is non-nil. After completion or cancellation, isPresented flips back to false BEFORE the closures run.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct FMNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FMNote] = [
        .init(title: "Move ≠ Copy.",
              detail: "fileMover relocates the file to the new path; the original location is removed. If you need to keep a copy at the original location, use FileManager.copyItem before showing the mover.",
              symbol: "arrow.right.doc"),
        .init(title: "URLs are security-scoped.",
              detail: "Same contract as fileImporter / fileExporter: call startAccessingSecurityScopedResource() before reading the new URL.",
              symbol: "lock.shield"),
        .init(title: "Handle the failure case.",
              detail: "Disk-full, permission-denied, and target-already-exists all surface as Result.failure. Propagate or display them — silently swallowing the error confuses users.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Customize panel chrome with .fileDialog* modifiers.",
              detail: ".fileDialogConfirmationLabel / .fileDialogDefaultDirectory / .fileDialogMessage / .fileDialogCustomizationID / .fileDialogBrowserOptions all attach to the same view as fileMover.",
              symbol: "slider.horizontal.3")
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

private struct FMSnippet: View {
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
    FileMoverPage()
        .frame(width: 1100, height: 800)
}
