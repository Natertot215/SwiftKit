import SwiftUI

// SwiftUI article stub: \u{201C}Customizing window styles and state-restoration
// behavior in macOS\u{201D}.
// Source: Documentation/SwiftUI/windows/customizing-window-styles-and-state-restoration-behavior-in-macos.md
// macOS 15+ techniques drawn from Apple's Destination Video sample.

struct CustomizingWindowStylesAndStateRestorationBehaviorInMacOSPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultBlock
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
            Text("Customizing window styles and state-restoration behavior in macOS")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apple article: how Destination Video tailors window chrome, drag regions, zoom behavior, and state restoration on macOS 15+.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/customizing-window-styles-and-state-restoration-behavior-in-macos.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    @ViewBuilder
    private var defaultBlock: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This is an Apple sample-code article rather than a primitive. It walks through four techniques applied to the macOS target of Destination Video. Each technique has its own dedicated SwiftUI page in this gallery.")
                .font(.callout)
                .foregroundStyle(.primary)
            Link("Read the article on developer.apple.com",
                 destination: URL(string: "https://developer.apple.com/documentation/swiftui/customizing-window-styles-and-state-restoration-behavior-in-macos")!)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TopicBlock(
                title: "1. Remove the toolbar's title and background",
                api: ".toolbarBackgroundVisibility(.hidden, for: .windowToolbar) + .toolbar(removing: .title)",
                detail: "Removes the toolbar background and title text while leaving traffic-light controls intact. Useful for sidebar-driven apps where the sidebar already conveys hierarchy.",
                code: """
                ContentView()
                    .toolbarBackgroundVisibility(.hidden, for: .windowToolbar)
                    .toolbar(removing: .title)
                """
            )

            TopicBlock(
                title: "2. Extend the window's drag region with WindowDragGesture",
                api: ".gesture(WindowDragGesture()) + .allowsWindowActivationEvents(true)",
                detail: "When the toolbar is removed, the user loses the obvious drag handle. Add WindowDragGesture to a transparent overlay so the window stays movable; allowsWindowActivationEvents lets the gesture receive activation events when the window is in the background.",
                code: """
                .gesture(WindowDragGesture())
                .allowsWindowActivationEvents(true)
                """
            )

            TopicBlock(
                title: "3. Customize zoom behavior with .windowIdealPlacement",
                api: ".windowIdealPlacement { content, context in WindowPlacement(\u{2026}) }",
                detail: "Override Option-click-zoom to maintain the video's aspect ratio so black bars don't appear above and below the player. Uses WindowLayoutRoot.sizeThatFits and DisplayProxy.visibleRect.",
                code: """
                .windowIdealPlacement { proxy, context in
                    let displayBounds = context.defaultDisplay.visibleRect
                    let idealSize = proxy.sizeThatFits(.unspecified)
                    let aspect = aspectRatio(of: idealSize)
                    let deltas = deltas(of: displayBounds.size, idealSize)
                    let size = calculateZoomedSize(
                        of: idealSize,
                        inBounds: displayBounds,
                        withAspectRatio: aspect,
                        andDeltas: deltas
                    )
                    let position = position(of: size, centeredIn: displayBounds)
                    return WindowPlacement(position, size: size)
                }
                """
            )

            TopicBlock(
                title: "4. Modify state-restoration behavior with .restorationBehavior",
                api: ".restorationBehavior(.disabled)",
                detail: "Disable state restoration for transient scenes (a video player, a network test). Restoring an in-progress video on next launch isn't useful and may not even be possible.",
                code: """
                .restorationBehavior(.disabled)
                """
            )
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "All four techniques are macOS 15+ APIs.",
                "The article is sample-code-driven; the actual project lives in Apple's Destination Video sample download.",
                "Each technique has its own dedicated SwiftUI page in the Windows folder of this gallery.",
                "Per L-001: SwiftKit doesn't reimplement these primitives \u{2014} it documents them by composition."
            ])
        }
    }

    // MARK: Notes

    private struct ANote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ANote] = [
        .init(title: "Cross-references inside SwiftKit's gallery.",
              detail: "See WindowIdealSizePage / WindowPlacementPage for placement, RestorationBehaviorPage for restoration, WindowToolbarFullScreenVisibilityPage for toolbar chrome behavior, and WindowBackgroundDragBehaviorPage for the drag-gesture replacement.",
              symbol: "link"),
        .init(title: "These are visual changes only.",
              detail: "Per Apple's note: the system continues providing the window's title to accessibility tooling, and the Window menu still shows the title. Removing the toolbar text/background is purely visual.",
              symbol: "accessibility"),
        .init(title: "Use WindowDragGesture, not custom hit-testing.",
              detail: "Adding manual NSResponder hit-testing for window drag is a deprecated approach. WindowDragGesture is the SwiftUI-native way and integrates with the rest of the gesture system.",
              symbol: "hand.draw"),
        .init(title: "Article is the orientation; per-API pages are the reference.",
              detail: "Treat this page as a contents listing for the four techniques. Each linked page above goes deeper on that single API.",
              symbol: "book.closed")
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

// MARK: - Page-local helpers

private struct TopicBlock: View {
    let title: String
    let api: String
    let detail: String
    let code: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
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
    CustomizingWindowStylesAndStateRestorationBehaviorInMacOSPage()
        .frame(width: 1100, height: 800)
}
