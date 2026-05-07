import SwiftUI
import AppKit

// AppKit Windows, Panels, and Screens — panels, alerts, open/save panels,
// color panels, font panels, screen, popovers, restoration, print, share.
//
// Absorbed leaves:
//   Windows:       NSPanel
//   Window Restoration: Restoring your app's state (article),
//                  NSWindowRestoration, NSUserInterfaceItemIdentification
//   Screens:       NSScreen
//   Popovers:      NSPopover, NSPopoverDelegate
//   Alerts:        NSAlert, NSAlertDelegate
//   Open/Save:     NSOpenPanel, NSSavePanel, NSOpenSavePanelDelegate
//   Share:         NSPreviewRepresentingActivityItem
//   Print/PDF:     NSPDFPanel, NSPrintPanelAccessorizing
//   Color Panels:  NSColorPanel, NSColorPickingCustom, NSColorPickingDefault, NSColorPicker
//   Font Panels:   NSFontPanel, NSFontPanel.ModeMask, NSFontPanelValidation, NSFontChanging

// MARK: - Bridges

private struct NSPopoverDemoVC: NSViewControllerRepresentable {
    func makeNSViewController(context: Context) -> NSViewController {
        let vc = NSViewController()
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 340, height: 100))
        vc.view = view

        let button = NSButton(title: "Show Popover", target: context.coordinator, action: #selector(Coordinator.showPopover(_:)))
        button.bezelStyle = .push
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        context.coordinator.button = button
        context.coordinator.vc = vc
        return vc
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator: NSObject, NSPopoverDelegate {
        var button: NSButton?
        var vc: NSViewController?
        var popover: NSPopover?

        @objc func showPopover(_ sender: NSButton) {
            guard let button else { return }
            let pop = NSPopover()
            pop.behavior = .transient
            pop.delegate = self
            pop.contentSize = NSSize(width: 200, height: 80)
            let contentVC = NSViewController()
            let contentView = NSView()
            let label = NSTextField(labelWithString: "Hello from NSPopover")
            label.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(label)
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
            contentVC.view = contentView
            pop.contentViewController = contentVC
            pop.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
            self.popover = pop
        }
    }
}

// MARK: - Page

struct NSPanelPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                nspanelSection
                nsalertSection
                nsopensavePanelSection
                nsPopoverSection
                nsColorPanelSection
                nsFontPanelSection
                nsScreenSection
                restorationSection
                printShareSection
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
            Text("Windows, Panels, and Screens")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSPanel, NSAlert, NSOpenPanel, NSSavePanel, NSColorPanel, NSFontPanel, NSPopover, NSScreen, and related panel and screen APIs.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.0+ \u{00b7} NSPreviewRepresentingActivityItem macOS 13.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: NSPanel

    private var nspanelSection: some View {
        PageSection("Reference \u{2014} NSPanel") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSPanel",
                    kind: "class : NSWindow",
                    availability: "macOS 10.0+",
                    blurb: "An auxiliary window that floats above other windows and does not appear in the Window menu. Use for inspector panels, floating palettes, or any secondary UI surface. NSPanel respects the HIG's panel placement guidelines."
                ) {
                    snippet("""
                    class NSPanel: NSWindow

                    // Panel-specific properties:
                    var isFloatingPanel: Bool     // float above regular windows
                    var becomesKeyOnlyIfNeeded: Bool  // only take key status for text input
                    var worksWhenModal: Bool       // respond to events while a modal sheet is up

                    // Typical configuration:
                    let panel = NSPanel(
                        contentRect: NSRect(x: 0, y: 0, width: 320, height: 480),
                        styleMask: [.titled, .closable, .resizable, .utilityWindow],
                        backing: .buffered,
                        defer: false
                    )
                    panel.isFloatingPanel = true
                    panel.becomesKeyOnlyIfNeeded = true
                    panel.title = "Inspector"
                    panel.center()
                    panel.makeKeyAndOrderFront(nil)
                    """)
                }
            }
        }
    }

    // MARK: NSAlert

    private var nsalertSection: some View {
        PageSection("NSAlert") {
            VStack(alignment: .leading, spacing: 16) {
                block("Running an alert") {
                    snippet("""
                    // Modal alert (blocks on main thread — use runModal() or beginSheetModal):
                    let alert = NSAlert()
                    alert.messageText = "Delete item?"
                    alert.informativeText = "This action cannot be undone."
                    alert.addButton(withTitle: "Delete")      // NSApplication.ModalResponse.alertFirstButtonReturn
                    alert.addButton(withTitle: "Cancel")      // .alertSecondButtonReturn
                    alert.alertStyle = .warning               // .warning / .informational / .critical

                    // Run as sheet on a window (preferred over modal):
                    alert.beginSheetModal(for: window) { response in
                        if response == .alertFirstButtonReturn {
                            // Delete
                        }
                    }

                    // Modal (app-blocking):
                    let response = alert.runModal()
                    """)
                }

                refBlock(
                    name: "NSAlert",
                    kind: "class : NSObject",
                    availability: "macOS 10.3+",
                    blurb: "The standard AppKit alert panel. Can run modally (runModal()) or as a sheet attached to a window (beginSheetModal(for:completionHandler:))."
                ) {
                    snippet("""
                    class NSAlert: NSObject

                    var messageText: String          // bold header
                    var informativeText: String      // secondary body text
                    var alertStyle: NSAlert.Style    // .warning / .informational / .critical
                    var icon: NSImage?               // default = caution triangle for warning
                    var showsHelp: Bool
                    var helpAnchor: NSHelpManager.AnchorName?
                    var showsSuppressionButton: Bool  // "Don't show again" checkbox
                    var suppressionButton: NSButton? { get }

                    func addButton(withTitle title: String) -> NSButton
                    var buttons: [NSButton] { get }

                    func runModal() -> NSApplication.ModalResponse
                    func beginSheetModal(for sheetWindow: NSWindow,
                                         completionHandler handler: ((NSApplication.ModalResponse) -> Void)?)

                    // accessoryView for custom controls:
                    var accessoryView: NSView?

                    // NSAlertDelegate:
                    var delegate: NSAlertDelegate?
                    protocol NSAlertDelegate: AnyObject {
                        func alertShowHelp(_ alert: NSAlert) -> Bool
                    }
                    """)
                }
            }
        }
    }

    // MARK: Open/Save Panels

    private var nsopensavePanelSection: some View {
        PageSection("NSOpenPanel / NSSavePanel") {
            VStack(alignment: .leading, spacing: 16) {
                block("Showing an open panel") {
                    snippet("""
                    let panel = NSOpenPanel()
                    panel.allowsMultipleSelection = true
                    panel.canChooseDirectories = false
                    panel.canChooseFiles = true
                    panel.allowedContentTypes = [.png, .jpeg]  // UTType; macOS 12+
                    panel.message = "Choose images to import"
                    panel.prompt = "Import"

                    panel.beginSheetModal(for: window) { response in
                        guard response == .OK else { return }
                        let urls: [URL] = panel.urls
                        // process urls...
                    }
                    """)
                }

                block("Showing a save panel") {
                    snippet("""
                    let panel = NSSavePanel()
                    panel.allowedContentTypes = [.pdf]
                    panel.nameFieldStringValue = "Untitled"
                    panel.canCreateDirectories = true
                    panel.isExtensionHidden = false

                    panel.beginSheetModal(for: window) { response in
                        guard response == .OK, let url = panel.url else { return }
                        // write to url...
                    }
                    """)
                }

                refBlock(
                    name: "NSSavePanel / NSOpenPanel",
                    kind: "classes : NSPanel",
                    availability: "macOS 10.0+",
                    blurb: "Standard file-chooser panels. NSOpenPanel extends NSSavePanel with multi-selection and directory-picking support."
                ) {
                    snippet("""
                    // NSSavePanel (shared base):
                    class NSSavePanel: NSPanel
                    var url: URL? { get }               // chosen URL after .OK
                    var directoryURL: URL?              // initial directory
                    var nameFieldStringValue: String    // default filename
                    var allowedContentTypes: [UTType]   // macOS 12+ (replaces allowedFileTypes)
                    var allowsOtherFileTypes: Bool
                    var isExtensionHidden: Bool
                    var canCreateDirectories: Bool
                    var message: String
                    var prompt: String                  // button title
                    var title: String
                    var accessoryView: NSView?
                    var delegate: NSOpenSavePanelDelegate?

                    func runModal() -> NSApplication.ModalResponse
                    func beginSheetModal(for window: NSWindow,
                                         completionHandler: @escaping (NSApplication.ModalResponse) -> Void)

                    // NSOpenPanel (subclass):
                    class NSOpenPanel: NSSavePanel
                    var allowsMultipleSelection: Bool
                    var canChooseFiles: Bool
                    var canChooseDirectories: Bool
                    var resolvesAliases: Bool
                    var urls: [URL] { get }             // all selections

                    // NSOpenSavePanelDelegate:
                    protocol NSOpenSavePanelDelegate: AnyObject {
                        func panel(_ sender: Any, validate url: URL) throws
                        func panel(_ sender: Any, shouldEnable url: URL) -> Bool
                        func panelSelectionDidChange(_ sender: Any?)
                        func panel(_ sender: Any, userEnteredFilename filename: String, confirmed okFlag: Bool) -> String?
                    }
                    """)
                }
            }
        }
    }

    // MARK: NSPopover

    private var nsPopoverSection: some View {
        PageSection("NSPopover") {
            VStack(alignment: .leading, spacing: 16) {
                block("Live NSPopover demo") {
                    VStack(alignment: .leading, spacing: 12) {
                        NSPopoverDemoVC()
                            .frame(height: 100)
                            .frame(maxWidth: 340)
                            .padding(12)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                        APICallout("let pop = NSPopover()")
                        APICallout("pop.behavior = .transient   // .applicationDefined / .semitransient / .transient")
                        APICallout("pop.contentViewController = myVC")
                        APICallout("pop.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)")
                    }
                }

                refBlock(
                    name: "NSPopover",
                    kind: "class : NSResponder",
                    availability: "macOS 10.7+",
                    blurb: "A transient overlay attached to a view or bar item. Hosts an NSViewController as its content. Behavior controls when the popover auto-closes."
                ) {
                    snippet("""
                    class NSPopover: NSResponder, NSAppearanceCustomization

                    var behavior: NSPopover.Behavior    // .applicationDefined / .semitransient / .transient
                    var contentViewController: NSViewController?
                    var contentSize: NSSize
                    var isShown: Bool { get }
                    var isDetached: Bool { get }
                    var positioningRect: NSRect
                    var animates: Bool
                    var delegate: NSPopoverDelegate?
                    var appearance: NSAppearance?

                    func show(relativeTo positioningRect: NSRect,
                              of positioningView: NSView,
                              preferredEdge: NSRectEdge)
                    func performClose(_ sender: Any?)
                    func close()

                    // NSPopoverDelegate:
                    protocol NSPopoverDelegate: AnyObject {
                        func popoverShouldClose(_ popover: NSPopover) -> Bool
                        func popoverWillShow(_ notification: Notification)
                        func popoverDidShow(_ notification: Notification)
                        func popoverWillClose(_ notification: Notification)
                        func popoverDidClose(_ notification: Notification)
                        func popoverShouldDetach(_ popover: NSPopover) -> Bool
                        func popoverDidDetach(_ popover: NSPopover)
                        func detachableWindow(for popover: NSPopover) -> NSWindow?
                    }
                    """)
                }
            }
        }
    }

    // MARK: Color Panel

    private var nsColorPanelSection: some View {
        PageSection("NSColorPanel") {
            VStack(alignment: .leading, spacing: 16) {
                block("Opening the color panel") {
                    snippet("""
                    // Show/hide the shared Color Panel:
                    NSColorPanel.shared.isDisplayed = true
                    NSApplication.shared.orderFrontColorPanel(nil)

                    // Respond to color changes in your view/controller:
                    override func changeColor(_ sender: Any?) {
                        let color = NSColorPanel.shared.color
                        // apply color...
                    }

                    // Pre-configure the panel:
                    NSColorPanel.shared.showsAlpha = true
                    NSColorPanel.shared.mode = .wheel    // .gray / .RGB / .CMYK / .HSB / .custom etc.
                    NSColorPanel.shared.color = NSColor.systemBlue
                    """)
                }

                refBlock(
                    name: "NSColorPanel",
                    kind: "class : NSPanel",
                    availability: "macOS 10.0+",
                    blurb: "The system-shared color picker panel. Singleton — always use NSColorPanel.shared. Sends changeColor(_:) up the responder chain on selection."
                ) {
                    snippet("""
                    class NSColorPanel: NSPanel
                    static var shared: NSColorPanel
                    static func dragColor(_ color: NSColor, with event: NSEvent, from sourceView: NSView) -> Bool

                    var color: NSColor { get set }
                    var alpha: CGFloat { get }
                    var showsAlpha: Bool
                    var mode: NSColorPanel.Mode
                    var isContinuous: Bool

                    func attachColorList(_ colorList: NSColorList)
                    func detachColorList(_ colorList: NSColorList)

                    // Modes:
                    // .gray / .RGB / .CMYK / .HSB / .colorList / .wheel / .crayon / .custom

                    // NSColorPickingDefault / NSColorPickingCustom:
                    // Protocols for building custom color pickers and embedding them in NSColorPanel.
                    protocol NSColorPickingDefault: NSObjectProtocol {
                        func supportsMode(_ mode: NSColorPanel.Mode) -> Bool
                        func currentMode() -> NSColorPanel.Mode
                        func provideNewView(_ initialRequest: Bool) -> NSView
                        func setColor(_ newColor: NSColor)
                    }
                    protocol NSColorPickingCustom: NSColorPickingDefault {
                        func setMode(_ mode: NSColorPanel.Mode)
                    }

                    // NSColorPicker (base class for custom pickers):
                    class NSColorPicker: NSObject, NSColorPickingDefault
                    var colorPanel: NSColorPanel { get }
                    var provideNewButtonImage: NSImage { get }
                    var buttonToolTip: String { get }
                    var minContentSize: NSSize { get }
                    func insertNewButtonImage(_ newButtonImage: NSImage, in buttonCell: NSButtonCell)
                    func viewSizeChanged(_ sender: Any?)
                    """)
                }
            }
        }
    }

    // MARK: Font Panel

    private var nsFontPanelSection: some View {
        PageSection("NSFontPanel") {
            VStack(alignment: .leading, spacing: 16) {
                block("Opening the font panel") {
                    snippet("""
                    // Show the shared Font Panel:
                    NSFontManager.shared.orderFrontFontPanel(nil)

                    // Configure which modes are shown:
                    NSFontPanel.shared.worksWhenModal = true

                    // Respond to font changes in your view/controller:
                    // NSFontChanging protocol — implement changeFont(_:):
                    override func changeFont(_ sender: NSFontManager?) {
                        guard let sender else { return }
                        let currentFont = textView.font ?? NSFont.systemFont(ofSize: 14)
                        let newFont = sender.convert(currentFont)
                        textView.font = newFont
                    }
                    """)
                }

                refBlock(
                    name: "NSFontPanel / NSFontPanel.ModeMask",
                    kind: "class : NSPanel / OptionSet",
                    availability: "macOS 10.0+",
                    blurb: "The system-shared font picker panel. Access via NSFontPanel.shared; open via NSFontManager.shared.orderFrontFontPanel(_:). ModeMask controls which sections are shown."
                ) {
                    snippet("""
                    class NSFontPanel: NSPanel
                    static var shared: NSFontPanel
                    var isEnabled: Bool
                    func setPanelFont(_ fontObj: NSFont, isMultiple flag: Bool)
                    func reloadDefaultFontFamilies()
                    var worksWhenModal: Bool
                    var accessoryView: NSView?

                    // NSFontPanel.ModeMask (OptionSet):
                    struct NSFontPanel.ModeMask: OptionSet {
                        static let face:          NSFontPanel.ModeMask  // typeface selector
                        static let size:          NSFontPanel.ModeMask  // size field
                        static let collection:    NSFontPanel.ModeMask  // collections list
                        static let underline:     NSFontPanel.ModeMask
                        static let strikethrough: NSFontPanel.ModeMask
                        static let textColor:     NSFontPanel.ModeMask
                        static let documentColor: NSFontPanel.ModeMask
                        static let shadow:        NSFontPanel.ModeMask
                        static let allEffects: NSFontPanel.ModeMask
                        static let standardModes: NSFontPanel.ModeMask
                    }

                    // NSFontPanelValidation — vend supported modes to the Font Panel:
                    protocol NSFontPanelValidation: NSObjectProtocol {
                        func validModesForFontPanel(_ fontPanel: NSFontPanel) -> NSFontPanel.ModeMask
                    }

                    // NSFontChanging — receive font-change actions:
                    protocol NSFontChanging: NSObjectProtocol {
                        func changeFont(_ sender: NSFontManager?)
                        func validModesForFontPanel(_ fontPanel: NSFontPanel) -> NSFontPanel.ModeMask
                    }
                    """)
                }
            }
        }
    }

    // MARK: NSScreen

    private var nsScreenSection: some View {
        PageSection("NSScreen") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSScreen",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Represents a physical display. Use NSScreen.main for the screen containing the key window. Use NSScreen.screens for all connected displays."
                ) {
                    snippet("""
                    class NSScreen: NSObject

                    // Common access:
                    static var main: NSScreen? { get }          // screen with key window
                    static var deepest: NSScreen? { get }       // highest color depth
                    static var screens: [NSScreen] { get }      // all connected displays
                    static var screensHaveSeparateSpaces: Bool  // Mission Control setting

                    // Geometry:
                    var frame: NSRect { get }          // total screen area (origin = bottom-left)
                    var visibleFrame: NSRect { get }   // excludes Dock and menu bar

                    // Color / display:
                    var depth: NSWindow.Depth { get }  // bits per pixel
                    var colorSpace: NSColorSpace? { get }
                    var maximumPotentialExtendedDynamicRangeColorComponentValue: CGFloat { get }  // HDR headroom
                    var maximumExtendedDynamicRangeColorComponentValue: CGFloat { get }

                    // Backing scale:
                    var backingScaleFactor: CGFloat { get }  // 1.0 or 2.0 (Retina)
                    func convertRectToBacking(_ aRect: NSRect) -> NSRect
                    func convertRectFromBacking(_ aRect: NSRect) -> NSRect

                    // Safe area (macOS 12+):
                    var safeAreaInsets: NSEdgeInsets { get }   // notch / display area cutouts

                    // Display link:
                    // Use CVDisplayLink or CADisplayLink (macOS 14+) for frame-synced animation

                    // Notifications:
                    // NSApplication.didChangeScreenParametersNotification — screens added/removed/changed
                    """)
                }
            }
        }
    }

    // MARK: Window Restoration

    private var restorationSection: some View {
        PageSection("Window Restoration") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSWindowRestoration / NSUserInterfaceItemIdentification",
                    kind: "protocol / protocol",
                    availability: "macOS 10.7+",
                    blurb: "NSWindowRestoration enables the system to automatically reopen windows after a restart. Adopt it in a class that can recreate windows from a saved identifier. NSUserInterfaceItemIdentification provides a stable identifier string for state restoration."
                ) {
                    snippet("""
                    // NSWindowRestoration:
                    protocol NSWindowRestoration: NSObjectProtocol {
                        static func restoreWindow(
                            withIdentifier identifier: NSUserInterfaceItemIdentifier,
                            state: NSCoder,
                            completionHandler: @escaping (NSWindow?, Error?) -> Void
                        )
                    }

                    // Register on NSWindow:
                    window.restorationClass = MyWindowRestoration.self  // class adopting NSWindowRestoration
                    window.identifier = NSUserInterfaceItemIdentifier("MainWindow")

                    // NSUserInterfaceItemIdentification:
                    protocol NSUserInterfaceItemIdentification {
                        var identifier: NSUserInterfaceItemIdentifier? { get set }
                    }
                    // Adopted by NSView, NSViewController, NSWindow, NSToolbarItem, etc.
                    // Stable identifiers enable state restoration and testing.
                    """)
                }
            }
        }
    }

    // MARK: Print / PDF / Share

    private var printShareSection: some View {
        PageSection("Print, PDF, and Share") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSPDFPanel",
                    kind: "class : NSObject",
                    availability: "macOS 10.9+",
                    blurb: "The PDF export options panel shown when a user chooses to save as PDF from the print dialog. Use NSPDFPanel.shared to configure the PDF export options accessory view."
                ) {
                    snippet("""
                    class NSPDFPanel: NSObject
                    static var shared: NSPDFPanel

                    var options: NSPDFPanel.Options          // OptionSet
                    var accessoryController: NSViewController?
                    var defaultFileName: String

                    func beginSheet(with pdfInfo: NSPDFInfo,
                                    modalFor docWindow: NSWindow?,
                                    completionHandler: @escaping (Int) -> Void)

                    // NSPDFPanel.Options:
                    struct NSPDFPanel.Options: OptionSet {
                        static let showsPaperSize: NSPDFPanel.Options
                        static let showsOrientation: NSPDFPanel.Options
                        static let requestsParentDirectory: NSPDFPanel.Options
                    }

                    // NSPDFInfo — holds destination URL and print settings:
                    class NSPDFInfo: NSObject, NSSecureCoding
                    var url: URL?
                    var isFileHidden: Bool
                    var tagNames: [String]
                    var orientation: NSPaperOrientation
                    var paperSize: NSSize
                    var attributes: NSMutableDictionary { get }

                    // NSPrintPanelAccessorizing — add custom controls to print panel:
                    protocol NSPrintPanelAccessorizing {
                        func localizedSummaryItems() -> [[NSPrintPanel.AccessorySummaryKey: String]]
                        func keyPathsForValuesAffectingPreview() -> Set<String>
                    }
                    """)
                }

                refBlock(
                    name: "NSPreviewRepresentingActivityItem",
                    kind: "class : NSObject",
                    availability: "macOS 13.0+",
                    blurb: "Wraps a shareable item with a preview image and title for display in the Share sheet. Use with NSSharingServicePicker or NSItemProvider to give the share panel a rich preview."
                ) {
                    snippet("""
                    class NSPreviewRepresentingActivityItem: NSObject, NSItemProviderWriting
                    init(item: Any, title: String?, image: NSImage?, icon: NSImage?)

                    var item: Any { get }
                    var title: String? { get }
                    var image: NSImage? { get }
                    var icon: NSImage? { get }

                    // Usage with NSSharingServicePicker:
                    let previewItem = NSPreviewRepresentingActivityItem(
                        item: myURL,
                        title: "My Document",
                        image: previewImage,
                        icon: NSApp.applicationIconImage
                    )
                    let picker = NSSharingServicePicker(items: [previewItem])
                    picker.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("rectangle.and.arrow.up.right.and.arrow.down.left", "NSPanel subclass with .utilityWindow style mask creates an inspector-style panel. isFloatingPanel = true makes it float above normal windows but below dialogs.")
                noteRow("exclamationmark.bubble", "NSAlert: prefer beginSheetModal(for:completionHandler:) over runModal() — sheets attach to a window and don't block other windows. runModal() is appropriate only for document-independent errors.")
                noteRow("folder", "NSOpenPanel and NSSavePanel: use allowedContentTypes ([UTType]) on macOS 12+. The older allowedFileTypes ([String]) is deprecated but still available.")
                noteRow("bubbles.and.sparkles", "NSPopover.behavior: .transient closes on any click outside; .semitransient closes when clicking in the app but outside the popover; .applicationDefined requires manual close() calls.")
                noteRow("display", "NSScreen.safeAreaInsets (macOS 12+) accounts for the notch on MacBook Pro. Subtract insets from visibleFrame to get the truly usable display area.")
                noteRow("doc.richtext", "NSPDFPanel.shared lets you add a custom accessoryController to the PDF save panel — use it to expose PDF-specific options like image resolution or PDF/A compliance.")
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

#Preview {
    NSPanelPage().frame(width: 1100, height: 900)
}
