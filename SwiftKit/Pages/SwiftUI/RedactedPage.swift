import SwiftUI

// SwiftUI `View/redacted(reason:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/redacted(reason:).md
// macOS 11.0+. Adds a reason to the RedactionReasons option set in the env.

struct RedactedPage: View {
    @State private var reason: RedactionPick = .placeholder

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
            Text("View/redacted(reason:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a reason to apply a redaction to this view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/redacted(reason:).md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            redactionCard()
                .redacted(reason: .placeholder)
                .frame(width: 280)
            APICallout(".redacted(reason: .placeholder)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            RPVariantRow(title: "All three documented reasons") {
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".placeholder").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        redactionCard().redacted(reason: .placeholder).frame(width: 220)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".invalidated").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        redactionCard().redacted(reason: .invalidated).frame(width: 220)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".privacy").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        redactionCard().redacted(reason: .privacy).frame(width: 220)
                    }
                }
            }

            RPVariantRow(title: "Combined reasons via OptionSet") {
                VStack(alignment: .leading, spacing: 8) {
                    redactionCard()
                        .redacted(reason: [.placeholder, .privacy])
                        .frame(width: 280)
                    APICallout(".redacted(reason: [.placeholder, .privacy])")
                }
            }

            RPVariantRow(title: "Empty reasons \u{2014} a no-op") {
                VStack(alignment: .leading, spacing: 8) {
                    redactionCard()
                        .redacted(reason: [])
                        .frame(width: 280)
                    APICallout(".redacted(reason: []) \u{2014} no redaction added")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            RPVariantRow(title: "Drive a reason from a Picker") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Reason", selection: $reason) {
                        Text(".placeholder").tag(RedactionPick.placeholder)
                        Text(".invalidated").tag(RedactionPick.invalidated)
                        Text(".privacy").tag(RedactionPick.privacy)
                        Text("[]").tag(RedactionPick.none)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 380)
                    redactionCard()
                        .redacted(reason: reasons(for: reason))
                        .frame(width: 320)
                    Text("reason = \(label(for: reason))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct RPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [RPNote] = [
        .init(title: "Additive \u{2014} appends to the parent's reasons.",
              detail: "Each .redacted call ORs its reasons with whatever's in the environment. To clear, use .unredacted() instead.",
              symbol: "plus.circle"),
        .init(title: "Three documented reasons: .placeholder, .invalidated, .privacy.",
              detail: ".placeholder for skeleton loading, .invalidated for stale recompute, .privacy for sensitive content. Pick the one that matches the meaning.",
              symbol: "list.bullet"),
        .init(title: "Reasons are an OptionSet \u{2014} pass an array.",
              detail: "[.placeholder, .privacy] adds both at once. The empty array is a valid no-op. Prefer the empty array over conditional .redacted application.",
              symbol: "square.stack"),
        .init(title: "Read in custom views via @Environment(\\.redactionReasons).",
              detail: "Custom controls inspect the resolved set to decide how to draw \u{2014} e.g. swap a chart for shaded bars when .placeholder is set.",
              symbol: "leaf"),
        .init(title: "Pair with .unredacted() to scope back to clear.",
              detail: "Apply .redacted high in the tree and use .unredacted() on the few subviews that should always render their real content.",
              symbol: "arrow.uturn.backward")
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
    private func redactionCard() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Account holder")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text("Margaret Hamilton")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Last login: Apr 30, 2026 at 9:14 AM")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }

    private func reasons(for pick: RedactionPick) -> RedactionReasons {
        switch pick {
        case .placeholder: return .placeholder
        case .invalidated: return .invalidated
        case .privacy:     return .privacy
        case .none:        return []
        }
    }

    private func label(for pick: RedactionPick) -> String {
        switch pick {
        case .placeholder: return ".placeholder"
        case .invalidated: return ".invalidated"
        case .privacy:     return ".privacy"
        case .none:        return "[]"
        }
    }
}

private enum RedactionPick: Hashable {
    case placeholder, invalidated, privacy, none
}

private struct RPVariantRow<Content: View>: View {
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
    RedactedPage()
        .frame(width: 1100, height: 800)
}
