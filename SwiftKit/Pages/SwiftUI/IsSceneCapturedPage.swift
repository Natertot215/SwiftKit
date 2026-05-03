import SwiftUI

// SwiftUI `EnvironmentValues/isSceneCaptured` reference page.
// Source: Documentation/SwiftUI/view-configuration/isscenecaptured.md
// iOS / iPadOS / Mac Catalyst / visionOS. Read-only Bool indicating whether the
// scene is being mirrored / recorded / cloned (e.g. via AirPlay).

struct IsSceneCapturedPage: View {
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
            Text("EnvironmentValues/isSceneCaptured")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Indicates whether the current scene is actively being cloned to another destination (AirPlay, mirrored, recorded).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/isscenecaptured.md \u{00b7} iOS / iPadOS / Mac Catalyst / visionOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        ISCCodeBlock(
            api: "@Environment(\\.isSceneCaptured) private var isSceneCaptured",
            code: """
            @Environment(\\.isSceneCaptured) private var isSceneCaptured

            var body: some View {
                AccountBalance()
                    .redacted(reason: isSceneCaptured ? .privacy : [])
            }
            """,
            note: "Auto-mask sensitive content while a screen recording or AirPlay session is active."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ISCVariantRow(title: "Pair with .privacySensitive() for finer-grained masking") {
                ISCCodeBlock(
                    api: ".privacySensitive() + .redacted(reason: isSceneCaptured ? .privacy : [])",
                    code: """
                    Text(creditCardNumber)
                        .privacySensitive()
                        .redacted(reason: isSceneCaptured ? .privacy : [])
                    """
                )
            }

            ISCVariantRow(title: "Switch presentation entirely") {
                ISCCodeBlock(
                    api: "if isSceneCaptured { PrivacyPlaceholderView() } else { RealView() }",
                    code: """
                    @Environment(\\.isSceneCaptured) private var isSceneCaptured
                    var body: some View {
                        if isSceneCaptured {
                            ContentUnavailableView(
                                "Hidden during capture",
                                systemImage: "eye.slash"
                            )
                        } else {
                            SensitiveDashboard()
                        }
                    }
                    """
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            ISCCalloutBox(text: "macOS does not list this environment value in the documented availability \u{2014} the doc reports iOS / iPadOS / Mac Catalyst / visionOS.")
            ISCCalloutBox(text: "Read-only. There is no way to push a value down; the system writes it in response to actual capture activity.")
            ISCCalloutBox(text: "Default value when no capture is active: false.")
        }
    }

    private struct ISCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ISCNote] = [
        .init(title: "True while AirPlay / mirroring / recording is active.",
              detail: "Use as a cue to mask sensitive UI \u{2014} balances, account numbers, private messages \u{2014} that the user might not want broadcast.",
              symbol: "rectangle.on.rectangle"),
        .init(title: "Read-only environment value.",
              detail: "There is no setter API. The system updates it; your view reacts.",
              symbol: "lock"),
        .init(title: "Pairs naturally with .redacted(reason: .privacy).",
              detail: "Apply the .privacy reason while capture is active and let .privacySensitive() subtrees mask themselves automatically.",
              symbol: "lock.shield"),
        .init(title: "Don't use it as a security primitive.",
              detail: "Capture detection is best-effort and platform-specific. Treat as UX hygiene, not a guarantee against exfiltration.",
              symbol: "exclamationmark.triangle"),
        .init(title: "iOS / iPadOS / Catalyst / visionOS only.",
              detail: "macOS doesn't expose this env value. For macOS-specific screen recording detection, fall back to AppKit or CoreGraphics APIs (CGScreenRegisterMoveCallback, etc.).",
              symbol: "iphone")
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

private struct ISCCodeBlock: View {
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
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct ISCCalloutBox: View {
    let text: String

    var body: some View {
        Label {
            Text(text)
                .font(.callout)
                .foregroundStyle(.primary)
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.tint)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct ISCVariantRow<Content: View>: View {
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
    IsSceneCapturedPage()
        .frame(width: 1100, height: 800)
}
