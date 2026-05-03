import SwiftUI

// SwiftUI `View/listRowSpacing(_:)` reference page.
// Source: Documentation/SwiftUI/lists/listrowspacing(_:).md
// Single API:
//   func listRowSpacing(_ spacing: CGFloat?) -> some View
//
// IMPORTANT: .listRowSpacing(_:) is @available(macOS, unavailable). The
// modifier is only available on iOS / iPadOS / Mac Catalyst / visionOS.
// SwiftKit documents this page for API-surface completeness; no live demo
// is possible on macOS. macOS code that needs row gap reaches for
// .listRowInsets(_:) on each row instead.

struct ListRowSpacingPage: View {
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
            Text("listRowSpacing(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the vertical spacing between two adjacent rows in a List.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listrowspacing(_:).md · iOS 15.0+ (macOS UNAVAILABLE)")
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
            Text("Documented examples (iOS only)")
                .font(.headline)
                .foregroundStyle(.primary)
            CodeBlock(text: "List { Text(\"Blue\"); Text(\"Red\") }\n    .listRowSpacing(10)")
            CodeBlock(text: "List { … }.listRowSpacing(0)   // tight\nList { … }.listRowSpacing(24)  // loose")
            CodeBlock(text: "List { … }.listRowSpacing(nil) // restore the style's default")
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        unavailableNotice
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Unavailable on macOS.",
              detail: "Per the macOS 26 SDK swiftinterface, .listRowSpacing(_:) is annotated @available(macOS, unavailable). The modifier exists on iOS / iPadOS / Mac Catalyst / visionOS. macOS Lists pick row gap from the active list style; per-row padding can be tuned via .listRowInsets(_:) on each row.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Apply to the List, not the row (on supported platforms).",
              detail: ".listRowSpacing operates on the container's row layout. Attaching it to a row view inside the List has no effect — the spacing is between rows, not within a single row.",
              symbol: "arrow.up.and.down"),
        .init(title: "nil restores the list style's default.",
              detail: "CGFloat? is the parameter type. nil reverts to whatever the active .listStyle(_:) defines as standard inter-row gap.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Different from .listRowInsets and .listSectionSpacing.",
              detail: "Spacing is between rows; insets are inside rows; section spacing is around sections. The trio (only listRowInsets is on macOS) covers the three layout axes.",
              symbol: "rectangle.split.3x1")
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
                Text(".listRowSpacing(_:) is unavailable on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Per the macOS 26 SDK, the modifier is gated to iOS / iPadOS / Mac Catalyst / visionOS. SwiftKit can't show a live demo on macOS — see Variants for documented usage on supported platforms.")
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

private struct CodeBlock: View {
    let text: String

    var body: some View {
        Text(text)
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
    }
}

#Preview {
    ListRowSpacingPage()
        .frame(width: 1100, height: 800)
}
