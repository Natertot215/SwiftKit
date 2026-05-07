import SwiftUI
import AppKit

// AppKit View Management — view controllers, split views, tab views, pages, media library.
//
// Absorbed leaves:
//   Content Controllers: NSWindowController, NSViewController, NSTitlebarAccessoryViewController
//   Split View Interface: NSSplitViewController, NSSplitViewItem
//   Tab View Interface:   NSTabViewController, NSTabViewItem
//   Paged Interface:      NSPageController
//   Media Library:        NSMediaLibraryBrowserController

// MARK: - Page

struct NSViewManagementPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                vcSection
                splitSection
                tabSection
                pageSection
                mediaSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View Management")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSWindowController, NSViewController, NSSplitViewController, NSTabViewController, NSPageController, and NSMediaLibraryBrowserController.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} NSViewController macOS 10.5+ \u{00b7} NSSplitViewController macOS 10.10+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var vcSection: some View {
        PageSection("Reference \u{2014} NSViewController / NSWindowController") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSViewController",
                    kind: "class : NSResponder",
                    availability: "macOS 10.5+",
                    blurb: "Manages a single NSView and its subviews. Override loadView() or use a NIB/storyboard. Override viewDidLoad(), viewWillAppear(), viewDidAppear(), viewWillDisappear(), and viewDidDisappear() for lifecycle callbacks."
                ) {
                    snippet("""
                    class NSViewController: NSResponder, NSEditor, NSSeguePerforming

                    // Lifecycle:
                    override func loadView()           // called once; set self.view
                    override func viewDidLoad()        // view is loaded; configure subviews
                    override func viewWillAppear()     // about to be added to window
                    override func viewDidAppear()      // now in window hierarchy
                    override func viewWillDisappear()
                    override func viewDidDisappear()

                    // View:
                    var view: NSView { get set }
                    var title: String?
                    var preferredContentSize: NSSize  // hint to container controllers

                    // Child view controllers:
                    func addChild(_ childViewController: NSViewController)
                    func removeFromParent()
                    var children: [NSViewController] { get }
                    var parent: NSViewController? { get }

                    // Presentation:
                    func present(_ viewController: NSViewController,
                                  as presentationMode: NSViewController.TransitionOptions,
                                  ...)
                    func presentAsSheet(_ viewController: NSViewController)
                    func presentAsModalWindow(_ viewController: NSViewController)
                    func presentAsPopover(relativeTo positioningRect: NSRect,
                                          of positioningView: NSView,
                                          preferredEdge: NSRectEdge, behavior: NSPopover.Behavior)
                    func dismiss(_ viewController: NSViewController)

                    // Touch Bar:
                    override func makeTouchBar() -> NSTouchBar?
                    """)
                }

                refBlock(
                    name: "NSWindowController",
                    kind: "class : NSResponder",
                    availability: "macOS 10.0+",
                    blurb: "Manages the lifecycle of a single NSWindow, typically associated with a document. Handles loading the window from a NIB and connecting it to an NSDocument. Modern apps using NSWindowGroup and SwiftUI rarely need NSWindowController directly."
                ) {
                    snippet("""
                    class NSWindowController: NSResponder, NSSeguePerforming

                    // Init:
                    init(window: NSWindow?)
                    init(windowNibName nibName: NSNib.Name, owner: Any)

                    var window: NSWindow? { get set }
                    var document: AnyObject? { get set }  // associated NSDocument
                    var contentViewController: NSViewController? { get set }
                    var isWindowLoaded: Bool { get }
                    var windowNibName: NSNib.Name? { get }

                    // Lifecycle:
                    func windowDidLoad()
                    func windowWillLoad()
                    func loadWindow()

                    // Show/hide:
                    func showWindow(_ sender: Any?)
                    func close()
                    """)
                }

                refBlock(
                    name: "NSTitlebarAccessoryViewController",
                    kind: "class : NSViewController",
                    availability: "macOS 10.10+",
                    blurb: "Adds a custom view to the window's title bar area. Useful for toolbars that live below the title (e.g., document tabs, scope bars). Attach via NSWindow.addTitlebarAccessoryViewController(_:)."
                ) {
                    snippet("""
                    class NSTitlebarAccessoryViewController: NSViewController

                    var layoutAttribute: NSLayoutAttribute  // .bottom (below title bar) or .left/.right
                    var fullScreenMinHeight: CGFloat        // minimum height in full-screen
                    var isHidden: Bool

                    // Usage:
                    let accessoryVC = NSTitlebarAccessoryViewController()
                    accessoryVC.view = myScopeBarView
                    accessoryVC.layoutAttribute = .bottom   // appears below the title bar
                    window.addTitlebarAccessoryViewController(accessoryVC)
                    """)
                }
            }
        }
    }

    private var splitSection: some View {
        PageSection("Reference \u{2014} NSSplitViewController / NSSplitViewItem") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSSplitViewController",
                    kind: "class : NSViewController",
                    availability: "macOS 10.10+",
                    blurb: "Manages an NSSplitView with child view controllers wrapped in NSSplitViewItem. Provides the sidebar/content/inspector layout and coordinates collapse/expand animations."
                ) {
                    snippet("""
                    class NSSplitViewController: NSViewController, NSSplitViewDelegate

                    var splitView: NSSplitView { get }
                    var splitViewItems: [NSSplitViewItem] { get set }

                    func addSplitViewItem(_ splitViewItem: NSSplitViewItem)
                    func insertSplitViewItem(_ splitViewItem: NSSplitViewItem, at index: Int)
                    func removeSplitViewItem(_ splitViewItem: NSSplitViewItem)

                    func splitViewItem(for viewController: NSViewController) -> NSSplitViewItem?

                    // Convenience (macOS 10.10+):
                    // Use .sidebar, .contentList, .inspector behaviors on NSSplitViewItem
                    """)
                }

                refBlock(
                    name: "NSSplitViewItem",
                    kind: "class : NSObject",
                    availability: "macOS 10.10+",
                    blurb: "Wraps an NSViewController in an NSSplitViewController. The behavior property determines collapse behavior and minimum thickness."
                ) {
                    snippet("""
                    class NSSplitViewItem: NSObject, NSAnimatablePropertyContainer, NSCopying

                    // Factory methods by behavior:
                    class func sidebarWithViewController(_ vc: NSViewController) -> NSSplitViewItem
                    class func contentListWithViewController(_ vc: NSViewController) -> NSSplitViewItem
                    class func inspectorWithViewController(_ vc: NSViewController) -> NSSplitViewItem  // macOS 11+
                    init(viewController: NSViewController)

                    var behavior: NSSplitViewItem.Behavior    // .default / .sidebar / .contentList / .inspector
                    var viewController: NSViewController
                    var isCollapsed: Bool { get set }
                    var canCollapse: Bool
                    var holdingPriority: NSLayoutConstraint.Priority  // resist shrinking
                    var minimumThickness: CGFloat
                    var maximumThickness: CGFloat
                    var preferredThicknessFraction: CGFloat  // 0.0–1.0
                    var automaticMaximumThickness: CGFloat
                    var isSpringLoaded: Bool               // macOS 10.11+
                    var collapseBehavior: NSSplitViewItem.CollapseBehavior  // macOS 12+

                    // Animate collapse:
                    animator().isCollapsed = true
                    """)
                }
            }
        }
    }

    private var tabSection: some View {
        PageSection("Reference \u{2014} NSTabViewController / NSTabViewItem") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTabViewController",
                    kind: "class : NSViewController",
                    availability: "macOS 10.10+",
                    blurb: "Manages a set of NSTabViewItem objects, each containing a child view controller. Delegates tab-switching to NSTabView. Use tabStyle to control the visual presentation."
                ) {
                    snippet("""
                    class NSTabViewController: NSViewController, NSTabViewDelegate

                    var tabStyle: NSTabViewController.TabStyle
                    // .segmentedControlOnTop / .segmentedControlOnBottom
                    // .toolbar (shows tabs as toolbar items)
                    // .unspecified (no built-in tab bar; manage tabs yourself)

                    var tabViewItems: [NSTabViewItem] { get set }
                    var selectedTabViewItemIndex: Int { get set }

                    func addTabViewItem(_ tabViewItem: NSTabViewItem)
                    func insertTabViewItem(_ tabViewItem: NSTabViewItem, at index: Int)
                    func removeTabViewItem(_ tabViewItem: NSTabViewItem)

                    func tabView(_ tabView: NSTabView, shouldSelect tabViewItem: NSTabViewItem?) -> Bool
                    func tabView(_ tabView: NSTabView, willSelect tabViewItem: NSTabViewItem?)
                    func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?)
                    """)
                }

                refBlock(
                    name: "NSTabViewItem",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Represents a single tab in an NSTabView or NSTabViewController. Carries the view (or view controller), label, and identifier."
                ) {
                    snippet("""
                    class NSTabViewItem: NSObject, NSCopying

                    init(identifier: Any?)
                    init(viewController: NSViewController)  // macOS 10.10+

                    var identifier: Any?
                    var label: String
                    var image: NSImage?              // macOS 10.10+
                    var tabState: NSTabViewItem.State { get }   // .selectedTab / .backgroundTab / .pressedTab
                    var viewController: NSViewController? { get set }  // macOS 10.10+
                    var view: NSView?
                    var initialFirstResponder: NSView?
                    weak var tabView: NSTabView? { get }
                    var toolTip: String?             // macOS 10.10+
                    """)
                }
            }
        }
    }

    private var pageSection: some View {
        PageSection("Reference \u{2014} NSPageController") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSPageController",
                    kind: "class : NSViewController",
                    availability: "macOS 10.8+",
                    blurb: "Provides page-flipping navigation between objects using a horizontal swipe animation. Each page is rendered by a delegate-provided NSViewController. Supports .stackHistory, .bookShelf, .timeMachine, and .stackBook transition styles."
                ) {
                    snippet("""
                    class NSPageController: NSViewController

                    var delegate: NSPageControllerDelegate? { get set }
                    var arrangedObjects: [Any] { get set }
                    var selectedIndex: Int { get set }
                    var transitionStyle: NSPageController.TransitionStyle
                    // .stackHistory (default) / .bookShelf / .timeMachine / .stackBook

                    func takeSelectedIndexFrom(_ sender: Any?)
                    func navigateForward(to object: Any)

                    // NSPageControllerDelegate:
                    protocol NSPageControllerDelegate: AnyObject {
                        func pageController(_ pageController: NSPageController,
                                            identifierFor object: Any) -> NSPageController.ObjectIdentifier
                        func pageController(_ pageController: NSPageController,
                                            viewControllerForIdentifier identifier: NSPageController.ObjectIdentifier) -> NSViewController
                        func pageController(_ pageController: NSPageController,
                                            prepare viewController: NSViewController, with object: Any?)
                        func pageControllerDidEndLiveTransition(_ pageController: NSPageController)
                    }
                    """)
                }
            }
        }
    }

    private var mediaSection: some View {
        PageSection("Reference \u{2014} NSMediaLibraryBrowserController") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSMediaLibraryBrowserController",
                    kind: "class : NSObject",
                    availability: "macOS 10.9+",
                    blurb: "Shows the system media library browser panel (Photos, Music, Movies). Used with drag-and-drop to allow users to select media from their libraries. Access the singleton via .shared."
                ) {
                    snippet("""
                    class NSMediaLibraryBrowserController: NSObject

                    static var shared: NSMediaLibraryBrowserController

                    var mediaLibraries: NSMediaLibraryBrowserController.Library  // OptionSet
                    var isVisible: Bool { get set }
                    var frame: NSRect { get set }

                    func togglePanel(_ sender: Any?)

                    // Library OptionSet:
                    struct NSMediaLibraryBrowserController.Library: OptionSet {
                        static let audio: NSMediaLibraryBrowserController.Library   // Music library
                        static let image: NSMediaLibraryBrowserController.Library   // Photos library
                        static let movie: NSMediaLibraryBrowserController.Library   // Movies library
                    }

                    // Show the browser with music and photos:
                    let browser = NSMediaLibraryBrowserController.shared
                    browser.mediaLibraries = [.audio, .image]
                    browser.isVisible = true
                    """)
                }
            }
        }
    }

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("rectangle.3.group", "NSSplitViewController is the AppKit equivalent of NavigationSplitView. Use NSSplitViewItem.sidebarWithViewController(_:) and .contentListWithViewController(_:) for the three-column Mail-style layout.")
                noteRow("flip.horizontal", "NSPageController provides book-flip and stack-history animations. For SwiftUI equivalents, use TabView with .tabViewStyle(.page) on supported platforms.")
                noteRow("photo.stack", "NSMediaLibraryBrowserController.shared shows the system-standard media picker. The panel is draggable and dock-anchored — do not reposition it programmatically.")
                noteRow("puzzlepiece", "NSTitlebarAccessoryViewController with .bottom layoutAttribute creates the Safari-style URL/tab bar below the standard title bar. Use .left or .right for sidebar-adjacent accessories.")
            }
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
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

    private func refBlock<Content: View>(
        name: String,
        kind: String,
        availability: String,
        blurb: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(name).font(.headline).foregroundStyle(.primary)
                Text(kind).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                Spacer()
                Text(availability).font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
            }
            Text(blurb).font(.callout).foregroundStyle(.secondary)
            content()
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview {
    NSViewManagementPage().frame(width: 1100, height: 900)
}
