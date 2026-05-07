import SwiftUI

// SwiftUI `WindowStyle` + `Scene/windowStyle(_:)` reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowstyle.md      (protocol + conforming types)
//   Documentation/SwiftUI/windows/windowstyle(_:).md  (scene modifier)
// macOS 11.0+. Five built-in styles: .automatic, .titleBar, .hiddenTitleBar,
// .plain, .volumetric (volumetric is visionOS-only in practice).

struct WindowStyleGalleryPage: View {
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
            Text("WindowStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the appearance and interaction of windows in a scene. Applied with .windowStyle(_:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowstyle.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "WindowGroup { ContentView() }.windowStyle(.automatic)",
            code: """
            WindowGroup {
                ContentView()
            }
            .windowStyle(.automatic)
            """,
            note: "Default \u{2014} the system chooses a sensible style for the platform and scene type."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(styles, id: \.api) { style in
                VariantBlock(title: style.title) {
                    WindowSnippet(
                        api: ".windowStyle(\(style.api))",
                        code: """
                        WindowGroup {
                            ContentView()
                        }
                        .windowStyle(\(style.api))
                        """,
                        note: style.note
                    )
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Window styles are scene-level configuration \u{2014} they apply to every window the scene creates and cannot be changed per-instance at runtime.")
                .font(.callout)
                .foregroundStyle(.secondary)
            BehaviorList(items: [
                ".automatic \u{2014} system picks a default appropriate to the scene type and platform.",
                ".titleBar \u{2014} standard chrome with a visible title bar.",
                ".hiddenTitleBar \u{2014} chrome present but title strip hidden; window controls still visible.",
                ".plain \u{2014} no window chrome at all (used with custom drag regions).",
                ".volumetric \u{2014} visionOS 3D scene container; not produced on macOS."
            ])
        }
    }

    // MARK: Notes

    private struct WSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WSNote] = [
        .init(title: "WindowStyle is a protocol with five system conformers.",
              detail: "Conforming types: DefaultWindowStyle, TitleBarWindowStyle, HiddenTitleBarWindowStyle, PlainWindowStyle, VolumetricWindowStyle. Each has a static accessor on WindowStyle (\u{2018}.automatic\u{2019}, \u{2018}.titleBar\u{2019}, etc.) for use at the call site.",
              symbol: "checklist"),
        .init(title: ".plain pairs with a custom drag region.",
              detail: "Removing all chrome means there is nothing to drag the window by. Add WindowDragGesture (or .windowBackgroundDragBehavior(.enabled)) so users can still move the window.",
              symbol: "hand.draw"),
        .init(title: ".hiddenTitleBar still draws traffic-light controls.",
              detail: "It only hides the title strip. The close/minimize/zoom buttons remain. To hide them too, you also need toolbar configuration or AppKit fallback.",
              symbol: "square.dashed"),
        .init(title: "Pair .titleBar with .windowToolbarStyle(\u{2026}) to control the toolbar look.",
              detail: "WindowStyle controls the chrome envelope; WindowToolbarStyle controls how the toolbar inside the chrome renders. They compose.",
              symbol: "rectangle.topthird.inset.filled"),
        .init(title: ".volumetric is a visionOS WindowGroup style; it has no macOS effect.",
              detail: "Pairs with .defaultSize(width:height:depth:) (or the Size3D-in-meters variant) to declare the immutable bounds of the volumetric scene.",
              symbol: "cube"),
        .init(title: "View/presentedWindowStyle(_:) is the inverse: applied on a View.",
              detail: ".presentedWindowStyle(\u{2026}) sets the style of windows opened via interactions originating from the modified view, rather than the scene's own windows.",
              symbol: "arrow.up.right.square")
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

    // MARK: Style table

    private struct StyleEntry {
        let title: String
        let api: String
        let note: String
    }

    private let styles: [StyleEntry] = [
        .init(title: ".automatic \u{2014} DefaultWindowStyle",
              api: ".automatic",
              note: "System default. Equivalent to .titleBar on macOS for most scenes."),
        .init(title: ".titleBar \u{2014} TitleBarWindowStyle",
              api: ".titleBar",
              note: "Standard macOS window with title strip and traffic-light controls."),
        .init(title: ".hiddenTitleBar \u{2014} HiddenTitleBarWindowStyle",
              api: ".hiddenTitleBar",
              note: "Hides the title text but keeps the chrome and window controls."),
        .init(title: ".plain \u{2014} PlainWindowStyle",
              api: ".plain",
              note: "No window chrome. Pair with WindowDragGesture so users can still move the window."),
        .init(title: ".volumetric \u{2014} VolumetricWindowStyle",
              api: ".volumetric",
              note: "visionOS 3D scene container. macOS does not produce volumetric windows.")
    ]
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

extension WindowStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowStyle",
        title: "WindowStyle",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowStyle",
            "Scene/windowStyle(_:)",
            "View/presentedWindowStyle(_:)",
            "Customizing window styles and state-restoration behavior in macOS"
        ],
        blurb: "A specification for the appearance and interaction of a window. Built-in styles include automatic, hiddenTitleBar, plain, titleBar, and volumetric.",
        signature: "protocol WindowStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/windows/windowstyle.md",
        page: { AnyView(WindowStyleGalleryPage()) }
    )
}

#Preview {
    WindowStyleGalleryPage()
        .frame(width: 1100, height: 800)
}
