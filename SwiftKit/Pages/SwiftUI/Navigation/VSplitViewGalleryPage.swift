import SwiftUI

// SwiftUI `VSplitView` reference page.
// Source: Documentation/SwiftUI/navigation/vsplitview.md
// macOS 10.15+ (macOS-only). Vertical sibling of HSplitView. Children stack
// top-to-bottom with horizontal dividers the user can drag to resize.
// Initializer: init(content:)

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 320

struct VSplitViewGalleryPage: View {
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
            Text("VSplitView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A layout container that arranges its children in a vertical line and allows the user to resize them using dividers placed between them.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/vsplitview.md · macOS 10.15+ (macOS-only)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "VSplitView { paneA; paneB }") {
            VSplitView {
                pane("Editor",  systemImage: "doc.plaintext")
                pane("Console", systemImage: "terminal")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Two panes — editor + console") {
                DemoCard(api: "VSplitView { editor; console }") {
                    VSplitView {
                        pane("Editor",  systemImage: "doc.plaintext")
                        pane("Console", systemImage: "terminal")
                    }
                }
            }
            VariantBlock(title: "Three panes") {
                DemoCard(api: "VSplitView { paneA; paneB; paneC }") {
                    VSplitView {
                        pane("Toolbar",   systemImage: "hammer")
                        pane("Workspace", systemImage: "rectangle.dashed")
                        pane("Status",    systemImage: "info.circle")
                    }
                }
            }
            VariantBlock(title: "Mixed orthogonal split — VSplitView { HSplitView; pane }") {
                DemoCard(api: "VSplitView { HSplitView { … }; pane }") {
                    VSplitView {
                        HSplitView {
                            pane("Outline", systemImage: "list.bullet.indent")
                            pane("Source",  systemImage: "chevron.left.forwardslash.chevron.right")
                        }
                        pane("Console", systemImage: "terminal")
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Like HSplitView, VSplitView's divider state lives in AppKit. Drag the horizontal divider in the demos to resize.")
                .font(.callout)
                .foregroundStyle(.secondary)
            APICallout("// No public Binding — divider position is implicit AppKit state.")
        }
    }

    private func pane(_ title: String, systemImage: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: systemImage)
                .font(.system(size: 22))
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background.secondary)
    }

    // MARK: Notes

    private struct VSVNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [VSVNote] = [
        .init(title: "macOS-only — vertical sibling of HSplitView.",
              detail: "Same NSSplitView wrapper, just oriented vertically. The two compose freely — embed an HSplitView inside a VSplitView (or vice versa) for IDE-style layouts.",
              symbol: "macwindow"),
        .init(title: "Use for layout splitters, not navigation.",
              detail: "If selections drive what appears in another pane, use NavigationSplitView. VSplitView is for coequal stacked regions — editor + console, canvas + timeline, source + diff.",
              symbol: "rectangle.split.1x2"),
        .init(title: "Constrain pane heights with .frame(minHeight:idealHeight:maxHeight:).",
              detail: "There's no dedicated row-height modifier. Apply SwiftUI frame modifiers to each pane to clamp the divider's resize range.",
              symbol: "ruler"),
        .init(title: "Pairs with HSplitView for orthogonal splits.",
              detail: "VSplitView { HSplitView { outline; editor }; console } produces the classic Xcode / VS Code layout: a horizontal split on top, a console pinned beneath.",
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

extension VSplitViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.vSplitView",
        title: "VSplitView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "VSplitView"
        ],
        blurb: "A layout container that arranges its children in a vertical line and lets the user resize them with dividers placed between them. macOS-specific.",
        signature: "struct VSplitView<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/navigation/vsplitview.md",
        page: { AnyView(VSplitViewGalleryPage()) }
    )
}

#Preview {
    VSplitViewGalleryPage()
        .frame(width: 1100, height: 800)
}
