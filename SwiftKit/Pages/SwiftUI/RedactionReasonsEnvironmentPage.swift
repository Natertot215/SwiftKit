import SwiftUI

// SwiftUI `EnvironmentValues/redactionReasons` reference page.
// Source: Documentation/SwiftUI/view-configuration/redactionreasons.md
// macOS 11.0+. Read the resolved RedactionReasons OptionSet from the environment.

struct RedactionReasonsEnvironmentPage: View {
    @State private var pick: RREPick = .none

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
            Text("EnvironmentValues/redactionReasons")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The current set of redaction reasons applied to the view's environment.")
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
        VStack(alignment: .leading, spacing: 8) {
            ReasonsReporter()
                .redacted(reason: .placeholder)
            APICallout("@Environment(\\.redactionReasons) private var reasons")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            RREVariantRow(title: "Each reason as an environment input") {
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("[]").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        ReasonsReporter().redacted(reason: [])
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".placeholder").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        ReasonsReporter().redacted(reason: .placeholder)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".invalidated").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        ReasonsReporter().redacted(reason: .invalidated)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".privacy").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        ReasonsReporter().redacted(reason: .privacy)
                    }
                }
            }

            RREVariantRow(title: "OptionSet behavior \u{2014} branch on contents") {
                Text("""
                @Environment(\\.redactionReasons) private var reasons
                var body: some View {
                    if reasons.contains(.placeholder) {
                        SkeletonView()
                    } else {
                        RealContent()
                    }
                }
                """)
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

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            RREVariantRow(title: "Interactive \u{2014} pick a reason and observe") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Reason", selection: $pick) {
                        Text("[]").tag(RREPick.none)
                        Text(".placeholder").tag(RREPick.placeholder)
                        Text(".invalidated").tag(RREPick.invalidated)
                        Text(".privacy").tag(RREPick.privacy)
                        Text("[.placeholder, .privacy]").tag(RREPick.combined)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 520)
                    ReasonsReporter()
                        .redacted(reason: reasons(for: pick))
                }
            }
        }
    }

    private struct RRENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [RRENote] = [
        .init(title: "OptionSet \u{2014} test with .contains.",
              detail: "RedactionReasons is OptionSet, so you can mix multiple reasons. Branch on .contains(.placeholder) etc. when deciding how to render.",
              symbol: "square.stack"),
        .init(title: "Set indirectly via .redacted(reason:).",
              detail: "There's no setter on the environment. Apply .redacted on a parent and the env value reflects the resolved set at the read site.",
              symbol: "pencil.slash"),
        .init(title: "Empty set is the unredacted state.",
              detail: "If reasons.isEmpty, no redaction is requested. .unredacted() forces the set back to empty inside its subtree.",
              symbol: "circle"),
        .init(title: "Custom views adopt this for parity with Apple.",
              detail: "Reading the env lets your view present skeletons, dim invalid data, or mask sensitive values consistent with system controls.",
              symbol: "leaf"),
        .init(title: "System may set this implicitly.",
              detail: "Widgets, watchOS Always On, and screen-recording paths can apply reasons automatically. Don't assume only your code controls the set.",
              symbol: "info.circle")
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

    private func reasons(for pick: RREPick) -> RedactionReasons {
        switch pick {
        case .none:        return []
        case .placeholder: return .placeholder
        case .invalidated: return .invalidated
        case .privacy:     return .privacy
        case .combined:    return [.placeholder, .privacy]
        }
    }
}

private enum RREPick: Hashable {
    case none, placeholder, invalidated, privacy, combined
}

private struct ReasonsReporter: View {
    @Environment(\.redactionReasons) private var reasons

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Resolved reasons")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(describe(reasons))
                .font(.callout)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }

    private func describe(_ reasons: RedactionReasons) -> String {
        if reasons.isEmpty { return "[]" }
        var parts: [String] = []
        if reasons.contains(.placeholder) { parts.append(".placeholder") }
        if reasons.contains(.invalidated) { parts.append(".invalidated") }
        if reasons.contains(.privacy)     { parts.append(".privacy") }
        return "[" + parts.joined(separator: ", ") + "]"
    }
}

private struct RREVariantRow<Content: View>: View {
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
    RedactionReasonsEnvironmentPage()
        .frame(width: 1100, height: 800)
}
