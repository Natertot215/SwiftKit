import SwiftUI

// SwiftUI alert(isPresented:error:actions:[message:]) reference page.
// Bundles:
// • View/alert(isPresented:error:actions:)
// • View/alert(isPresented:error:actions:message:)
// Source: Documentation/SwiftUI/modal-presentations/alert(ispresented:error:actions:[message:]).md

private let demoFrameWidth: CGFloat = 420

struct AlertErrorPage: View {
    @State private var showAlert = false
    @State private var showAlertWithMessage = false
    @State private var error: AlertDemoError? = .init(
        errorDescription: "Network unavailable",
        recoverySuggestion: "Check your connection and try again."
    )

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
            Text("View/alert(isPresented:error:actions:[message:])")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents an alert when an error is present. The error's localized description becomes the title; recoverySuggestion (or your message closure) provides the body.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/alert(ispresented:error:actions:[message:]).md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".alert(isPresented: $showAlert, error: error) { Button(\"OK\") { } }") {
            Button("Trigger error alert") { showAlert = true }
                .buttonStyle(.borderedProminent)
                .alert(isPresented: $showAlert, error: error) {
                    Button("OK") { }
                }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With message — alert(isPresented:error:actions:message:)") {
                DemoCard(api: ".alert(isPresented:error:actions:message:) — message receives the error") {
                    Button("Trigger with message") { showAlertWithMessage = true }
                        .alert(isPresented: $showAlertWithMessage, error: error) { _ in
                            Button("Retry") { }
                            Button("Cancel", role: .cancel) { }
                        } message: { error in
                            if let recovery = error.recoverySuggestion {
                                Text(recovery)
                            } else {
                                Text("An unknown error occurred.")
                            }
                        }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "errorDescription becomes the title") {
                Text("This overload generates the title from `error.errorDescription`. Conform your custom Error type to LocalizedError and provide errorDescription / recoverySuggestion / failureReason / helpAnchor.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                APICallout("protocol LocalizedError: Error { var errorDescription: String? { get } … }")
            }
        }
    }

    private struct ErrorAlertNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ErrorAlertNote] = [
        .init(title: "Error must conform to LocalizedError.",
              detail: "The framework reads `errorDescription`, `recoverySuggestion`, and friends to populate the alert. Plain Swift errors won't surface meaningful text.",
              symbol: "exclamationmark.bubble"),
        .init(title: "Both isPresented and error must be valid.",
              detail: "If `error` is nil the alert does not appear regardless of isPresented. The closure body always receives a non-nil error.",
              symbol: "and.circle"),
        .init(title: "Title is generated — don't pass one.",
              detail: "Unlike the other .alert overloads, this one omits the title parameter. Inject the title via your error's errorDescription instead.",
              symbol: "textformat.size")
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

private struct AlertDemoError: LocalizedError {
    let errorDescription: String?
    let recoverySuggestion: String?
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
    AlertErrorPage()
        .frame(width: 1100, height: 800)
}
