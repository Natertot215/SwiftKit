import SwiftUI

// SwiftUI `DisplayProxy` reference page.
// Source: Documentation/SwiftUI/windows/displayproxy.md
// macOS 15.0+. Provides bounds, visibleRect, and safeAreaInsets for a display.
// Reached via WindowPlacementContext.defaultDisplay.

struct DisplayProxyPage: View {
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
            Text("DisplayProxy")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Read-only proxy for a display's geometry. Reached via WindowPlacementContext.defaultDisplay inside placement closures.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/displayproxy.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "context.defaultDisplay.visibleRect",
            code: """
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
            note: "visibleRect excludes the menu bar and Dock; bounds includes them. Use visibleRect for placement that respects system chrome."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three documented properties") {
                BehaviorList(items: [
                    "bounds: CGRect \u{2014} the full display geometry, including menu bar and Dock.",
                    "visibleRect: CGRect \u{2014} the area available to app windows (menu bar / Dock excluded).",
                    "safeAreaInsets: EdgeInsets \u{2014} the inset from bounds to the safe area for app content."
                ])
                WindowSnippet(
                    api: "DisplayProxy.bounds / .visibleRect / .safeAreaInsets",
                    code: """
                    let display = context.defaultDisplay
                    let full   = display.bounds          // entire display
                    let usable = display.visibleRect     // minus menu bar / Dock
                    let safe   = display.safeAreaInsets  // EdgeInsets to safe area
                    """
                )
            }

            VariantBlock(title: "Combine with WindowLayoutRoot.sizeThatFits") {
                WindowSnippet(
                    api: "Compute placement from display + content size",
                    code: """
                    .windowIdealPlacement { content, context in
                        let bounds = context.defaultDisplay.visibleRect
                        let proposal = ProposedViewSize(width: nil, height: bounds.height)
                        let contentSize = content.sizeThatFits(proposal)
                        return WindowPlacement(
                            width: contentSize.width,
                            height: contentSize.height
                        )
                    }
                    """,
                    note: "Ask the content how tall it would be at full display height, then return that geometry as the zoom placement."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Equatable \u{2014} compare two DisplayProxy values directly.",
                "Always reach this through context.defaultDisplay; the type doesn't construct on its own.",
                "Coordinates are in points, not pixels (use NSScreen.backingScaleFactor on AppKit if you need device pixels).",
                "Reflects the display the placement closure is being evaluated for \u{2014} not the keyboard-focused screen at all times.",
                "On multi-display setups, prefer relative placements via WindowProxy when you don't need absolute coordinates."
            ])
        }
    }

    // MARK: Notes

    private struct DPxNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DPxNote] = [
        .init(title: "visibleRect vs bounds is a critical distinction.",
              detail: "bounds is the full display rectangle; visibleRect subtracts the menu bar and (when shown) the Dock. Use visibleRect for any placement the user will perceive \u{2014} a window centered in bounds will appear visually offset by the menu bar height.",
              symbol: "rectangle.dashed"),
        .init(title: "safeAreaInsets is per-display, not per-window.",
              detail: "Use this when calculating how far from a display edge a window should sit. Distinct from a view's @Environment(\\.safeAreaInsets), which describes the rendering view's insets.",
              symbol: "rectangle.inset.filled"),
        .init(title: "macOS 15+ \u{2014} no equivalent on earlier targets.",
              detail: "Pre-15 macOS used NSScreen directly: NSScreen.main, NSScreen.visibleFrame. SwiftUI's DisplayProxy abstracts that for placement closures starting macOS 15.",
              symbol: "calendar.badge.exclamationmark"),
        .init(title: "Pair with WindowProxy for relative anchoring.",
              detail: "When you don't actually need display geometry \u{2014} you just want \u{201C}next to that other window\u{201D} \u{2014} skip DisplayProxy and use a WindowProxy from context.windows in a WindowPlacement.Position case.",
              symbol: "arrow.left.and.right.righttriangle.left.righttriangle.right")
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
    DisplayProxyPage()
        .frame(width: 1100, height: 800)
}
