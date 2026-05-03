import SwiftUI

// SwiftUI `Prominence` (enum) reference page.
// Source: Documentation/SwiftUI/lists/prominence.md
// Two documented cases:
//   .standard
//   .increased
//
// IMPORTANT: Prominence is @available(macOS, unavailable). The type only
// exists on iOS / iPadOS / Mac Catalyst / tvOS / visionOS / watchOS.
// SwiftKit documents this page for API-surface completeness; no live demo
// is possible on macOS.

struct ProminenceTypePage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Prominence")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type indicating the prominence of a view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/prominence.md · iOS 15.0+ (macOS UNAVAILABLE)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        unavailableNotice
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Two documented cases (iOS only)")
                .font(.headline)
                .foregroundStyle(.primary)
            CaseCard(api: "Prominence.standard",
                     summary: "The inherited default. Used by most surfaces unless overridden.")
            CaseCard(api: "Prominence.increased",
                     summary: "Emphasized treatment. On Section headers via .headerProminence(_:), produces a larger / bolder rendering.")
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        unavailableNotice
    }

    // MARK: Notes

    private struct TypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TypeNote] = [
        .init(title: "Unavailable on macOS.",
              detail: "Per the macOS 26 SDK swiftinterface, the Prominence type and its consumer .headerProminence(_:) are gated to iOS / iPadOS / Mac Catalyst / tvOS / visionOS / watchOS. macOS does not expose them.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Used as the argument to .headerProminence(_:).",
              detail: "The most common consumer of this type is the Section header modifier. Some custom view hierarchies also read @Environment(\\.headerProminence) to react to the value (also iOS-only).",
              symbol: "function"),
        .init(title: ".standard is the inherited default; .increased emphasizes.",
              detail: "Both values are platform-calibrated. iOS .insetGrouped and similar surfaces show clear visual difference; .plain has no header to render and silently absorbs the value.",
              symbol: "switch.2"),
        .init(title: "Conforms to Hashable, Equatable, Sendable.",
              detail: "Safe to store in @State / pass across actor boundaries. Two values mean a Bool would suffice for storage; the enum makes intent legible at the call site.",
              symbol: "checkmark.shield")
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

    // MARK: Helpers

    private var unavailableNotice: some View {
        Label {
            VStack(alignment: .leading, spacing: 4) {
                Text("Prominence is unavailable on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Per the macOS 26 SDK, the type and its consumer .headerProminence(_:) are gated to iOS / iPadOS / Mac Catalyst / tvOS / visionOS / watchOS. SwiftKit can't show a live demo on macOS — see Variants for the two documented cases.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct CaseCard: View {
    let api: String
    let summary: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(api)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
            Text(summary)
                .font(.callout)
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
}

#Preview {
    ProminenceTypePage()
        .frame(width: 1100, height: 800)
}
