import SwiftUI
import AppKit

// AppKit Menus — NSMenu, NSMenuItem, NSMenuItemBadge, NSMenuDelegate,
// NSMenuItemValidation, NSStatusBar, NSStatusItem, NSCursor, NSTrackingArea,
// NSDockTile, NSDockTilePlugIn.
//
// Absorbed leaves:
//   Menus:        NSMenu, NSMenuItem, NSMenuItemBadge, NSMenuDelegate
//   Validation:   NSMenuItemValidation
//   Menu bar:     NSStatusBar, NSStatusItem
//   Cursors:      NSCursor, NSTrackingArea
//   Dock:         NSDockTile, NSDockTilePlugIn

// MARK: - Bridges

private struct NSMenuDemoVC: NSViewControllerRepresentable {
    func makeNSViewController(context: Context) -> NSViewController {
        let vc = NSViewController()
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 360, height: 60))
        vc.view = view

        let button = NSButton(title: "Show Context Menu", target: context.coordinator, action: #selector(Coordinator.showMenu(_:)))
        button.bezelStyle = .push
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        context.coordinator.button = button
        return vc
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}
    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator: NSObject {
        var button: NSButton?

        @objc func showMenu(_ sender: NSButton) {
            let menu = NSMenu()
            menu.addItem(withTitle: "New File", action: nil, keyEquivalent: "n")
            menu.addItem(withTitle: "Open\u{2026}", action: nil, keyEquivalent: "o")
            menu.addItem(NSMenuItem.separator())
            let formatItem = NSMenuItem(title: "Format", action: nil, keyEquivalent: "")
            let submenu = NSMenu(title: "Format")
            submenu.addItem(withTitle: "Bold", action: nil, keyEquivalent: "b")
            submenu.addItem(withTitle: "Italic", action: nil, keyEquivalent: "i")
            formatItem.submenu = submenu
            menu.addItem(formatItem)
            menu.addItem(NSMenuItem.separator())
            let badge = menu.addItem(withTitle: "Updates (3)", action: nil, keyEquivalent: "")
            if #available(macOS 14.0, *) {
                badge.badge = NSMenuItemBadge(count: 3)
            }
            if let button {
                menu.popUp(positioning: menu.item(at: 0), at: NSPoint(x: 0, y: button.bounds.height), in: button)
            }
        }
    }
}

// MARK: - Page

struct NSMenuPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                nsMenuSection
                nsMenuItemSection
                validationSection
                statusBarSection
                cursorSection
                dockSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Menus, Cursors, and the Dock")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSMenu, NSMenuItem, NSMenuItemBadge, menu validation, NSStatusBar, NSStatusItem, NSCursor, NSTrackingArea, NSDockTile.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.0+ \u{00b7} NSMenuItemBadge macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: NSMenu

    private var nsMenuSection: some View {
        PageSection("NSMenu") {
            VStack(alignment: .leading, spacing: 16) {
                block("Live context menu demo") {
                    VStack(alignment: .leading, spacing: 12) {
                        NSMenuDemoVC()
                            .frame(height: 60)
                            .frame(maxWidth: 360)
                            .padding(12)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                        APICallout("let menu = NSMenu()")
                        APICallout("menu.addItem(withTitle: \"Open\", action: #selector(open(_:)), keyEquivalent: \"o\")")
                        APICallout("menu.popUp(positioning: nil, at: point, in: view)")
                    }
                }

                refBlock(
                    name: "NSMenu",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Represents a menu — the main menu bar, context menus, and submenus. Attach to NSWindow.menu for the menu bar; show as a context menu via popUp(positioning:at:in:)."
                ) {
                    snippet("""
                    class NSMenu: NSObject, NSCopying, NSAccessibilityProtocol

                    // Init:
                    init(title: String)

                    // Add items:
                    func addItem(_ newItem: NSMenuItem)
                    func addItem(withTitle string: String,
                                  action selector: Selector?,
                                  keyEquivalent charCode: String) -> NSMenuItem
                    func insertItem(_ newItem: NSMenuItem, at index: Int)
                    func insertItem(withTitle string: String,
                                   action selector: Selector?,
                                   keyEquivalent charCode: String, at index: Int) -> NSMenuItem

                    // Remove items:
                    func removeItem(_ item: NSMenuItem)
                    func removeItem(at index: Int)
                    func removeAllItems()

                    // Find items:
                    func item(withTitle title: String) -> NSMenuItem?
                    func item(at index: Int) -> NSMenuItem?
                    func item(withTag tag: Int) -> NSMenuItem?
                    func index(of item: NSMenuItem) -> Int
                    var items: [NSMenuItem] { get }
                    var numberOfItems: Int { get }

                    // Display as context menu:
                    func popUp(positioning item: NSMenuItem?,
                               at location: NSPoint,
                               in view: NSView?) -> Bool

                    // Appearance:
                    var title: String
                    var font: NSFont?
                    var autoenablesItems: Bool   // auto-validate items on show
                    var showsStateColumn: Bool   // show checkmarks column
                    var minimumWidth: CGFloat

                    // Delegate:
                    var delegate: NSMenuDelegate?
                    protocol NSMenuDelegate: AnyObject {
                        func menuWillOpen(_ menu: NSMenu)
                        func menuDidClose(_ menu: NSMenu)
                        func menu(_ menu: NSMenu, willHighlight item: NSMenuItem?)
                        func menu(_ menu: NSMenu, update item: NSMenuItem,
                                  at index: Int, shouldCancel: Bool) -> Bool
                        func numberOfItems(in menu: NSMenu) -> Int
                        func menuHasKeyEquivalent(_ menu: NSMenu, for event: NSEvent,
                                                   target: AutoreleasingUnsafeMutablePointer<AnyObject?>,
                                                   action: UnsafeMutablePointer<Selector?>) -> Bool
                    }
                    """)
                }
            }
        }
    }

    // MARK: NSMenuItem

    private var nsMenuItemSection: some View {
        PageSection("NSMenuItem / NSMenuItemBadge") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSMenuItem",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "A single item in an NSMenu. Can have a title, image, key equivalent, submenu, separator, and state (on/off/mixed). Connect to actions via target/action or the first-responder chain."
                ) {
                    snippet("""
                    class NSMenuItem: NSObject, NSCopying, NSAccessibilityProtocol

                    // Init:
                    init(title: String, action: Selector?, keyEquivalent: String)

                    // Separator:
                    class func separator() -> NSMenuItem

                    // Core properties:
                    var title: String
                    var attributedTitle: NSAttributedString?
                    var image: NSImage?
                    var mixedStateImage: NSImage?   // image for .mixed state
                    var offStateImage: NSImage?     // image for .off state
                    var onStateImage: NSImage?      // image for .on state (default = checkmark)

                    var state: NSControl.StateValue    // .off / .on / .mixed
                    var tag: Int
                    var isEnabled: Bool
                    var isHidden: Bool

                    // Key equivalent:
                    var keyEquivalent: String             // e.g., "n" or ""
                    var keyEquivalentModifierMask: NSEvent.ModifierFlags  // .command / .shift / etc.

                    // Action:
                    var action: Selector?
                    var target: AnyObject?
                    weak var menu: NSMenu? { get }

                    // Submenu:
                    var submenu: NSMenu?
                    var hasSubmenu: Bool { get }

                    // Separator:
                    var isSeparatorItem: Bool { get }

                    // Indent level:
                    var indentationLevel: Int   // 0–15

                    // Tooltip:
                    var toolTip: String?

                    // View (custom item rendering):
                    var view: NSView?
                    """)
                }

                refBlock(
                    name: "NSMenuItemBadge",
                    kind: "class : NSObject",
                    availability: "macOS 14.0+",
                    blurb: "Attaches a numeric or string badge to an NSMenuItem. Displayed to the right of the menu item title."
                ) {
                    snippet("""
                    class NSMenuItemBadge: NSObject, NSCopying
                    init(count: Int)           // numeric count badge
                    init(string: String)       // arbitrary string badge
                    static var updates: NSMenuItemBadge { get }   // system "updates" style

                    var count: Int { get }
                    var itemBadgeType: NSMenuItemBadge.BadgeType { get }
                    var string: String? { get }

                    // Attach to a menu item:
                    menuItem.badge = NSMenuItemBadge(count: 3)    // macOS 14+
                    """)
                }
            }
        }
    }

    // MARK: Validation

    private var validationSection: some View {
        PageSection("Menu Validation") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSMenuItemValidation",
                    kind: "protocol",
                    availability: "macOS 10.0+",
                    blurb: "Implement in a responder to enable/disable menu items automatically. When autoenablesItems = true (default) on an NSMenu, the system calls validateMenuItem(_:) on the target or the first-responder chain before showing the menu."
                ) {
                    snippet("""
                    protocol NSMenuItemValidation: NSObjectProtocol {
                        func validateMenuItem(_ menuItem: NSMenuItem) -> Bool
                    }

                    // Implementation pattern in NSViewController or NSDocument:
                    func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
                        switch menuItem.action {
                        case #selector(copy(_:)):
                            return !selection.isEmpty
                        case #selector(paste(_:)):
                            return NSPasteboard.general.canReadObject(forClasses: [NSString.self])
                        case #selector(delete(_:)):
                            return !selection.isEmpty
                        default:
                            return true
                        }
                    }

                    // NSUserInterfaceValidations (broader protocol; covers toolbar items too):
                    protocol NSUserInterfaceValidations {
                        func validateUserInterfaceItem(_ item: NSValidatedUserInterfaceItem) -> Bool
                    }
                    """)
                }
            }
        }
    }

    // MARK: Status Bar

    private var statusBarSection: some View {
        PageSection("NSStatusBar / NSStatusItem") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSStatusBar / NSStatusItem",
                    kind: "class : NSObject / class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "NSStatusBar.system provides access to the macOS menu bar status area. NSStatusItem represents a persistent icon in that area. Attach a button via statusItem.button."
                ) {
                    snippet("""
                    class NSStatusBar: NSObject
                    static var system: NSStatusBar  // always use the shared instance

                    // Create a status item (retain strongly; releasing removes it):
                    let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
                    let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

                    // Configure the button:
                    if let button = item.button {
                        button.image = NSImage(systemSymbolName: "bolt.fill", accessibilityDescription: "Bolt")
                        button.toolTip = "My App"
                        button.action = #selector(statusButtonClicked(_:))
                        button.target = self
                    }

                    // Attach a menu (action NOT called when menu is set):
                    let menu = NSMenu()
                    menu.addItem(withTitle: "Preferences\u{2026}", action: #selector(openPrefs), keyEquivalent: ",")
                    menu.addItem(withTitle: "Quit", action: #selector(NSApplication.terminate), keyEquivalent: "q")
                    item.menu = menu

                    // Remove:
                    NSStatusBar.system.removeStatusItem(item)

                    // NSStatusItem key properties:
                    var length: CGFloat { get set }    // NSStatusItem.squareLength or variableLength
                    var button: NSStatusBarButton? { get }
                    var menu: NSMenu? { get set }
                    var isVisible: Bool { get set }       // macOS 10.12+
                    var behavior: NSStatusItem.Behavior  // .removalAllowed / .terminationOnRemoval
                    var autosaveName: NSStatusItem.AutosaveName?
                    """)
                }
            }
        }
    }

    // MARK: Cursor

    private var cursorSection: some View {
        PageSection("NSCursor / NSTrackingArea") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSCursor",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Manages the mouse cursor appearance. Push custom cursors on enter and pop on exit inside an NSTrackingArea to scope cursor changes to a view region."
                ) {
                    snippet("""
                    class NSCursor: NSObject, NSSecureCoding

                    // System cursors:
                    NSCursor.arrow               // default pointer
                    NSCursor.iBeam               // text I-beam
                    NSCursor.crosshair           // crosshair
                    NSCursor.closedHand          // panning (closed fist)
                    NSCursor.openHand            // panning (open hand)
                    NSCursor.pointingHand        // link pointer
                    NSCursor.resizeLeft          // resize left edge
                    NSCursor.resizeRight
                    NSCursor.resizeUp
                    NSCursor.resizeDown
                    NSCursor.resizeLeftRight     // horizontal resize
                    NSCursor.resizeUpDown        // vertical resize
                    NSCursor.disappearingItem    // drag-delete (poof animation)
                    NSCursor.iBeamCursorForVerticalLayout
                    NSCursor.operationNotAllowed // prohibit symbol
                    NSCursor.dragLink            // link drag
                    NSCursor.dragCopy            // copy drag (plus badge)

                    // Custom cursor:
                    let cursor = NSCursor(image: myImage, hotSpot: NSPoint(x: 8, y: 8))

                    // Push/pop within tracking area:
                    override func mouseEntered(with event: NSEvent) { cursor.push() }
                    override func mouseExited(with event: NSEvent) { NSCursor.pop() }

                    // Hide/unhide for full-screen UIs:
                    NSCursor.hide()
                    NSCursor.unhide()
                    NSCursor.setHiddenUntilMouseMoves(true)
                    """)
                }

                refBlock(
                    name: "NSTrackingArea",
                    kind: "class : NSObject",
                    availability: "macOS 10.5+",
                    blurb: "Registers a region within an NSView to receive mouse-entered, mouse-exited, and mouse-moved events. Add tracking areas in updateTrackingAreas() so they resize correctly."
                ) {
                    snippet("""
                    class NSTrackingArea: NSObject, NSCopying

                    init(rect: NSRect,
                         options: NSTrackingArea.Options,
                         owner: AnyObject?,
                         userInfo: [AnyHashable: Any]?)

                    // Options (OptionSet):
                    NSTrackingArea.Options.mouseEnteredAndExited  // enter/exit events
                    NSTrackingArea.Options.mouseMoved              // move events
                    NSTrackingArea.Options.cursorUpdate            // cursorUpdate events
                    NSTrackingArea.Options.activeAlways            // even when app not key
                    NSTrackingArea.Options.activeInKeyWindow       // only when key
                    NSTrackingArea.Options.activeInActiveApp       // when app is active
                    NSTrackingArea.Options.activeWhenFirstResponder  // only when first responder
                    NSTrackingArea.Options.inVisibleRect           // clip to visible portion
                    NSTrackingArea.Options.assumeInside            // fire entered even if mouse was already inside

                    // Add in NSView:
                    override func updateTrackingAreas() {
                        super.updateTrackingAreas()
                        for area in trackingAreas { removeTrackingArea(area) }
                        let area = NSTrackingArea(rect: bounds,
                                                   options: [.mouseEnteredAndExited, .activeInActiveApp],
                                                   owner: self,
                                                   userInfo: nil)
                        addTrackingArea(area)
                    }
                    """)
                }
            }
        }
    }

    // MARK: Dock

    private var dockSection: some View {
        PageSection("NSDockTile") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSDockTile / NSDockTilePlugIn",
                    kind: "class : NSObject / protocol",
                    availability: "macOS 10.5+",
                    blurb: "NSDockTile customizes the app's Dock icon with badges and custom content. NSDockTilePlugIn allows modifying the Dock tile even when the app is not running."
                ) {
                    snippet("""
                    class NSDockTile: NSObject

                    // Access the app's tile:
                    let tile = NSApp.dockTile

                    // Badge:
                    tile.badgeLabel = "3"         // number or short string displayed in red badge
                    tile.badgeLabel = nil          // clear badge

                    // Custom content:
                    tile.contentView = myCustomView  // replaces the default icon
                    tile.display()                   // force redraw

                    // Show progress (macOS 10.5+):
                    // Use NSDockTile.contentView to render a custom NSView with a progress indicator

                    // Show in mini (minimized) window's tile:
                    NSApp.dockTile.contentView = thumbnailView
                    NSApp.dockTile.display()

                    // NSDockTilePlugIn — plug-in runs in a separate process:
                    protocol NSDockTilePlugIn: NSObjectProtocol {
                        func setDockTile(_ dockTile: NSDockTile?)
                        func dockMenu() -> NSMenu?
                    }
                    // Bundle key: NSPlugInDockTileClass
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("menubar", "NSStatusItem must be retained in a property. Releasing it removes the status item from the menu bar immediately.")
                noteRow("checkmark.circle", "NSMenu.autoenablesItems = true (default) calls validateMenuItem(_:) on each item's target before showing. Implement NSMenuItemValidation in any responder in the chain.")
                noteRow("cursorarrow", "NSTrackingArea must be re-created in updateTrackingAreas() because the view's bounds may change. Always remove old tracking areas first.")
                noteRow("app.badge", "NSDockTile.badgeLabel = nil clears the badge. The system badge renders a red pill — do not overlay your own badge on top of the Dock icon without clearing the system badge first.")
                noteRow("menubar.rectangle", "NSMenuItemBadge (macOS 14+) attaches a numeric or string badge inline in the menu item. It replaces the older pattern of embedding a badge image in item.image.")
                noteRow("nosign", "NSDockTilePlugIn runs as a LaunchServices plug-in even when your app isn't running. It must be in a separate bundle embedded in the app's PlugIns folder.")
            }
        }
    }

    // MARK: Helpers

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

    private func block<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension NSMenuPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.menusCursorsAndTheDock.nsMenu",
        title: "NSMenu",
        folder: "Menus, cursors, and the Dock",
        framework: .appKit,
        absorbedSymbols: [
            "NSMenu",
            "NSMenuItem",
            "NSMenuItemBadge",
            "NSMenuDelegate",
            "NSMenuItemValidation",
            "NSStatusBar",
            "NSStatusItem",
            "NSCursor",
            "NSTrackingArea",
            "NSDockTile",
            "NSDockTilePlugIn"
        ],
        blurb: "NSMenu and NSMenuItem plus the surrounding menu-bar, cursor, and Dock APIs: NSStatusBar/NSStatusItem, NSCursor/NSTrackingArea, NSDockTile/NSDockTilePlugIn, and menu-item validation.",
        signature: "class NSMenu : NSObject",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/menus-cursors-and-the-dock/nsmenu.md",
        page: { AnyView(NSMenuPage()) }
    )
}

#Preview {
    NSMenuPage().frame(width: 1100, height: 900)
}
