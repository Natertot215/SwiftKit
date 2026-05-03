import SwiftUI

// SwiftUI `Scene/persistentSystemOverlays(_:)` reference page.
// Source: Documentation/SwiftUI/windows/persistentsystemoverlays(_:).md
// macOS 15.0+ (declared); has no visible effect on macOS today \u{2014} this is
// an iOS / iPadOS / visionOS surface (Home indicator, SharePlay indicator, etc.).

struct PersistentSystemOverlaysPage: View {
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
            Text("Scene/persistentSystemOverlays(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the preferred visibility of non-transient system overlays \u{2014} the Home indicator, SharePlay indicator, Multitasking Controls, etc.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/persistentsystemoverlays(_:).md \u{00b7} macOS 15.0+ (no visible macOS effect)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".persistentSystemOverlays(.hidden)",
            code: """
            struct ImmersiveView: View {
                var body: some View {
                    Text("Maximum immersion")
                        .persistentSystemOverlays(.hidden)
                }
            }
            """,
            note: "iOS / visionOS pattern. On macOS the modifier is declared but doesn't visibly hide menu-bar overlays."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Visibility values \u{2014} the Visibility enum") {
                BehaviorList(items: [
                    ".automatic \u{2014} system default visibility for the platform.",
                    ".visible \u{2014} request that overlays remain shown.",
                    ".hidden \u{2014} request that overlays be suppressed (only honored if the system permits)."
                ])
                WindowSnippet(
                    api: ".persistentSystemOverlays(.automatic / .visible / .hidden)",
                    code: """
                    .persistentSystemOverlays(.automatic)
                    .persistentSystemOverlays(.visible)
                    .persistentSystemOverlays(.hidden)
                    """
                )
            }

            VariantBlock(title: "iOS / visionOS use cases") {
                WindowSnippet(
                    api: "Hide the Home indicator during fullscreen content",
                    code: """
                    VideoPlayer(player: player)
                        .ignoresSafeArea()
                        .persistentSystemOverlays(.hidden)
                    """,
                    note: "On iOS/iPadOS, hides the Home indicator until the user reveals it. On visionOS 2+, hides the SharePlay indicator when the scene isn't shared."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "macOS: declared but has no visible effect; the menu bar can't be hidden through this surface.",
                "iOS / iPadOS: hides the Home indicator and (where applicable) Multitasking Controls / Picture-in-Picture chrome.",
                "visionOS 2+: hides the SharePlay indicator unless the scene is being shared.",
                "The system may decline the preference (during screen sharing, the SharePlay indicator stays visible regardless).",
                "It's a preference, not a guarantee \u{2014} treat as advisory."
            ])
        }
    }

    // MARK: Notes

    private struct PSONote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PSONote] = [
        .init(title: "macOS exposure is API-only \u{2014} no visible behavior.",
              detail: "The modifier is part of the cross-platform Scene API surface so SwiftUI code stays portable. On macOS the menu bar is governed elsewhere (NSApplication.presentationOptions, .titleBarFullScreenAutoHidden, etc.).",
              symbol: "info.circle"),
        .init(title: "Preference, not command.",
              detail: "Apple's docs state explicitly: \u{201C}You can indicate a preference with this modifier, but the system might or might not be able to honor that preference.\u{201D} Always design the UI as if the overlay might still appear.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Wrap with .ignoresSafeArea on iOS for true full-screen content.",
              detail: "On iOS, hiding the Home indicator alone doesn't reclaim the safe-area inset. Pair .persistentSystemOverlays(.hidden) with .ignoresSafeArea() for genuinely edge-to-edge layouts.",
              symbol: "rectangle.fill"),
        .init(title: "visionOS adds ImmersiveSpace semantics.",
              detail: "Inside an ImmersiveSpace the modifier governs the Home indicator's visibility specifically. WindowGroups instead see it affect the window chrome.",
              symbol: "visionpro"),
        .init(title: "Skip on macOS-only apps.",
              detail: "Reaching for this modifier on macOS is wasted code. Prefer NSWindow / NSApplication APIs (auto-hide menu bar, full-screen presentation options) for the equivalent macOS effect.",
              symbol: "macwindow")
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

// MARK: - Reusable demo helpers (page-local)

private struct WindowSnippet: View {
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

private struct VariantBlock<Content: View>: View {
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

private struct BehaviorList: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                Label {
                    Text(item)
                        .font(.callout)
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.tint)
                }
            }
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
    PersistentSystemOverlaysPage()
        .frame(width: 1100, height: 800)
}
