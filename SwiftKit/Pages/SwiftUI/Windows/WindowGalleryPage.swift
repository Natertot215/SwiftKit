import SwiftUI

// SwiftUI `Window` reference page (consolidated).
// Source: Documentation/SwiftUI/windows/window.md
// Window is a Scene that produces a single, unique window. macOS 13.0+.
// SwiftKit itself uses Window — see SwiftKit/App/SwiftKitApp.swift.
//
// This page also absorbs the following Window-family modifier orphans
// (folded as additional Variant / Note sections):
//   • Scene/windowBackgroundDragBehavior(_:)         macOS 15.0+
//   • WindowResizability + Scene/windowResizability(_:)   macOS 13.0+
//   • WindowIdealSize + Scene/windowIdealSize(_:)         macOS 15.0+
//   • WindowLayoutRoot                                    macOS 15.0+
//   • WindowProxy                                         macOS 15.0+ (visionOS 2.0+)
//   • View/windowToolbarFullScreenVisibility(_:) + WindowToolbarFullScreenVisibility    macOS 15.0+
//   • Scene/windowToolbarLabelStyle(_:) + (fixed:)        macOS 15.0+

struct WindowGalleryPage: View {
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
            Text("Window")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A scene that presents its content in a single, unique window. This page also covers the Window-family modifiers: background drag, resizability, ideal size, layout root, window proxy, toolbar full-screen visibility, and toolbar label style.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/window.md \u{00b7} macOS 13.0+ (modifiers macOS 13.0\u{2013}15.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "Window(\"Connection Doctor\", id: \"connection-doctor\") { ConnectionDoctor() }",
            code: """
            @main
            struct Mail: App {
                var body: some Scene {
                    WindowGroup {
                        MailViewer()
                    }
                    Window("Connection Doctor", id: "connection-doctor") {
                        ConnectionDoctor()
                    }
                }
            }
            """,
            note: "Single-instance auxiliary window alongside the main WindowGroup."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 32) {

            // ─── Window scene itself ─────────────────────────────────────

            SectionHeader(title: "Window — the scene", subtitle: "Single-instance scene declarations")
            VStack(alignment: .leading, spacing: 24) {
                VariantBlock(title: "Auxiliary single-instance window") {
                    WindowSnippet(
                        api: "Window(_:id:content:) \u{2014} singleton, brought-to-front on second open",
                        code: """
                        Window("Connection Doctor", id: "connection-doctor") {
                            ConnectionDoctor()
                        }
                        """,
                        note: "Calling openWindow(id:) when the window is already open just brings it forward — there is no second instance."
                    )
                }

                VariantBlock(title: "Main scene of an app") {
                    WindowSnippet(
                        api: "Window as the App's only Scene \u{2014} app quits when window closes",
                        code: """
                        @main
                        struct VideoCall: App {
                            var body: some Scene {
                                Window("VideoCall", id: "main") {
                                    CameraView()
                                }
                            }
                        }
                        """,
                        note: "Different from WindowGroup: a single-Window app terminates when the window closes. WindowGroup apps keep running."
                    )
                }

                VariantBlock(title: "SwiftKit's own usage") {
                    WindowSnippet(
                        api: "Window(\"SwiftKit\", id: \"swiftkit-main\") { ContentView() }",
                        code: """
                        @main
                        struct SwiftKitApp: App {
                            var body: some Scene {
                                Window("SwiftKit", id: "swiftkit-main") {
                                    ContentView()
                                }
                                .windowToolbarStyle(.unified(showsTitle: false))
                            }
                        }
                        """,
                        note: "SwiftKit is a single-window reference app, so Window is correct here. See SwiftKit/App/SwiftKitApp.swift."
                    )
                }
            }

            // ─── windowBackgroundDragBehavior(_:) ────────────────────────

            SectionHeader(
                title: "Scene/windowBackgroundDragBehavior(_:)",
                subtitle: "macOS 15.0+ \u{00b7} Three values from WindowInteractionBehavior"
            )
            VStack(alignment: .leading, spacing: 24) {
                VariantBlock(title: ".automatic \u{2014} system default") {
                    WindowSnippet(
                        api: ".windowBackgroundDragBehavior(.automatic)",
                        code: """
                        Window(\u{2026}) { ContentView() }
                            .windowBackgroundDragBehavior(.automatic)
                        """,
                        note: "Equivalent to omitting the modifier. The framework picks based on the scene's other configuration."
                    )
                }

                VariantBlock(title: ".enabled \u{2014} drag the window from anywhere on its background") {
                    WindowSnippet(
                        api: ".windowBackgroundDragBehavior(.enabled)",
                        code: """
                        Window("About MyApp", id: "about") {
                            AboutView()
                        }
                        .windowBackgroundDragBehavior(.enabled)
                        """,
                        note: "Equivalent to attaching a WindowDragGesture to the window's background view. Useful for chrome-less windows."
                    )
                }

                VariantBlock(title: ".disabled \u{2014} background drag suppressed") {
                    WindowSnippet(
                        api: ".windowBackgroundDragBehavior(.disabled)",
                        code: """
                        Window(\u{2026}) { ContentView() }
                            .windowBackgroundDragBehavior(.disabled)
                        """,
                        note: "Use when the background should not move the window \u{2014} for example, a fixed-position widget."
                    )
                }
            }

            // ─── WindowResizability + Scene/windowResizability(_:) ───────

            SectionHeader(
                title: "WindowResizability + Scene/windowResizability(_:)",
                subtitle: "macOS 13.0+ \u{00b7} .automatic / .contentMinSize / .contentSize"
            )
            VStack(alignment: .leading, spacing: 24) {
                VariantBlock(title: ".automatic \u{2014} system picks per scene type") {
                    WindowSnippet(
                        api: ".windowResizability(.automatic)",
                        code: """
                        WindowGroup { ContentView() }
                            .windowResizability(.automatic)
                        """,
                        note: "WindowGroup, Window \u{2192} .contentMinSize. Settings, volumetric \u{2192} .contentSize. The default if you omit the modifier."
                    )
                }

                VariantBlock(title: ".contentMinSize \u{2014} content's min derived; max is open") {
                    WindowSnippet(
                        api: ".windowResizability(.contentMinSize)",
                        code: """
                        WindowGroup {
                            ContentView()
                                .frame(minWidth: 400, minHeight: 300)
                        }
                        .windowResizability(.contentMinSize)
                        """,
                        note: "Window enforces the content's minimum frame; users can resize freely above that."
                    )
                }

                VariantBlock(title: ".contentSize \u{2014} content's min and max are the window's bounds") {
                    WindowSnippet(
                        api: ".windowResizability(.contentSize)",
                        code: """
                        WindowGroup {
                            ContentView()
                                .frame(
                                    minWidth: 100, maxWidth: 400,
                                    minHeight: 100, maxHeight: 400)
                        }
                        .windowResizability(.contentSize)
                        """,
                        note: "Window resize is clamped to the content's min/max bounds in both dimensions \u{2014} useful for fixed-size palettes."
                    )
                }
            }

            // ─── WindowIdealSize + Scene/windowIdealSize(_:) ─────────────

            SectionHeader(
                title: "WindowIdealSize + Scene/windowIdealSize(_:)",
                subtitle: "macOS 15.0+ \u{00b7} .automatic / .fitToContent / .maximum"
            )
            VStack(alignment: .leading, spacing: 24) {
                VariantBlock(title: ".automatic \u{2014} system default behavior") {
                    WindowSnippet(
                        api: ".windowIdealSize(.automatic)",
                        code: """
                        WindowGroup { ContentView() }
                            .windowIdealSize(.automatic)
                        """,
                        note: "Same effect as .maximum on macOS 15."
                    )
                }

                VariantBlock(title: ".fitToContent \u{2014} zoom to the content's ideal size") {
                    WindowSnippet(
                        api: ".windowIdealSize(.fitToContent)",
                        code: """
                        WindowGroup {
                            ContentView()
                                .frame(idealWidth: 800, idealHeight: 600)
                        }
                        .windowIdealSize(.fitToContent)
                        """,
                        note: "Zoom snaps the window to the content's idealWidth / idealHeight rather than the screen bounds."
                    )
                }

                VariantBlock(title: ".maximum \u{2014} zoom to the largest available size") {
                    WindowSnippet(
                        api: ".windowIdealSize(.maximum)",
                        code: """
                        WindowGroup { ContentView() }
                            .windowIdealSize(.maximum)
                        """,
                        note: "Equivalent to the historical macOS green-button behavior \u{2014} go as large as possible within the display's visible area."
                    )
                }
            }

            // ─── WindowLayoutRoot ────────────────────────────────────────

            SectionHeader(
                title: "WindowLayoutRoot",
                subtitle: "macOS 15.0+ / visionOS 2.0+ \u{00b7} Proxy for a window's root content"
            )
            VStack(alignment: .leading, spacing: 24) {
                VariantBlock(title: "sizeThatFits(_:) \u{2014} the only documented method") {
                    WindowSnippet(
                        api: "func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize",
                        code: """
                        let unspecified = content.sizeThatFits(.unspecified)
                        let constrainedHeight = content.sizeThatFits(
                            ProposedViewSize(width: nil, height: 600)
                        )
                        let constrainedWidth = content.sizeThatFits(
                            ProposedViewSize(width: 800, height: nil)
                        )
                        """,
                        note: "Pass .unspecified for the content's natural size, or constrain one axis to ask \u{201C}what's the other axis if I cap this one?\u{201D}"
                    )
                }

                VariantBlock(title: "Used inside windowIdealPlacement") {
                    WindowSnippet(
                        api: ".windowIdealPlacement { content, context in \u{2026} }",
                        code: """
                        WindowGroup { ContentView() }
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
                        note: "Ask the content how tall it wants to be at full screen height, then return that as the zoom placement."
                    )
                }
            }

            // ─── WindowProxy ─────────────────────────────────────────────

            SectionHeader(
                title: "WindowProxy",
                subtitle: "visionOS 2.0+ \u{00b7} also exposed via WindowPlacementContext on macOS 15+"
            )
            VStack(alignment: .leading, spacing: 24) {
                VariantBlock(title: "Documented properties: id and phase") {
                    WindowSnippet(
                        api: "WindowProxy.id (String?) and WindowProxy.phase (ScenePhase)",
                        code: """
                        for window in context.windows {
                            print("\\(window.id ?? \"<unidentified>\") \u{2014} phase: \\(window.phase)")
                        }
                        """,
                        note: "id matches the string passed to Window(id:) / WindowGroup(id:). phase is .active, .inactive, or .background \u{2014} the same enum used by @Environment(\\.scenePhase)."
                    )
                }

                VariantBlock(title: "Pair with WindowPlacement.Position helpers") {
                    WindowSnippet(
                        api: "WindowPlacement(.trailing(windowProxy))",
                        code: """
                        .defaultWindowPlacement { content, context in
                            if let editor = context.windows.first(where: { $0.id == "editor" }) {
                                return WindowPlacement(.trailing(editor))
                            }
                            return WindowPlacement()
                        }
                        """,
                        note: "Use the WindowProxy as the anchor for a relative WindowPlacement.Position case."
                    )
                }
            }

            // ─── View/windowToolbarFullScreenVisibility(_:) ──────────────

            SectionHeader(
                title: "View/windowToolbarFullScreenVisibility(_:)",
                subtitle: "macOS 15.0+ \u{00b7} .automatic / .visible / .onHover"
            )
            VStack(alignment: .leading, spacing: 24) {
                VariantBlock(title: ".automatic \u{2014} system default (visible)") {
                    WindowSnippet(
                        api: ".windowToolbarFullScreenVisibility(.automatic)",
                        code: """
                        ContentView()
                            .toolbar { /* items */ }
                            .windowToolbarFullScreenVisibility(.automatic)
                        """,
                        note: "Equivalent to omitting the modifier. Toolbar shows at the display top, above the window content."
                    )
                }

                VariantBlock(title: ".visible \u{2014} always shown") {
                    WindowSnippet(
                        api: ".windowToolbarFullScreenVisibility(.visible)",
                        code: """
                        .windowToolbarFullScreenVisibility(.visible)
                        """,
                        note: "Same default behavior, made explicit."
                    )
                }

                VariantBlock(title: ".onHover \u{2014} hidden until the cursor reaches the menu-bar zone") {
                    WindowSnippet(
                        api: ".windowToolbarFullScreenVisibility(.onHover)",
                        code: """
                        struct RootView: View {
                            var body: some View {
                                ContentView()
                                    .toolbar { /* items */ }
                                    .windowToolbarFullScreenVisibility(.onHover)
                            }
                        }
                        """,
                        note: "Reveals on cursor proximity. Best for media-viewing surfaces where toolbar chrome competes with content."
                    )
                }
            }

            // ─── Scene/windowToolbarLabelStyle ───────────────────────────

            SectionHeader(
                title: "Scene/windowToolbarLabelStyle",
                subtitle: "macOS 15.0+ \u{00b7} Two surfaces: binding-driven and fixed"
            )
            VStack(alignment: .leading, spacing: 24) {
                VariantBlock(title: "Fixed \u{2014} .windowToolbarLabelStyle(fixed:)") {
                    WindowSnippet(
                        api: ".windowToolbarLabelStyle(fixed: ToolbarLabelStyle)",
                        code: """
                        @main
                        struct MyApp: App {
                            var body: some Scene {
                                WindowGroup {
                                    ContentView()
                                        .toolbar(id: "browserToolbar") { /* items */ }
                                }
                                .windowToolbarLabelStyle(fixed: .iconOnly)
                            }
                        }
                        """,
                        note: "Use when the label style is non-negotiable for the app. The user has no UI to change it."
                    )
                }

                VariantBlock(title: "User-configurable \u{2014} .windowToolbarLabelStyle(_:) with a Binding") {
                    WindowSnippet(
                        api: ".windowToolbarLabelStyle($labelStyle) // backed by @AppStorage",
                        code: """
                        @main
                        struct MyApp: App {
                            @AppStorage("ToolbarLabelStyle")
                            private var labelStyle: ToolbarLabelStyle = .iconOnly

                            var body: some Scene {
                                WindowGroup {
                                    ContentView()
                                        .toolbar(id: "browserToolbar") { /* items */ }
                                }
                                .windowToolbarLabelStyle($labelStyle)
                            }
                        }
                        """,
                        note: "Bind to @AppStorage so the toolbar's Customize\u{2026} sheet can let the user pick icon-only, title-only, or both — and the choice persists across launches."
                    )
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Programmatic open / dismiss") {
                WindowSnippet(
                    api: "@Environment(\\.openWindow) / @Environment(\\.dismiss)",
                    code: """
                    struct OpenConnectionDoctorButton: View {
                        @Environment(\\.openWindow) private var openWindow
                        var body: some View {
                            Button("Connection doctor") {
                                openWindow(id: "connection-doctor")
                            }
                        }
                    }

                    struct ConnectionDoctor: View {
                        @Environment(\\.dismiss) private var dismiss
                        var body: some View {
                            Button("Dismiss") { dismiss() }
                        }
                    }
                    """,
                    note: "openWindow(id:) brings the existing instance forward instead of creating a duplicate. dismiss() closes the window when called from its root."
                )
            }

            VariantBlock(title: "windowBackgroundDragBehavior \u{2014} behaviors") {
                BehaviorList(items: [
                    "Scene modifier \u{2014} attach to the Scene declaration, not the View.",
                    "Reuses the same WindowInteractionBehavior enum as the four behavior View modifiers (.automatic / .enabled / .disabled).",
                    "Pair .enabled with .windowStyle(.plain) or .hiddenTitleBar for windows that lack a draggable title bar.",
                    "Inserts a window-wide drag gesture; for finer control use WindowDragGesture on a specific subview.",
                    "macOS-only \u{2014} no equivalent on iOS / iPadOS / visionOS."
                ])
            }

            VariantBlock(title: "windowResizability \u{2014} behaviors") {
                BehaviorList(items: [
                    ".automatic varies by scene: WindowGroup/Window \u{2192} .contentMinSize, Settings \u{2192} .contentSize.",
                    ".contentMinSize: window has a minimum derived from content, no upper limit beyond the screen.",
                    ".contentSize: window matches the content frame's min and max in both dimensions.",
                    "Pair with .frame(minWidth:maxWidth:minHeight:maxHeight:) on the content for the bounds to take effect.",
                    "Volumetric windows (visionOS) always use .contentSize regardless of this modifier."
                ])
            }

            VariantBlock(title: "windowIdealSize \u{2014} behaviors") {
                BehaviorList(items: [
                    "Affects the green zoom button only \u{2014} doesn't change the window's initial size (use .defaultSize for that).",
                    "Option-clicking the green button performs a zoom rather than entering full screen.",
                    ".fitToContent requires the content view to declare ideal dimensions via .frame(idealWidth: \u{2026}, idealHeight: \u{2026}).",
                    "If you need fully custom zoom geometry, use .windowIdealPlacement(_:) instead \u{2014} it gives you a closure with WindowLayoutRoot + WindowPlacementContext.",
                    ".automatic and .maximum behave identically today; .automatic future-proofs the call site if defaults change."
                ])
            }

            VariantBlock(title: "WindowLayoutRoot \u{2014} behaviors") {
                BehaviorList(items: [
                    "Only constructible by SwiftUI \u{2014} you receive it as a closure parameter, never instantiate it.",
                    "Two scene modifiers receive it: .defaultWindowPlacement(_:) and .windowIdealPlacement(_:).",
                    "Equally available on macOS 15+ and visionOS 2+.",
                    "Pair with WindowPlacementContext (the second closure parameter) for screen and window awareness.",
                    "Combine sizeThatFits results with DisplayProxy.visibleRect to position windows relative to the screen."
                ])
            }

            VariantBlock(title: "WindowProxy \u{2014} behaviors") {
                BehaviorList(items: [
                    "id is the string identifier you passed to Window(id:) / WindowGroup(id:). Optional \u{2014} unidentified scenes report nil.",
                    "phase is a ScenePhase value: .active (frontmost), .inactive (visible but not active), .background (minimized / hidden).",
                    "WindowProxy is a value type; treat it as a snapshot, not a live reference.",
                    "On macOS, you receive WindowProxy values through WindowPlacementContext.windows.",
                    "On visionOS 2+, an @Environment(\\.windowProxy) accessor exposes the proxy for the current window directly."
                ])
            }

            VariantBlock(title: "windowToolbarFullScreenVisibility \u{2014} behaviors") {
                BehaviorList(items: [
                    "View modifier \u{2014} attach to the window's content, not the Scene.",
                    "Only takes effect once the window is in full-screen mode \u{2014} normal mode is unaffected.",
                    ".onHover hides the toolbar until the cursor approaches the menu-bar area; consistent with how the system menu bar reveals.",
                    "Pair with .toolbar { \u{2026} } so there's a toolbar to govern in the first place.",
                    "Pre-macOS-15 apps used AppKit (NSToolbar.fullScreenAccessoryView, presentation options) for the same effect."
                ])
            }

            VariantBlock(title: "windowToolbarLabelStyle \u{2014} behaviors") {
                BehaviorList(items: [
                    "ToolbarLabelStyle is the value type \u{2014} typical cases: .iconOnly, .titleOnly, .titleAndIcon.",
                    "The fixed: form locks the choice; the Binding form exposes it to the user.",
                    "Pair with .toolbar(id: \u{2026}) so SwiftUI knows which toolbar to apply the label style to.",
                    "The Binding form is what surfaces the \u{201C}Show: Icon / Text / Both\u{201D} option in macOS toolbar customization.",
                    "Persist the binding via @AppStorage to maintain the user's preference."
                ])
            }
        }
    }

    // MARK: Notes

    private struct WNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WNote] = [
        // Window scene
        .init(title: "Window vs WindowGroup is about cardinality.",
              detail: "Window is for exactly-one-instance scenes (settings, an inspector, an auxiliary panel). WindowGroup creates new instances per openWindow call. Pick Window when duplicating doesn't make semantic sense.",
              symbol: "1.square"),
        .init(title: "Window apps quit when the last window closes; WindowGroup apps keep running.",
              detail: "If your only Scene is a Window, closing it terminates the process — that matches the macOS expectation for single-purpose apps. WindowGroup keeps the menu bar app alive even with zero windows.",
              symbol: "power"),
        .init(title: "navigationTitle dynamically overrides the title bar text.",
              detail: "The string passed to Window's initializer drives the Window menu listing. Apply .navigationTitle(\u{2026}) inside the content to update the title bar in response to state, while keeping the menu label stable.",
              symbol: "character.cursor.ibeam"),
        .init(title: "Volumetric style is unavailable on Window.",
              detail: "Per Apple's documentation, Windows created with Window do not support .volumetric. Use WindowGroup for visionOS volumetric scenes.",
              symbol: "cube"),
        .init(title: "Multiple Window scenes get separate identifiers and separate state.",
              detail: "Declaring more than one Window in the App body is the standard way to add inspectors, log windows, or settings panels. Each gets its own id.",
              symbol: "rectangle.split.3x1"),
        // windowBackgroundDragBehavior
        .init(title: "windowBackgroundDragBehavior is a Scene modifier.",
              detail: "Unlike windowDismissBehavior / windowMinimizeBehavior etc. (which attach to the View), windowBackgroundDragBehavior attaches to the Scene. Per Apple, .enabled is equivalent to adding a WindowDragGesture to the window's background view.",
              symbol: "hand.draw"),
        .init(title: "Pair background drag with chrome-less window styles.",
              detail: "Using .windowStyle(.plain) removes the title bar \u{2014} meaning users have no built-in way to drag. Add .windowBackgroundDragBehavior(.enabled) so the window stays movable. macOS 15+ only; pre-15 used NSWindow.isMovableByWindowBackground.",
              symbol: "rectangle.dashed"),
        // windowResizability
        .init(title: "Resizability is opinionated about your frame modifier.",
              detail: ".contentSize and .contentMinSize both look at the content's .frame(min/maxWidth:min/maxHeight:). If you don't supply that, the framework falls back to whatever the content naturally sizes to.",
              symbol: "rectangle.expand.vertical"),
        .init(title: "Use .contentSize for inspectors and About windows.",
              detail: "Apple's documented About / Welcome examples pair .contentSize with .windowMinimizeBehavior(.disabled) and .windowResizeBehavior(.disabled). The user can't grow the window past its content frame.",
              symbol: "info.bubble"),
        .init(title: "Resizability composes with windowResizeBehavior(_:).",
              detail: "windowResizability(_:) sets the legal range; .windowResizeBehavior(_:) decides whether the user can resize at all. Use .contentSize + .windowResizeBehavior(.disabled) for truly fixed-size windows.",
              symbol: "lock.rectangle"),
        // windowIdealSize
        .init(title: "windowIdealSize controls the zoom button.",
              detail: ".automatic, .fitToContent, .maximum. Pick .fitToContent when zoom should reflect content (a video at native aspect ratio, a fixed-width article); pick .maximum or .automatic for the classic Mac \u{201C}fill the screen\u{201D} zoom. macOS 15+ only.",
              symbol: "arrow.up.left.and.arrow.down.right"),
        .init(title: ".windowIdealPlacement(_:) is the escape hatch for ideal size.",
              detail: "When neither .fitToContent nor .maximum captures what you want, swap to .windowIdealPlacement(_:) and compute a WindowPlacement programmatically using the content's sizeThatFits(\u{2026}) and the display's visibleRect. Apple's Destination Video sample uses this to maintain aspect ratio.",
              symbol: "function"),
        // WindowLayoutRoot
        .init(title: "WindowLayoutRoot is a proxy, not the content itself.",
              detail: "It doesn't expose the root view \u{2014} only its layout behavior via sizeThatFits(_:). You can't read or mutate the view from this type. Don't capture it across closure invocations \u{2014} the framework passes a fresh value each time.",
              symbol: "scope"),
        .init(title: "ProposedViewSize lets you constrain layout queries.",
              detail: "Pass .unspecified for the natural size, or use ProposedViewSize(width: nil, height: 600) to ask \u{201C}how wide if I cap height at 600?\u{201D} \u{2014} matches the SwiftUI layout protocol.",
              symbol: "ruler"),
        // WindowProxy
        .init(title: "WindowProxy: two surface properties \u{2014} id and phase.",
              detail: "Apple documents only WindowProxy.id (String?) and WindowProxy.phase (ScenePhase). Other affordances live on WindowPlacement helpers, not on the proxy itself. Use WindowProxy values from context.windows as the anchor for relative WindowPlacement.Position cases (.trailing, .leading, .above, .below).",
              symbol: "list.bullet"),
        .init(title: "WindowProxy access differs by platform.",
              detail: "macOS apps reach WindowProxy via WindowPlacementContext.windows. visionOS 2+ adds @Environment(\\.windowProxy) for the current window. Treat values as per-call snapshots; don't store them across closure invocations.",
              symbol: "info.circle"),
        // windowToolbarFullScreenVisibility
        .init(title: "Use .onHover for media-first surfaces.",
              detail: "Video players, presentation viewers, image-review apps benefit from a reveal-on-demand toolbar. .visible is right for productivity apps where chrome should always be reachable. .automatic and .visible behave the same; .onHover is the meaningful alternative.",
              symbol: "play.rectangle"),
        .init(title: "windowToolbarFullScreenVisibility is distinct from .toolbar(.hidden).",
              detail: ".toolbar(.hidden, for: .windowToolbar) hides the toolbar in all modes. windowToolbarFullScreenVisibility only affects full-screen presentation \u{2014} normal-mode chrome stays put. macOS 15+; pre-15 used NSWindow.toolbar plus NSApplication presentation options.",
              symbol: "rectangle.dashed"),
        // windowToolbarLabelStyle
        .init(title: "windowToolbarLabelStyle: two scene modifiers, one job.",
              detail: "Apple ships windowToolbarLabelStyle(_:) (Binding<ToolbarLabelStyle>) and windowToolbarLabelStyle(fixed: ToolbarLabelStyle). Pick the binding form when the user should be able to change it; pick the fixed form when they shouldn't. Both expect a customizable .toolbar(id: \u{2026}) toolbar.",
              symbol: "switch.2"),
        .init(title: "Pair the binding form with @AppStorage for persistence.",
              detail: "The Binding form is most useful when the bound value lives in @AppStorage so the choice survives app relaunches. Other persistence (@SceneStorage, custom storage) works too \u{2014} avoid plain @State here, since it resets when the scene rebuilds.",
              symbol: "externaldrive")
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

private struct SectionHeader: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(subtitle)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }
}

extension WindowGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.window",
        title: "Window",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "Window"
        ],
        blurb: "A scene that presents its content in a single, unique window. Use a Window scene to augment the main interface with secondary windows that give people access to supplemental functionality.",
        signature: "struct Window<Content> where Content : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/windows/window.md",
        page: { AnyView(WindowGalleryPage()) }
    )
}

#Preview {
    WindowGalleryPage()
        .frame(width: 1100, height: 800)
}
