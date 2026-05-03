import SwiftUI

// SwiftUI `View/listRowHoverEffect(_:)` reference page.
// Source: Documentation/SwiftUI/lists/listrowhovereffect(_:).md
// Single API:
//   func listRowHoverEffect(_ effect: HoverEffect?) -> some View
//
// IMPORTANT: .listRowHoverEffect(_:) is @available(macOS, unavailable) on
// macOS 26. The modifier is gated to iOS / iPadOS / Mac Catalyst / visionOS.
// SwiftKit documents this page for API-surface completeness; no live demo
// is possible on macOS.

struct ListRowHoverEffectPage: View {
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
            Text("listRowHoverEffect(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Requests that the containing list row use the provided hover effect.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listrowhovereffect(_:).md · iOS 17.0+ / visionOS 1.0+ (macOS UNAVAILABLE)")
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
    Text("Pacific").listRowHoverEffect(.automatic)
    Text("Atlantic").listRowHoverEffect(.automatic)
    Text("Indian").listRowHoverEffect(.automatic)
}
""")
            APICallout(".listRowHoverEffect(.automatic)")
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
// Three documented HoverEffect values
List {
    Text("One").listRowHoverEffect(.automatic)
    Text("Two").listRowHoverEffect(.highlight)
    Text("Three").listRowHoverEffect(.lift) // unsupported for list rows
}
""")
            CodeBlock(text: """
// Pass nil — preserve the default effect
List {
    Text("One").listRowHoverEffect(nil)
    Text("Two").listRowHoverEffect(nil)
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
              detail: "Per the macOS 26 SDK swiftinterface, .listRowHoverEffect(_:) is annotated @available(macOS, unavailable). The modifier exists on iOS / iPadOS / Mac Catalyst / visionOS. SwiftKit documents the API surface; no live demo is possible on macOS.",
              symbol: "exclamationmark.triangle"),
        .init(title: "visionOS-flavored — built-in row hover effects.",
              detail: "Per the doc: 'By default, List rows have built-in hover effects in visionOS.' This modifier overrides that default with .automatic, .highlight, or .lift (the doc notes .lift is not supported for list rows).",
              symbol: "eye"),
        .init(title: "HoverEffect: .automatic / .highlight / .lift.",
              detail: ".automatic uses the default platform effect. .highlight applies a tinted highlight. .lift is documented but the doc explicitly notes 'HoverEffect.lift is not supported for list rows.'",
              symbol: "switch.2"),
        .init(title: "Pass nil to preserve the platform default.",
              detail: "Per the doc: 'Use a nil effect to indicate that the list row's default hover effect should not be modified.' This is different from .automatic, which actively applies the default.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Companion: .listRowHoverEffectDisabled to suppress entirely.",
              detail: "If you need to opt OUT of the default hover effect, use .listRowHoverEffectDisabled(true). That page documents the suppression side; this page documents the override side. Both are macOS-unavailable.",
              symbol: "xmark.circle")
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
                Text(".listRowHoverEffect(_:) is unavailable on macOS.")
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
    ListRowHoverEffectPage()
        .frame(width: 1100, height: 800)
}
