import SwiftUI

// SwiftUI `HSplitView` reference page.
// Source: Documentation/SwiftUI/navigation/hsplitview.md
// macOS 10.15+ (macOS-only). A layout container that arranges its children in a
// horizontal line and lets the user resize them with dividers between them.
// Predates NavigationSplitView — still useful for non-navigational split layouts
// like an inspector + canvas + outline pane in a creative-tools window.
// Initializer: init(content:)

private let demoFrameWidth: CGFloat = 600
private let demoFrameHeight: CGFloat = 240

struct HSplitViewGalleryPage: View {
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
            Text("HSplitView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A layout container that arranges its children in a horizontal line and allows the user to resize them using dividers placed between them.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/hsplitview.md · macOS 10.15+ (macOS-only)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "HSplitView { paneA; paneB }") {
            HSplitView {
                pane("Left",  systemImage: "rectangle.lefthalf.filled")
                pane("Right", systemImage: "rectangle.righthalf.filled")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Two panes") {
                DemoCard(api: "HSplitView { paneA; paneB }") {
                    HSplitView {
                        pane("Outline", systemImage: "list.bullet.indent")
                        pane("Canvas",  systemImage: "rectangle.dashed")
                    }
                }
            }
            VariantBlock(title: "Three panes — outline + canvas + inspector") {
                DemoCard(api: "HSplitView { paneA; paneB; paneC }") {
                    HSplitView {
                        pane("Outline",   systemImage: "list.bullet.indent")
                        pane("Canvas",    systemImage: "rectangle.dashed")
                        pane("Inspector", systemImage: "slider.horizontal.3")
                    }
                }
            }
            VariantBlock(title: "With min-width frames — clamp resize range") {
                DemoCard(api: ".frame(minWidth: …) on each pane") {
                    HSplitView {
                        pane("Outline", systemImage: "list.bullet.indent")
                            .frame(minWidth: 120)
                        pane("Canvas",  systemImage: "rectangle.dashed")
                            .frame(minWidth: 200)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("HSplitView's resize state lives in the AppKit divider — there's no SwiftUI-side binding. Drag the divider in the demo above to resize.")
                .font(.callout)
                .foregroundStyle(.secondary)
            APICallout("// No public Binding — divider position is implicit AppKit state.")
        }
    }

    private func pane(_ title: String, systemImage: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: systemImage)
                .font(.system(size: 28))
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background.secondary)
    }

    // MARK: Notes

    private struct HSVNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [HSVNote] = [
        .init(title: "macOS-only — predates NavigationSplitView.",
              detail: "HSplitView is a thin SwiftUI wrapper over AppKit's NSSplitView. It exists since SwiftUI 1.0 (macOS 10.15) and remains the lowest-level horizontal-splitter primitive on macOS.",
              symbol: "macwindow"),
        .init(title: "Use for layout splitters, not navigation.",
              detail: "If selections in one pane drive the contents of another, reach for NavigationSplitView. HSplitView is for cases where the panes are coequal — outline + canvas + inspector in a creative tool, source + diff in a code reviewer.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Constrain pane sizes with .frame(minWidth:idealWidth:maxWidth:).",
              detail: "There's no dedicated column-width modifier. Apply standard SwiftUI frame modifiers to each pane to clamp the divider's resize range — the divider honors min/max widths automatically.",
              symbol: "ruler"),
        .init(title: "No selection or routing — composition only.",
              detail: "HSplitView doesn't carry a selection binding, doesn't integrate with NavigationLink, and doesn't expose its divider position as a Binding. It's a plain container."
              , symbol: "square.split.2x1"),
        .init(title: "Pairs naturally with VSplitView for orthogonal splits.",
              detail: "Nest a VSplitView inside an HSplitView (or vice versa) to build IDE-like layouts: horizontal split between outline and editor, then vertical split inside the editor for source + console.",
              symbol: "rectangle.split.2x2")
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

private struct DemoCard<Content: View>: View {
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

extension HSplitViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.hSplitView",
        title: "HSplitView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "HSplitView"
        ],
        blurb: "A layout container that arranges its children in a horizontal line and lets the user resize them with dividers placed between them. macOS-specific.",
        signature: "struct HSplitView<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/navigation/hsplitview.md",
        page: { AnyView(HSplitViewGalleryPage()) }
    )
}

#Preview {
    HSplitViewGalleryPage()
        .frame(width: 1100, height: 800)
}
