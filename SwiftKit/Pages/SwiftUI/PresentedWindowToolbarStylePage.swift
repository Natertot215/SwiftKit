import SwiftUI

// SwiftUI `View/presentedWindowToolbarStyle(_:)` reference page.
// Source: Documentation/SwiftUI/view-styles/presentedwindowtoolbarstyle(_:).md
// macOS 11.0+. Sets the toolbar style for windows opened from this view via
// NSWorkspace, NSPanel, openWindow, etc. The style is a WindowToolbarStyle
// conformer (.automatic, .expanded, .unified, .unifiedCompact).

struct PresentedWindowToolbarStylePage: View {
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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/presentedWindowToolbarStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the window toolbar style for any newly created window from this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/presentedwindowtoolbarstyle(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PWTSCodeBlock(text:
            """
            // Apply on the view that triggers window presentation:
            Button("Open Inspector") {
                openWindow(id: "inspector")
            }
            .presentedWindowToolbarStyle(.unifiedCompact)
            """)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Built-in WindowToolbarStyle values")
                .font(.headline)
            PWTSCodeBlock(text:
                """
                .automatic           — system picks per platform
                .expanded            — title bar above toolbar (taller)
                .unified             — title bar merged with toolbar
                .unifiedCompact      — same merge, smaller height
                """)
            Text("These are the same values WindowGroup-level .windowToolbarStyle(_:) accepts. presentedWindowToolbarStyle(_:) attaches to a presenting view and influences the NEXT window opened from it.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Difference vs WindowGroup-level windowToolbarStyle(_:)")
                .font(.headline)
            PWTSCodeBlock(text:
                """
                // Set on the WindowGroup itself — applies to every window in the group:
                WindowGroup { ContentView() }
                    .windowToolbarStyle(.unified)

                // Set on a presenting view — applies to the NEXT opened window only:
                Button("Open") { openWindow(id: \"foo\") }
                    .presentedWindowToolbarStyle(.unifiedCompact)
                """)
            Text("presentedWindowToolbarStyle(_:) is per-presentation. windowToolbarStyle(_:) is per-window-group. Use the presenting form when one trigger should override the group default for a single child window.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private struct PWTSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PWTSNote] = [
        .init(title: "Affects newly-presented windows, not the calling window.",
              detail: "The modifier walks down the view tree until a window-presenting action runs (openWindow, NSWorkspace, sheet, etc.) and applies the style to THAT new window.",
              symbol: "macwindow.badge.plus"),
        .init(title: ".unifiedCompact is the densest toolbar.",
              detail: "Single-row chrome with everything packed into the title bar. Common in inspector and accessory windows.",
              symbol: "rectangle.compress.vertical"),
        .init(title: ".expanded is for tool-heavy content.",
              detail: "Title bar above a separate toolbar row. More vertical chrome but lots of room for icon-bearing buttons.",
              symbol: "rectangle.expand.vertical"),
        .init(title: ".unified is the macOS Big Sur+ default.",
              detail: "Title bar merged with toolbar; same height as .unifiedCompact but with more spacious item layout.",
              symbol: "rectangle"),
        .init(title: "macOS-only API.",
              detail: "Other Apple platforms don't have a window toolbar concept. The modifier is a no-op when present in cross-platform code outside macOS.",
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

private struct PWTSCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    PresentedWindowToolbarStylePage()
        .frame(width: 1100, height: 900)
}
