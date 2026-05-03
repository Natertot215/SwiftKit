import SwiftUI
import AuthenticationServices

// SwiftUI `View/signInWithAppleButtonStyle(_:)` reference page.
// Source: Documentation/SwiftUI/view-styles/signinwithapplebuttonstyle(_:).md
// macOS 11.0+. The modifier lives in SwiftUI but the SignInWithAppleButton
// view it modifies is in AuthenticationServices. Per project rules SwiftKit
// renders Apple primitives — this page shows the three documented styles.

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 80

struct SignInWithAppleButtonStylePage: View {
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
            Text("View/signInWithAppleButtonStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style used for displaying the control (see SignInWithAppleButton.Style).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/signinwithapplebuttonstyle(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SIWACard(title: ".black", api: ".signInWithAppleButtonStyle(.black)") {
            sampleButton
                .signInWithAppleButtonStyle(.black)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Three documented styles: .black, .white, .whiteOutline.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                SIWACard(title: ".black", api: ".signInWithAppleButtonStyle(.black)") {
                    sampleButton.signInWithAppleButtonStyle(.black)
                }
                SIWACard(title: ".white", api: ".signInWithAppleButtonStyle(.white)") {
                    sampleButton.signInWithAppleButtonStyle(.white)
                }
                SIWACard(title: ".whiteOutline", api: ".signInWithAppleButtonStyle(.whiteOutline)") {
                    sampleButton.signInWithAppleButtonStyle(.whiteOutline)
                }
            }
        }
    }

    private var sampleButton: some View {
        SignInWithAppleButton(.signIn) { _ in
            // request — demo only
        } onCompletion: { _ in
            // result — demo only
        }
        .frame(height: 44)
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Label kind via SignInWithAppleButton(_ label:)")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("The button has its own enum for verb (.signIn, .signUp, .continue). Style is orthogonal to label.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                SIWACard(title: ".signIn", api: "SignInWithAppleButton(.signIn) { … }") {
                    SignInWithAppleButton(.signIn) { _ in } onCompletion: { _ in }
                        .frame(height: 44)
                        .signInWithAppleButtonStyle(.black)
                }
                SIWACard(title: ".signUp", api: "SignInWithAppleButton(.signUp) { … }") {
                    SignInWithAppleButton(.signUp) { _ in } onCompletion: { _ in }
                        .frame(height: 44)
                        .signInWithAppleButtonStyle(.black)
                }
                SIWACard(title: ".continue", api: "SignInWithAppleButton(.continue) { … }") {
                    SignInWithAppleButton(.continue) { _ in } onCompletion: { _ in }
                        .frame(height: 44)
                        .signInWithAppleButtonStyle(.black)
                }
            }
        }
    }

    private struct SIWANote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [SIWANote] = [
        .init(title: "Three styles, fixed by Apple's brand guidelines.",
              detail: ".black, .white, .whiteOutline. You don't get to recolor or restyle the button — it's part of the Sign in with Apple brand identity and reviews care.",
              symbol: "applelogo"),
        .init(title: "Modifier lives in SwiftUI; button lives in AuthenticationServices.",
              detail: "import AuthenticationServices to use SignInWithAppleButton. The .signInWithAppleButtonStyle(_:) modifier is shipped in SwiftUI proper.",
              symbol: "shippingbox"),
        .init(title: "Always provide an onCompletion handler that handles all three result kinds.",
              detail: "ASAuthorization, error, or cancellation. Crash-on-error in production violates HIG and App Review will catch it.",
              symbol: "checkmark.shield"),
        .init(title: "Choose .whiteOutline only on white/light backgrounds.",
              detail: "On dark backgrounds use .white (filled). On any background where contrast is sufficient, .black is the canonical choice.",
              symbol: "circle.lefthalf.filled")
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

private struct SIWACard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    SignInWithAppleButtonStylePage()
        .frame(width: 1100, height: 800)
}
