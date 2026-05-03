import SwiftUI

// SwiftUI confirmationDialog reference page — bundles the data-presenting overloads:
// • View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:)
// • View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)
// Source: Documentation/SwiftUI/modal-presentations/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:[message:]).md

private let demoFrameWidth: CGFloat = 420

struct ConfirmationDialogPresentingPage: View {
    @State private var isConfirming = false
    @State private var isConfirmingMessage = false
    @State private var detail: ConfirmFileDetail?

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
            Text("View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:[message:])")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a confirmation dialog using data to produce the dialog's content. Bundles the with-message and without-message overloads.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:[message:]).md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".confirmationDialog(\"Import New File?\", isPresented: $isConfirming, presenting: detail) { detail in Button(\"Import \\(detail.name)\") { } }") {
            Button("Import file…") {
                detail = .init(name: "MyImageFile.png", fileType: "png")
                isConfirming = true
            }
            .buttonStyle(.borderedProminent)
            .confirmationDialog(
                "Import New File?",
                isPresented: $isConfirming,
                presenting: detail
            ) { detail in
                Button("Import \(detail.name)") { }
                Button("Cancel", role: .cancel) { }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With message — closure receives the same data") {
                DemoCard(api: ".confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)") {
                    Button("Import with message") {
                        detail = .init(name: "MyImageFile.png", fileType: "png")
                        isConfirmingMessage = true
                    }
                    .confirmationDialog(
                        "Import New File?",
                        isPresented: $isConfirmingMessage,
                        titleVisibility: .visible,
                        presenting: detail
                    ) { detail in
                        Button("Import \(detail.name)") { }
                        Button("Cancel", role: .cancel) { }
                    } message: { detail in
                        Text("File type: \(detail.fileType)")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Two-state contract — both must be valid") {
                Text("The dialog appears only when isPresented is true AND presenting is non-nil. The presented value is captured at presentation time; mutating it while the dialog is open is ignored.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct CDPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CDPNote] = [
        .init(title: "Captures presented data at present-time.",
              detail: "Same contract as .alert(_:isPresented:presenting:): mutating the model while the dialog is open is ignored.",
              symbol: "snowflake"),
        .init(title: "Use when action labels need the model.",
              detail: "Renders dynamic labels like \"Import MyImageFile.png\" without closure-capture bugs that crop up with .confirmationDialog(_:isPresented:) + a separate optional state.",
              symbol: "text.cursor")
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

private struct ConfirmFileDetail {
    let name: String
    let fileType: String
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
    ConfirmationDialogPresentingPage()
        .frame(width: 1100, height: 800)
}
