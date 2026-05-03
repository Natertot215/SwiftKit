import SwiftUI

// SwiftUI alert reference page — bundles two overloads:
// • View/alert(_:isPresented:actions:)
// • View/alert(_:isPresented:actions:message:)
// Source: Documentation/SwiftUI/modal-presentations/alert(_:ispresented:actions:).md
//         Documentation/SwiftUI/modal-presentations/alert(_:ispresented:actions:message:).md

private let demoFrameWidth: CGFloat = 420

struct AlertIsPresentedPage: View {
    @State private var didFail = false
    @State private var didFailWithMessage = false
    @State private var destructive = false
    @State private var loginAcknowledged = "—"

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
            Text("View/alert(_:isPresented:actions:[message:])")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents an alert when a given condition is true. Bundles the two overloads: with and without a message body.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/alert(_:ispresented:actions:[message:]).md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".alert(\"Login failed.\", isPresented: $didFail) { Button(\"OK\") { … } }") {
            VStack(alignment: .leading, spacing: 8) {
                Button("Trigger alert") { didFail = true }
                    .buttonStyle(.borderedProminent)
                Text("Last acknowledgement: \(loginAcknowledged)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .alert("Login failed.", isPresented: $didFail) {
                Button("OK") {
                    loginAcknowledged = "OK pressed"
                }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With message — alert(_:isPresented:actions:message:)") {
                DemoCard(api: ".alert(\"Login failed.\", isPresented: $didFailWithMessage) { Button(\"OK\") {} } message: { Text(\"Please check your credentials and try again.\") }") {
                    Button("Trigger alert + message") { didFailWithMessage = true }
                        .alert("Login failed.", isPresented: $didFailWithMessage) {
                            Button("OK") { }
                        } message: {
                            Text("Please check your credentials and try again.")
                        }
                }
            }

            VariantBlock(title: "Destructive + cancel roles") {
                DemoCard(api: "Button(\"Delete\", role: .destructive) { … }; Button(\"Cancel\", role: .cancel) {}") {
                    Button("Confirm destructive") { destructive = true }
                        .alert("Delete this item?", isPresented: $destructive) {
                            Button("Delete", role: .destructive) { }
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("This action cannot be undone.")
                        }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Default + cancel roles — keyboardShortcut(.defaultAction)") {
                DemoCard(api: "Button(\"OK\") { }.keyboardShortcut(.defaultAction) — bold default button") {
                    Text("Apple emphasizes the default button. Mark a button with `.keyboardShortcut(.defaultAction)` to influence which one gets that prominence; or rely on the system's automatic ordering by role.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }

            VariantBlock(title: "Empty actions → automatic OK") {
                DemoCard(api: ".alert(\"Done.\", isPresented: $flag) { /* no actions */ }") {
                    Text("If you provide no actions, SwiftUI synthesizes a standard OK button. There is no synthetic Cancel — provide one explicitly with `Button(\"Cancel\", role: .cancel)` if needed.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct AlertNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [AlertNote] = [
        .init(title: "All actions dismiss the alert.",
              detail: "Tapping any button — including a custom one — sets the bound Boolean back to false. You don't need to flip it manually inside the action closure.",
              symbol: "arrow.uturn.backward.circle"),
        .init(title: "macOS, iOS, and watchOS only support Text-labeled controls.",
              detail: "Buttons with non-Text labels (Label, custom views) are silently omitted. Stick to `Button(\"Title\", role: …) { … }` shapes.",
              symbol: "textformat"),
        .init(title: "System reorders by role + prominence.",
              detail: "The order you write actions in code is not guaranteed. .destructive is right-most on macOS; .cancel typically left-most. The default action is rendered with extra prominence.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "No native cancel — add one with role: .cancel.",
              detail: "Even when you provide actions, the alert does NOT add a default Cancel. If users should be able to back out, include `Button(\"Cancel\", role: .cancel) { }` explicitly.",
              symbol: "xmark.circle"),
        .init(title: "Use .alert over Alert struct.",
              detail: "The Alert struct (and its primaryButton/secondaryButton API) is deprecated in macOS 26.5. The .alert(_:isPresented:actions:) modifier shape is the supported path.",
              symbol: "exclamationmark.triangle")
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
    AlertIsPresentedPage()
        .frame(width: 1100, height: 800)
}
