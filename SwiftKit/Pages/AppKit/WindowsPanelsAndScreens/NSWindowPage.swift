import SwiftUI
import AppKit

// AppKit Windows, Panels, and Screens — dense reference page.
// Covers: NSWindow (class : NSResponder) — the primary macOS window surface.
// Also absorbs: NSWindowDelegate (protocol), NSWindowTab (class, macOS 10.13+),
// NSWindowTabGroup (class, macOS 10.13+).
// NSPanel is kept separate (D7 scope — distinct HIG concept for ancillary panels).
// Source: Documentation/AppKit/windows-panels-and-screens/nswindow.md
//
// Note: Direct instantiation of NSWindow is rarely needed in modern SwiftUI apps
// (use WindowGroup in App). This page documents the AppKit API for apps using
// NSApplicationDelegate / AppKit scenes, or embedding SwiftUI via NSHostingController.
// No live NSViewRepresentable bridge — window lifecycle cannot safely be exercised
// inside a SwiftUI preview without a full application context.

struct NSWindowPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            creationSection
        } variants: {
            referenceSection
        } states: {
            tabsAndDelegateSection
        } notes: {
            notesContent
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSWindow")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("The primary macOS window surface. Manages the on-screen presence, title bar, content area, and window controls for one independent window instance.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSResponder \u{00b7} Documentation/AppKit/windows-panels-and-screens/nswindow.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Creation section (Default render tab)

    private var creationSection: some View {
        Block(title: "NSWindow creation") {
            VStack(alignment: .leading, spacing: 16) {
                snippet("""
                // Designated initializer:
                let window = NSWindow(
                    contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
                    styleMask: [.titled, .closable, .miniaturizable, .resizable],
                    backing: .buffered,
                    defer: false
                )
                window.title = "My Window"
                window.center()
                window.makeKeyAndOrderFront(nil)     // show + bring to front + make key

                // Common styleMask options:
                // .titled              — title bar + system controls
                // .closable            — close button
                // .miniaturizable      — minimize button
                // .resizable           — resize handle
                // .fullSizeContentView — content extends behind title bar
                // .borderless          — chromeless (no title bar)
                // .unifiedTitleAndToolbar — fuses toolbar and title bar
                """)

                snippet("""
                // Embedding SwiftUI in NSWindow via NSHostingController:
                let hostingVC = NSHostingController(rootView: MySwiftUIView())
                let window = NSWindow(contentViewController: hostingVC)
                window.setContentSize(NSSize(width: 600, height: 400))
                window.title = "SwiftUI in NSWindow"
                window.makeKeyAndOrderFront(nil)

                // Window ordering:
                window.orderFront(nil)               // show without making key
                window.orderOut(nil)                 // hide (does not close)
                window.close()                       // close (releases if isReleasedWhenClosed)

                // Positioning:
                window.center()
                window.setFrameAutosaveName("MyWindow")   // persist frame to UserDefaults
                window.setFrame(NSRect(x: 100, y: 200, width: 800, height: 600), display: true, animate: true)
                """)

                snippet("""
                // Window level (z-order layer):
                window.level = .normal               // .floating / .screenSaver / .popUpMenu
                window.level = .floating             // stays above normal windows

                // Appearance and behavior:
                window.backgroundColor = .windowBackgroundColor   // semantic token
                window.hasShadow = true
                window.isMovableByWindowBackground = false
                window.collectionBehavior = [.managed, .fullScreenPrimary]
                window.titlebarAppearsTransparent = true          // glass title bar style
                window.toolbarStyle = .unified                    // macOS 11+
                """)

                APICallout("NSWindow(contentRect:styleMask:backing:defer:) — backing: always .buffered; defer: false draws immediately")
                APICallout("isReleasedWhenClosed = false — prevent deallocation on close when holding a strong reference")
            }
        }
    }

    // MARK: Reference section (Variants tab)

    @ViewBuilder
    private var referenceSection: some View {
        VStack(alignment: .leading, spacing: 24) {

            // NSWindowDelegate
            Block(title: "Reference — NSWindowDelegate protocol") {
                snippet("""
                // protocol NSWindowDelegate : NSObjectProtocol
                // Assign to window.delegate (weak reference).

                // Lifecycle:
                func windowShouldClose(_ sender: NSWindow) -> Bool
                func windowWillClose(_ notification: Notification)
                func windowWillMiniaturize(_ notification: Notification)
                func windowDidMiniaturize(_ notification: Notification)
                func windowDidDeminiaturize(_ notification: Notification)

                // Focus:
                func windowDidBecomeKey(_ notification: Notification)
                func windowDidResignKey(_ notification: Notification)
                func windowDidBecomeMain(_ notification: Notification)
                func windowDidResignMain(_ notification: Notification)

                // Resize:
                func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize
                func windowDidResize(_ notification: Notification)
                func windowWillStartLiveResize(_ notification: Notification)
                func windowDidEndLiveResize(_ notification: Notification)

                // Full screen:
                func windowWillEnterFullScreen(_ notification: Notification)
                func windowDidEnterFullScreen(_ notification: Notification)
                func windowWillExitFullScreen(_ notification: Notification)
                func windowDidExitFullScreen(_ notification: Notification)
                """)
            }

            // NSWindowTab
            Block(title: "Reference — NSWindowTab (macOS 10.13+)") {
                snippet("""
                // class NSWindowTab : NSObject
                // Represents a single tab within a tabbed window group.
                // Access via window.tab (an NSWindowTab instance).

                window.tab.title                     // String — defaults to window.title
                window.tab.toolTip                   // String? — tooltip on the tab strip
                window.tab.userInfo                  // Any? — arbitrary associated data

                // Programmatic tab management:
                windowA.addTabbedWindow(windowB, ordered: .above)
                window.moveTabToNewWindow(nil)        // detach current tab into a new window
                window.toggleTabBar(nil)             // show/hide the tab strip
                window.selectNextTab(nil)
                window.selectPreviousTab(nil)
                """)
            }

            // NSWindowTabGroup
            Block(title: "Reference — NSWindowTabGroup (macOS 10.13+)") {
                snippet("""
                // class NSWindowTabGroup : NSObject
                // Represents the collection of tabbed windows sharing one tab strip.
                // Access via window.tabGroup (NSWindowTabGroup?).

                guard let group = window.tabGroup else { /* window not tabbed */ }

                group.windows                        // [NSWindow] — all windows in the group
                group.selectedWindow                 // NSWindow? — currently visible tab
                group.identifier                     // String — shared among group members
                group.isTabBarVisible                // Bool
                group.isOverviewVisible              // Bool — the tab overview (spread)

                // Ordering:
                group.addWindow(newWindow)
                group.moveTabToNewWindow(window)     // same as window.moveTabToNewWindow

                // Notification:
                // NSWindowTabGroup.selectionDidChangeNotification
                """)
            }
        }
    }

    // MARK: Tabs + Delegate section (States tab)

    @ViewBuilder
    private var tabsAndDelegateSection: some View {
        VStack(alignment: .leading, spacing: 24) {

            // Delegate wiring
            Block(title: "Window Delegate — wiring and patterns") {
                snippet("""
                // Typical setup in NSWindowController or NSApplicationDelegate:
                class MyWindowController: NSWindowController, NSWindowDelegate {
                    override func windowDidLoad() {
                        super.windowDidLoad()
                        window?.delegate = self
                    }

                    func windowShouldClose(_ sender: NSWindow) -> Bool {
                        // Prompt to save unsaved changes before allowing close:
                        guard hasUnsavedChanges else { return true }
                        let alert = NSAlert()
                        alert.messageText = "Save changes before closing?"
                        alert.addButton(withTitle: "Save")
                        alert.addButton(withTitle: "Discard")
                        alert.addButton(withTitle: "Cancel")
                        let response = alert.runModal()
                        switch response {
                        case .alertFirstButtonReturn:  save(); return true
                        case .alertSecondButtonReturn: return true
                        default:                       return false
                        }
                    }

                    func windowWillResize(_ sender: NSWindow, to newSize: NSSize) -> NSSize {
                        // Enforce minimum dimensions:
                        return NSSize(width: max(newSize.width, 400),
                                      height: max(newSize.height, 300))
                    }
                }
                """)
            }

            // Window tabs usage
            Block(title: "Window Tabs — creating and managing") {
                snippet("""
                // Allow system-managed native tabs (set before showing window):
                window.tabbingMode = .automatic         // .automatic / .preferred / .disallowed
                window.tabbingIdentifier = "editor"     // windows with same ID can be tabbed

                // Programmatically add a second window as a tab:
                let second = NSWindow(contentViewController: secondVC)
                second.tabbingIdentifier = "editor"
                window.addTabbedWindow(second, ordered: .above)

                // Iterate tabs in the group:
                if let group = window.tabGroup {
                    for w in group.windows {
                        print(w.title, w.tab.toolTip ?? "")
                    }
                    group.selectedWindow = group.windows.last  // switch to last tab
                }

                // Respond to tab selection changes:
                NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(tabSelectionChanged),
                    name: NSWindowTabGroup.selectionDidChangeNotification,
                    object: window.tabGroup
                )
                """)
            }

            // Key notification reference
            Block(title: "Key Notifications") {
                snippet("""
                NSWindow.didBecomeKeyNotification
                NSWindow.didResignKeyNotification
                NSWindow.didBecomeMainNotification
                NSWindow.didResignMainNotification
                NSWindow.willCloseNotification
                NSWindow.didMiniaturizeNotification
                NSWindow.didDeminiaturizeNotification
                NSWindow.didResizeNotification
                NSWindow.willEnterFullScreenNotification
                NSWindow.didEnterFullScreenNotification
                NSWindow.willExitFullScreenNotification
                NSWindow.didExitFullScreenNotification
                NSWindowTabGroup.selectionDidChangeNotification   // macOS 10.13+
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "NSWindow is the AppKit window; NSPanel is its subclass for transient/ancillary UI (utility panels, custom dialogs). For new SwiftUI apps, prefer WindowGroup in your App struct — NSWindow is for pure AppKit apps or hybrid apps via NSHostingController.")
            noteRow("exclamationmark.triangle", "isReleasedWhenClosed defaults to true — the window deallocates when closed. If you hold a strong window reference in a controller, set window.isReleasedWhenClosed = false to prevent a crash on close.")
            noteRow("square.stack.3d.up", "window.level controls z-order layer. Most app windows use .normal. Use .floating for palettes, .popUpMenu for menus, .screenSaver for screen savers. Never use .status or above for standard app UI.")
            noteRow("rectangle.grid.1x2", "NSWindowTabGroup is the spine of native tabbed windows (introduced macOS 10.13, Sierra). The system creates and manages groups automatically when tabbingMode = .automatic and tabbingIdentifier matches. Prefer the system behavior over manual addTabbedWindow calls.")
            noteRow("arrow.up.left.and.arrow.down.right", "setFrameAutosaveName(_:) persists the window frame to UserDefaults so the window reopens at the same size/position. Call after makeKeyAndOrderFront to register the frame for the first time.")
            noteRow("paintbrush", "backgroundColor uses semantic color tokens (NSColor.windowBackgroundColor). Never hardcode a literal RGB — macOS vibrancy and dark mode will produce incorrect results.")
        }
    }

    // MARK: Helpers

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

// MARK: - Block helper

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    NSWindowPage().frame(width: 1100, height: 900)
}
