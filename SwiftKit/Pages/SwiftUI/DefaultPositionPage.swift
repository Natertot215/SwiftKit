import SwiftUI

// SwiftUI `Scene/defaultPosition(_:)` reference page.
// Source: Documentation/SwiftUI/windows/defaultposition(_:).md
// macOS 13.0+. Sets the initial on-screen position of new windows via UnitPoint.

struct DefaultPositionPage: View {
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
            Text("Scene/defaultPosition(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the initial on-screen position for new windows by aligning a window-relative UnitPoint with a screen-relative UnitPoint.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/defaultposition(_:).md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".defaultPosition(.bottomTrailing)",
            code: """
            WindowGroup {
                ContentView()
            }
            .defaultPosition(.bottomTrailing)
            """,
            note: "Anchors the window's bottom-trailing corner with the screen's bottom-trailing corner on first launch."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Predefined UnitPoints") {
                BehaviorList(items: [
                    ".center \u{2014} default; window centered on screen.",
                    ".topLeading / .top / .topTrailing \u{2014} top-edge alignment.",
                    ".leading / .trailing \u{2014} side-edge alignment, vertically centered.",
                    ".bottomLeading / .bottom / .bottomTrailing \u{2014} bottom-edge alignment."
                ])
                WindowSnippet(
                    api: ".defaultPosition(UnitPoint)",
                    code: """
                    WindowGroup { ContentView() }
                        .defaultPosition(.topLeading)

                    WindowGroup { ContentView() }
                        .defaultPosition(.center)
                    """
                )
            }

            VariantBlock(title: "Custom UnitPoint") {
                WindowSnippet(
                    api: ".defaultPosition(UnitPoint(x: 0.25, y: 0.5))",
                    code: """
                    WindowGroup { ContentView() }
                        .defaultPosition(UnitPoint(x: 0.25, y: 0.5))
                    """,
                    note: "x and y range 0\u{2026}1. Above: window's quarter-from-leading point aligns with the screen's quarter-from-leading point, vertically centered."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Applies only to the first window of the scene on a clean launch.",
                "Subsequent windows offset slightly so they don't fully overlap each other.",
                "State restoration overrides this \u{2014} the system restores each window to its last position.",
                "Affects WindowGroup, Window, DocumentGroup, and Settings on macOS.",
                "For multi-display fine control, prefer .defaultWindowPlacement(_:) (macOS 15+) instead."
            ])
        }
    }

    // MARK: Notes

    private struct DPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DPNote] = [
        .init(title: "Alignment is point-to-point.",
              detail: "The UnitPoint inside the window is aligned with the same UnitPoint inside the screen. .topLeading on both means \u{201C}top-left of window touches top-left of screen.\u{201D} The unit point doesn't translate \u{2014} it anchors.",
              symbol: "scope"),
        .init(title: "Initial-only \u{2014} state restoration takes over after first launch.",
              detail: "Once a user has moved the window, restoration tracks that position. defaultPosition only fires when there is no prior state to restore.",
              symbol: "clock.arrow.circlepath"),
        .init(title: "Need control beyond corners and centers? Use defaultWindowPlacement.",
              detail: "Scene/defaultWindowPlacement(_:) (macOS 15+) gives you a closure with WindowLayoutRoot and WindowPlacementContext, which expose the display's visibleRect, the content's sizeThatFits, and other open windows for relative placement.",
              symbol: "function"),
        .init(title: "macOS 13+ \u{2014} earlier targets had no SwiftUI surface for this.",
              detail: "Pre-13 macOS apps positioned windows via NSWindow.setFrameAutosaveName or AppKit-side .center() / .setFrame(\u{2026}). SwiftUI subsumes the simple cases starting macOS 13.",
              symbol: "calendar.badge.exclamationmark")
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
    DefaultPositionPage()
        .frame(width: 1100, height: 800)
}
