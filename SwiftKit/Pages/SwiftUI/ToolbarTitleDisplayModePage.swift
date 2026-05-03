import SwiftUI

// SwiftUI .toolbarTitleDisplayMode(_:) + ToolbarTitleDisplayMode reference page.
// Sources:
//   Documentation/SwiftUI/toolbars/toolbartitledisplaymode(_:).md
//   Documentation/SwiftUI/toolbars/toolbartitledisplaymode.md
// macOS 14.0+ (compiles); per Apple docs: \"This modifier has no effect on macOS.\"
// Cases: .automatic, .inline, .inlineLarge, .large.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarTitleDisplayModePage: View {
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
            Text("View/toolbarTitleDisplayMode(_:) + ToolbarTitleDisplayMode")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures how a NavigationStack title renders. iOS-flavored \u{2014} per Apple's docs, the modifier has NO EFFECT on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbartitledisplaymode(_:).md \u{00b7} macOS 14.0+ (no-op on macOS)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbarTitleDisplayMode(.inlineLarge)") {
            NavigationStack {
                Text("On macOS the title chrome is owned by the window \u{2014} this modifier compiles but does not change rendering.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationTitle("Document")
                    .toolbarTitleDisplayMode(.inlineLarge)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "ToolbarTitleDisplayMode \u{2014} four cases") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".automatic \u{2014} system default per platform/context", systemImage: "wand.and.stars")
                    Label(".inline \u{2014} small inline title (iOS top bar)", systemImage: "text.alignleft")
                    Label(".inlineLarge \u{2014} large inline title", systemImage: "textformat.size.larger")
                    Label(".large \u{2014} dropdown large title that scrolls into inline", systemImage: "arrow.up.left.and.arrow.down.right")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }

            VariantBlock(title: "Compiled but inert on macOS") {
                APICallout(".toolbarTitleDisplayMode(.large) // no rendering change on macOS")
                Text("Apple explicitly documents the no-op behavior: \"This modifier has no effect on macOS.\" Use it for cross-platform code; rely on .navigationTitle and Scene-level modifiers (.windowToolbarStyle) for macOS title chrome.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Cross-platform shape") {
                APICallout("nonisolated func toolbarTitleDisplayMode(_ mode: ToolbarTitleDisplayMode) -> some View")
                Text("Same call site on every platform. The macOS title chrome ignores the value but the call is safe to leave in place.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "iOS-flavored \u{2014} no effect on macOS.",
              detail: "Apple's docs are explicit: this modifier has no effect on macOS. Treat it as cross-platform plumbing that influences only iOS / iPadOS / Mac Catalyst rendering.",
              symbol: "iphone"),
        .init(title: "Available since macOS 14 (compiles).",
              detail: "The symbol exists from macOS 14.0+ \u{2014} you can call it freely from macOS 26 code without availability guards. It just won't change anything on the Mac.",
              symbol: "calendar"),
        .init(title: "Four cases.",
              detail: ".automatic / .inline / .inlineLarge / .large. The latter three only matter on platforms with a navigation bar that renders large titles (iOS / iPadOS).",
              symbol: "list.bullet"),
        .init(title: "For macOS title-chrome control, use other knobs.",
              detail: "macOS title display is governed by .navigationTitle, .navigationSubtitle, the Scene-level .windowToolbarStyle (showsTitle:) variants, and .windowStyle(.hiddenTitleBar). Not by toolbarTitleDisplayMode.",
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
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

#Preview {
    ToolbarTitleDisplayModePage()
        .frame(width: 1100, height: 900)
}
