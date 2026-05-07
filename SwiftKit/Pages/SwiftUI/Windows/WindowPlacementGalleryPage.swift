import SwiftUI

// SwiftUI window placement surface reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowplacement.md
//   Documentation/SwiftUI/windows/defaultwindowplacement(_:).md
//   Documentation/SwiftUI/windows/windowidealplacement(_:).md
//   Documentation/SwiftUI/windows/windowplacementcontext.md
// macOS 15.0+. Programmatic, content- and display-aware window positioning.

struct WindowPlacementGalleryPage: View {
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
            Text("WindowPlacement")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A computed size + position for a window. Returned from .defaultWindowPlacement / .windowIdealPlacement closures with WindowLayoutRoot + WindowPlacementContext as inputs.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowplacement.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".defaultWindowPlacement { content, context in WindowPlacement(\u{2026}) }",
            code: """
            Window("Status", id: "status") {
                StatusView()
            }
            .windowResizability(.contentSize)
            .defaultWindowPlacement { content, context in
                let displayBounds = context.defaultDisplay.visibleRect
                let size = content.sizeThatFits(.unspecified)
                let position = CGPoint(
                    x: displayBounds.midX - size.width / 2,
                    y: displayBounds.maxY - size.height - 140
                )
                return WindowPlacement(position: position, size: size)
            }
            """,
            note: "The canonical example: anchor a status panel 140 points from the bottom of the visible screen, horizontally centered."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "WindowPlacement initializers \u{2014} six overloads") {
                WindowSnippet(
                    api: "init(_:) / init(_:size3D:) / init(_:size:) / init(_:width:height:) / init(_:width:height:depth:) / init(x:y:width:height:)",
                    code: """
                    WindowPlacement(position: CGPoint, size: CGSize)
                    WindowPlacement(_ position: WindowPlacement.Position)
                    WindowPlacement(_ position: Position, size: CGSize)
                    WindowPlacement(_ position: Position, width: CGFloat, height: CGFloat)
                    WindowPlacement(_ position: Position, width: CGFloat, height: CGFloat, depth: CGFloat)
                    WindowPlacement(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
                    """,
                    note: "Any field omitted falls back to the scene's default behavior. Mix-and-match \u{2014} you can specify only what you care about."
                )
            }

            VariantBlock(title: "Place relative to another window \u{2014} WindowPlacement.Position") {
                WindowSnippet(
                    api: "WindowPlacement(.trailing(otherWindow))",
                    code: """
                    .defaultWindowPlacement { content, context in
                        if let contentWindow = context.windows.first(
                            where: { $0.id == "content" }
                        ) {
                            WindowPlacement(.trailing(contentWindow))
                        } else {
                            WindowPlacement()  // fall back to default
                        }
                    }
                    """,
                    note: "Position cases align the new window against an existing one (trailing, leading, above, below, etc.)."
                )
            }

            VariantBlock(title: ".windowIdealPlacement(_:) \u{2014} placement on zoom") {
                WindowSnippet(
                    api: ".windowIdealPlacement { content, context in WindowPlacement(\u{2026}) }",
                    code: """
                    .windowIdealPlacement { content, context in
                        let displayBounds = context.defaultDisplay.visibleRect
                        let proposal = ProposedViewSize(
                            width: nil, height: displayBounds.height)
                        let contentSize = content.sizeThatFits(proposal)
                        return .init(
                            width: contentSize.width,
                            height: contentSize.height
                        )
                    }
                    """,
                    note: "Same closure shape as defaultWindowPlacement, but invoked when the user clicks the green zoom button."
                )
            }

            VariantBlock(title: "WindowPlacementContext \u{2014} the second closure parameter") {
                WindowSnippet(
                    api: "context.defaultDisplay (DisplayProxy) + context.windows ([WindowProxy])",
                    code: """
                    .defaultWindowPlacement { content, context in
                        let displayBounds = context.defaultDisplay.visibleRect
                        let safe = context.defaultDisplay.safeAreaInsets
                        let openWindows = context.windows
                        // \u{2026}use these to compute placement
                    }
                    """,
                    note: "WindowPlacementContext exposes defaultDisplay (a DisplayProxy with bounds/visibleRect/safeAreaInsets) and windows (other open windows for relative positioning)."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Placement is initial-only \u{2014} state restoration replaces the computed value with the user's last position.",
                "On visionOS, defaultWindowPlacement is ignored \u{2014} the system places the first window relative to the user's gaze.",
                "Pair with .windowResizability(.contentSize) when you want the placement size to actually stick.",
                "WindowPlacement is Equatable \u{2014} you can compare two placement values directly.",
                "Returning WindowPlacement() with no arguments falls back entirely to the scene's default behavior."
            ])
        }
    }

    // MARK: Notes

    private struct WPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WPNote] = [
        .init(title: "Two surfaces, one return type.",
              detail: ".defaultWindowPlacement(_:) sets the initial placement; .windowIdealPlacement(_:) sets the zoom placement. Both take (WindowLayoutRoot, WindowPlacementContext) and return WindowPlacement.",
              symbol: "switch.2"),
        .init(title: "WindowPlacement.Position relates one window to another.",
              detail: "Use the static positions (.leading(_:), .trailing(_:), .above(_:), .below(_:), etc.) on a WindowProxy from context.windows to anchor the new window against an existing one without computing absolute coordinates.",
              symbol: "rectangle.split.2x1"),
        .init(title: "Six initializers; pick the simplest that expresses intent.",
              detail: "init(_:) for relative-only, init(x:y:width:height:) for absolute geometry, init(_:size:) / init(_:width:height:) for hybrid. Volumetric forms add depth.",
              symbol: "function"),
        .init(title: "WindowPlacementContext is the runtime hook into the display environment.",
              detail: "context.defaultDisplay is a DisplayProxy: bounds, safeAreaInsets, visibleRect. context.windows is the list of currently open windows you can position against.",
              symbol: "display"),
        .init(title: "macOS 15+ / visionOS 2+ \u{2014} pre-15 macOS apps need AppKit.",
              detail: "Earlier targets used NSWindow.setFrameOrigin / setFrame plus screen tracking. SwiftUI subsumes the common cases starting macOS 15.",
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

extension WindowPlacementGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowPlacement",
        title: "WindowPlacement",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowPlacement",
            "Scene/defaultPosition(_:)",
            "Scene/defaultWindowPlacement(_:)",
            "Scene/windowIdealPlacement(_:)",
            "WindowPlacementContext",
            "WindowLayoutRoot",
            "WindowProxy",
            "DisplayProxy"
        ],
        blurb: "A type and supporting machinery that represent a preferred size and position for a window. Use with defaultWindowPlacement, defaultPosition, and windowIdealPlacement modifiers.",
        signature: "struct WindowPlacement",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowplacement.md",
        page: { AnyView(WindowPlacementGalleryPage()) }
    )
}

#Preview {
    WindowPlacementGalleryPage()
        .frame(width: 1100, height: 800)
}
