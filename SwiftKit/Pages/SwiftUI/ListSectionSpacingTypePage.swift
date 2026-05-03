import SwiftUI

// SwiftUI `ListSectionSpacing` (struct/enum) reference page.
// Source: Documentation/SwiftUI/lists/listsectionspacing.md
// Three documented values:
//   .default      — inherits the active list style's default gap
//   .compact      — tighter gap between sections
//   .custom(_:)   — explicit point value
//
// IMPORTANT: ListSectionSpacing is @available(macOS, unavailable). The type
// (and the .listSectionSpacing(_:) modifier overloads that consume it) only
// exists on iOS / iPadOS / Mac Catalyst / visionOS / watchOS. SwiftKit
// documents this page for API-surface completeness; no live demo on macOS.

struct ListSectionSpacingTypePage: View {
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
            Text("ListSectionSpacing")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The spacing options between two adjacent sections in a list.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listsectionspacing.md · iOS 17.0+ (macOS UNAVAILABLE)")
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
            Text("Three documented values")
                .font(.headline)
                .foregroundStyle(.primary)
            CaseCard(api: "ListSectionSpacing.default",
                     summary: "Inherits the active list style's default section gap.")
            CaseCard(api: "ListSectionSpacing.compact",
                     summary: "Tighter gap between sections than the style's default.")
            CaseCard(api: "ListSectionSpacing.custom(_ spacing: CGFloat)",
                     summary: "Explicit point value — escape-hatch for hand-tuned spacing.")
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
              detail: "ListSectionSpacing is annotated @available(macOS, unavailable). The type and both .listSectionSpacing(_:) overloads (CGFloat and ListSectionSpacing) are gated to iOS / iPadOS / Mac Catalyst / visionOS / watchOS. macOS code that needs section gap control reaches for .listSectionMargins(_:_:) instead — also iOS-flavored, but that page documents what's possible.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Used as the argument to .listSectionSpacing(_:) on iOS.",
              detail: "On supported platforms, two modifier overloads exist: one takes CGFloat, the other takes ListSectionSpacing. Use the symbolic form to inherit platform-appropriate defaults.",
              symbol: "function"),
        .init(title: "`.default` inherits the list style's default.",
              detail: "Applying .default explicitly is equivalent to not applying the modifier at all when the surrounding code hasn't already set a different value. Useful inside conditional code that needs to revert to defaults.",
              symbol: "arrow.uturn.backward"),
        .init(title: "`.compact` tightens; `.custom(_:)` takes any point value.",
              detail: ".compact is the platform-tight option, calibrated by the list style. .custom(_: CGFloat) is escape-hatch for hand-tuned spacing — use sparingly, prefer .compact / .default first to stay aligned with the system.",
              symbol: "arrow.up.and.down")
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
                Text("ListSectionSpacing is unavailable on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Per the macOS 26 SDK, the type and its consuming .listSectionSpacing(_:) modifier overloads are gated to iOS / iPadOS / Mac Catalyst / visionOS / watchOS. SwiftKit can't show a live demo on macOS — see Variants for the three documented values.")
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

// MARK: - Reusable display helpers (page-local)

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
    ListSectionSpacingTypePage()
        .frame(width: 1100, height: 800)
}
