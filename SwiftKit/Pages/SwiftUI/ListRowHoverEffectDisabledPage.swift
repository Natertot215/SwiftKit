import SwiftUI

// SwiftUI `View/listRowHoverEffectDisabled(_:)` reference page.
// Source: Documentation/SwiftUI/lists/listrowhovereffectdisabled(_:).md
// Single API:
//   func listRowHoverEffectDisabled(_ disabled: Bool = true) -> some View
//
// IMPORTANT: .listRowHoverEffectDisabled(_:) is @available(macOS, unavailable)
// on macOS 26. The modifier is gated to iOS / iPadOS / Mac Catalyst / visionOS.
// SwiftKit documents this page for API-surface completeness; no live demo
// is possible on macOS.

struct ListRowHoverEffectDisabledPage: View {
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
            Text("listRowHoverEffectDisabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Requests that the containing list row have its hover effect disabled.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listrowhovereffectdisabled(_:).md · iOS 17.0+ / visionOS 1.0+ (macOS UNAVAILABLE)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            unavailableNotice
            CodeBlock(text: """
List {
    Text("One").listRowHoverEffectDisabled()
    Text("Two").listRowHoverEffectDisabled()
    Text("Three").listRowHoverEffectDisabled()
}
""")
            APICallout(".listRowHoverEffectDisabled()")
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Documented examples (iOS / visionOS only)")
                .font(.headline)
                .foregroundStyle(.primary)
            CodeBlock(text: """
// Bool overload — true (suppress)
List {
    Text("Pacific").listRowHoverEffectDisabled(true)
    Text("Atlantic").listRowHoverEffectDisabled(true)
}
""")
            CodeBlock(text: """
// Bool overload — false (allow)
List {
    Text("Pacific").listRowHoverEffectDisabled(false)
    Text("Atlantic").listRowHoverEffectDisabled(false)
}
""")
            CodeBlock(text: """
// Bare call (default true)
List {
    Text("One").listRowHoverEffectDisabled()
}
""")
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
              detail: "Per the macOS 26 SDK swiftinterface, .listRowHoverEffectDisabled(_:) is annotated @available(macOS, unavailable). The modifier exists on iOS / iPadOS / Mac Catalyst / visionOS. SwiftKit documents the API surface; no live demo is possible on macOS.",
              symbol: "exclamationmark.triangle"),
        .init(title: "visionOS-flavored suppression.",
              detail: "Per the doc: 'By default, List rows have built-in hover effects in visionOS.' This modifier suppresses that default. On iOS / iPadOS the row hover behavior follows the platform default unless this modifier is applied.",
              symbol: "eye.slash"),
        .init(title: "Bool default is true — bare call disables.",
              detail: ".listRowHoverEffectDisabled() is shorthand for .listRowHoverEffectDisabled(true). Pass false to explicitly re-enable in code paths that may have disabled it elsewhere.",
              symbol: "switch.2"),
        .init(title: "Companion: .listRowHoverEffect(_:) for overrides.",
              detail: "Use this modifier when you want NO hover effect at all. Use .listRowHoverEffect(_:) when you want a different effect (.automatic / .highlight / nil to inherit). The two are complementary — and both are macOS-unavailable.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "Apply per row.",
              detail: "Attach to the row's content view inside the List, not to the List itself. Each row decides its own hover effect; the List has no list-level toggle for this.",
              symbol: "rectangle.split.1x2")
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
                Text(".listRowHoverEffectDisabled(_:) is unavailable on macOS.")
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
    ListRowHoverEffectDisabledPage()
        .frame(width: 1100, height: 800)
}
