import SwiftUI

// SwiftUI `RedactionReasons` type reference page.
// Source: Documentation/SwiftUI/view-configuration/redactionreasons.md
// macOS 11.0+. OptionSet describing redaction reasons (placeholder, invalidated, privacy).

struct RedactionReasonsTypePage: View {
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
            Text("RedactionReasons")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The reasons to apply a redaction to data displayed on screen.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/redactionreasons.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            RRTRow(value: ".placeholder", description: "Skeleton / loading content not yet available.")
            RRTRow(value: ".invalidated", description: "Content currently being recomputed (e.g. interactive Widgets).")
            RRTRow(value: ".privacy",     description: "Sensitive content the user might not want exposed.")
            APICallout("struct RedactionReasons : OptionSet, Equatable, Sendable, \u{2026}")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            RRTSection(title: "OptionSet algebra") {
                RRTCodeBlock(
                    api: "Multiple reasons via [.placeholder, .privacy]",
                    code: """
                    let combined: RedactionReasons = [.placeholder, .privacy]
                    let stripped = combined.subtracting(.privacy)  // == .placeholder
                    let isEmpty = combined.intersection(.invalidated).isEmpty  // true
                    """
                )
            }

            RRTSection(title: "Apply via .redacted(reason:)") {
                RRTCodeBlock(
                    api: ".redacted(reason: .placeholder)",
                    code: """
                    SkeletonRow()
                        .redacted(reason: .placeholder)

                    SensitiveRow()
                        .redacted(reason: .privacy)
                    """
                )
            }

            RRTSection(title: "Read via @Environment(\\.redactionReasons)") {
                RRTCodeBlock(
                    api: "Branch on the resolved set",
                    code: """
                    @Environment(\\.redactionReasons) private var reasons
                    var body: some View {
                        if reasons.contains(.placeholder) {
                            SkeletonView()
                        } else {
                            RealView()
                        }
                    }
                    """
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            RRTSection(title: "Conformances") {
                Text("Equatable, ExpressibleByArrayLiteral, OptionSet, RawRepresentable, Sendable, SendableMetatype, SetAlgebra")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
            }
        }
    }

    private struct RRTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [RRTNote] = [
        .init(title: "OptionSet \u{2014} multiple reasons compose.",
              detail: "Use array literals: .redacted(reason: [.placeholder, .privacy]). The empty array is a valid no-op.",
              symbol: "square.stack"),
        .init(title: "Three documented values: placeholder, invalidated, privacy.",
              detail: "Each carries its own meaning; pick the closest match. Custom reasons aren't supported \u{2014} model app-specific \"redactions\" with your own state.",
              symbol: "list.bullet"),
        .init(title: "Use init(rawValue:) for cross-process serialization.",
              detail: "If you need to pass reasons through UserDefaults or App Intents, the rawValue Int round-trips through init(rawValue:).",
              symbol: "arrow.left.arrow.right"),
        .init(title: "Sendable \u{2014} safe across actors.",
              detail: "Pass the value through Tasks and across actor boundaries without ceremony.",
              symbol: "shippingbox"),
        .init(title: "Use SetAlgebra to combine / strip reasons.",
              detail: ".union, .intersection, .subtracting all work \u{2014} useful when conditionally narrowing the active reasons before passing to .redacted.",
              symbol: "function")
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

private struct RRTRow: View {
    let value: String
    let description: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(value)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 130, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

private struct RRTCodeBlock: View {
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

private struct RRTSection<Content: View>: View {
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
    RedactionReasonsTypePage()
        .frame(width: 1100, height: 800)
}
