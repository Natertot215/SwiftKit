import SwiftUI

// SwiftUI alert reference page — bundles the data-presenting overloads:
// • View/alert(_:isPresented:presenting:actions:)
// • View/alert(_:isPresented:presenting:actions:message:)
// Source: Documentation/SwiftUI/modal-presentations/alert(_:ispresented:presenting:actions:[message:]).md

private let demoFrameWidth: CGFloat = 420

struct AlertPresentingPage: View {
    @State private var didError = false
    @State private var didErrorMessage = false
    @State private var details: AlertSaveDetails?

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
            Text("View/alert(_:isPresented:presenting:actions:[message:])")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents an alert using the given data to produce the alert's content. Bundles the with-message and without-message overloads.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/alert(_:ispresented:presenting:actions:[message:]).md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".alert(\"Save failed.\", isPresented: $didError, presenting: details) { details in Button(role: .destructive) { } label: { Text(\"Delete \\(details.name)\") } }") {
            VStack(alignment: .leading, spacing: 8) {
                Button("Trigger save error") {
                    details = .init(name: "Mockup.psd", error: "Permission denied")
                    didError = true
                }
                .buttonStyle(.borderedProminent)
                Text("details = \(details?.name ?? "nil")")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            .alert("Save failed.", isPresented: $didError, presenting: details) { details in
                Button(role: .destructive) {
                    // Handle deletion.
                } label: {
                    Text("Delete \(details.name)")
                }
                Button("Retry") { }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With message — alert(_:isPresented:presenting:actions:message:)") {
                DemoCard(api: ".alert(_:isPresented:presenting:actions:message:) — message receives the same data") {
                    Button("Trigger with message") {
                        details = .init(name: "Mockup.psd", error: "Disk full")
                        didErrorMessage = true
                    }
                    .alert("Save failed.", isPresented: $didErrorMessage, presenting: details) { details in
                        Button("Retry") { }
                        Button("Cancel", role: .cancel) { }
                    } message: { details in
                        Text("Could not save \(details.name): \(details.error)")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Two-state contract — both must be valid") {
                Text("The alert appears only when `isPresented` is true AND the `presenting` value is non-nil. Mutating the presented data after the alert appears is ignored — the alert closes over the snapshot at presentation time.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct PresentingNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PresentingNote] = [
        .init(title: "Both isPresented and data must be valid.",
              detail: "Even with `isPresented = true`, no alert appears if `presenting` is nil. This makes the API safe — the closure never receives nil.",
              symbol: "and.circle"),
        .init(title: "Data is captured at presentation time.",
              detail: "Changes to the presented value while the alert is on screen are NOT reflected. To update an open alert, dismiss + re-present with new data.",
              symbol: "snowflake"),
        .init(title: "Use this overload to render dynamic action labels.",
              detail: "When action labels need to interpolate the data (e.g. \"Delete Mockup.psd\"), this overload is cleaner than .alert(_:isPresented:) + closure capture.",
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

private struct AlertSaveDetails {
    let name: String
    let error: String
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
    AlertPresentingPage()
        .frame(width: 1100, height: 800)
}
