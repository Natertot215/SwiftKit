import SwiftUI

// SwiftUI `View/privacySensitive(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/privacysensitive(_:).md
// macOS 12.0+. Marks a view as containing sensitive data. SwiftUI redacts it
// when RedactionReasons.privacy is in the environment.

struct PrivacySensitiveGalleryPage: View {
    @State private var sensitive: Bool = true
    @State private var applyPrivacyReason: Bool = true

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
            Text("View/privacySensitive(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Marks the view as containing sensitive, private user data.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/privacysensitive(_:).md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Account #")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("4242 4242 4242 4242")
                    .font(.headline)
                    .privacySensitive()
            }
            .padding(16)
            .frame(width: 260, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .redacted(reason: .privacy)
            APICallout("Text(accountNumber).privacySensitive() + .redacted(reason: .privacy)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            PSVariantRow(title: "Default parameter \u{2014} .privacySensitive() == true") {
                PSCodeBlock(
                    api: ".privacySensitive() == .privacySensitive(true)",
                    code: """
                    Text(accountNumber)
                        .privacySensitive()  // defaults to true
                    """
                )
            }

            PSVariantRow(title: "Side-by-side \u{2014} sensitive vs not") {
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("not sensitive")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        bankCard(sensitive: false)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".privacySensitive()")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        bankCard(sensitive: true)
                    }
                }
                .redacted(reason: .privacy)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            PSVariantRow(title: "Interactive \u{2014} toggle modifier and the .privacy reason") {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 16) {
                        Toggle(".privacySensitive()", isOn: $sensitive)
                            .toggleStyle(.switch)
                        Toggle(".redacted(reason: .privacy)", isOn: $applyPrivacyReason)
                            .toggleStyle(.switch)
                    }
                    .frame(maxWidth: 540, alignment: .leading)

                    bankCard(sensitive: sensitive)
                        .redacted(reason: applyPrivacyReason ? .privacy : [])
                    Text("Both must be on for redaction to render.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct PSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PSNote] = [
        .init(title: "Activates only with RedactionReasons.privacy.",
              detail: "The modifier alone doesn't render anything different. Combine with .redacted(reason: .privacy) (or read the env when the system applies it) to get the masked treatment.",
              symbol: "lock.shield"),
        .init(title: "Mark the smallest scope possible.",
              detail: "Apply to the field that's actually private \u{2014} not the whole card. The doc example specifically wraps only the account number, leaving the \"Account #\" label visible.",
              symbol: "scope"),
        .init(title: "isSceneCaptured pairs naturally.",
              detail: "Read \\.isSceneCaptured in the environment to apply .redacted(reason: .privacy) automatically while AirPlay / screen recording is active.",
              symbol: "rectangle.on.rectangle"),
        .init(title: "Default parameter is true.",
              detail: ".privacySensitive() and .privacySensitive(true) are equivalent. Pass false to opt out within a sensitive subtree.",
              symbol: "gear"),
        .init(title: "Always On surface on watchOS.",
              detail: "watchOS \"Always On\" reduces what's visible on screen. Marking sensitive content lets the system hide it during ambient display.",
              symbol: "applewatch")
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

    @ViewBuilder
    private func bankCard(sensitive: Bool) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Account #")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text("4242 4242 4242 4242")
                .font(.headline)
                .privacySensitive(sensitive)
        }
        .padding(16)
        .frame(width: 220, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct PSCodeBlock: View {
    let api: String
    let code: String

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
        }
    }
}

private struct PSVariantRow<Content: View>: View {
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

extension PrivacySensitiveGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.privacySensitive",
        title: "PrivacySensitive",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/privacySensitive(_:)"],
        blurb: "Marks a view as containing sensitive user data. The system redacts the marked subtree whenever RedactionReasons.privacy is active — for example during AirPlay, screen recording, or when the user lowers the device.",
        signature: "func privacySensitive(_ sensitive: Bool = true) -> some View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/view-configuration/privacysensitive(_:).md",
        page: { AnyView(PrivacySensitiveGalleryPage()) }
    )
}

#Preview {
    PrivacySensitiveGalleryPage()
        .frame(width: 1100, height: 800)
}
