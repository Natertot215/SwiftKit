import SwiftUI
import AppKit

// AppKit Views and Controls / Controls — NSButton family consolidation.
//
// Absorbed leaves (all documented inline; individual sidebar entries removed):
//   NSPopUpButton, NSComboButton, NSStatusBarButton, NSButtonTouchBarItem
//
// Source: Documentation/AppKit/views-and-controls/nsbutton.md

// MARK: - Bridges

private struct NSButtonDemo: NSViewRepresentable {
    var title: String
    var bezelStyle: NSButton.BezelStyle
    var isBordered: Bool
    var isTransparent: Bool
    var allowsMixedState: Bool
    var state: NSControl.StateValue

    func makeNSView(context: Context) -> NSButton {
        let b = NSButton(title: title, target: nil, action: nil)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }

    func updateNSView(_ nsView: NSButton, context: Context) {
        nsView.title = title
        nsView.bezelStyle = bezelStyle
        nsView.isBordered = isBordered
        nsView.isTransparent = isTransparent
        nsView.allowsMixedState = allowsMixedState
        nsView.state = state
    }
}

private struct NSButtonStandardSet: NSViewRepresentable {
    func makeNSView(context: Context) -> NSStackView {
        let stack = NSStackView()
        stack.orientation = .horizontal
        stack.spacing = 16
        stack.alignment = .centerY
        stack.translatesAutoresizingMaskIntoConstraints = false

        let push = NSButton(title: "Push", target: nil, action: nil)
        let checkbox = NSButton(checkboxWithTitle: "Checkbox", target: nil, action: nil)
        checkbox.state = .on
        let radio = NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
        radio.state = .on
        let imageButton = NSButton(
            title: "Image+Title",
            image: NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil) ?? NSImage(),
            target: nil,
            action: nil
        )
        imageButton.imagePosition = .imageLeading
        for view in [push, checkbox, radio, imageButton] {
            stack.addArrangedSubview(view)
        }
        return stack
    }

    func updateNSView(_ nsView: NSStackView, context: Context) {}
}

private struct NSPopUpButtonDemo: NSViewRepresentable {
    var titles: [String]
    var pullsDown: Bool
    var pullDownTitle: String
    @Binding var selectedIndex: Int

    func makeNSView(context: Context) -> NSPopUpButton {
        let button = NSPopUpButton(frame: .zero, pullsDown: pullsDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.target = context.coordinator
        button.action = #selector(Coordinator.selectionChanged(_:))
        return button
    }

    func updateNSView(_ nsView: NSPopUpButton, context: Context) {
        context.coordinator.parent = self
        if nsView.pullsDown != pullsDown { nsView.pullsDown = pullsDown }
        nsView.removeAllItems()
        if pullsDown {
            nsView.addItems(withTitles: [pullDownTitle] + titles)
        } else {
            nsView.addItems(withTitles: titles)
            if (0..<titles.count).contains(selectedIndex) { nsView.selectItem(at: selectedIndex) }
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }
    final class Coordinator: NSObject {
        var parent: NSPopUpButtonDemo
        init(_ p: NSPopUpButtonDemo) { parent = p }
        @objc func selectionChanged(_ sender: NSPopUpButton) {
            guard !sender.pullsDown else { return }
            parent.selectedIndex = sender.indexOfSelectedItem
        }
    }
}

private struct NSComboButtonDemo: NSViewRepresentable {
    var title: String
    var style: NSComboButton.Style

    func makeNSView(context: Context) -> NSComboButton {
        let menu = NSMenu()
        menu.addItem(withTitle: "Save As\u{2026}", action: nil, keyEquivalent: "")
        menu.addItem(withTitle: "Export\u{2026}", action: nil, keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Send to\u{2026}", action: nil, keyEquivalent: "")
        let button = NSComboButton(title: title, menu: menu, target: nil, action: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    func updateNSView(_ nsView: NSComboButton, context: Context) {
        nsView.title = title
        nsView.style = style
    }
}

// MARK: - Page

struct NSButtonPage: View {
    // NSButton state
    @State private var title: String = "Press Me"
    @State private var bezelStyle: NSButton.BezelStyle = .push
    @State private var isBordered: Bool = true
    @State private var isTransparent: Bool = false
    @State private var allowsMixedState: Bool = false
    @State private var state: NSControl.StateValue = .on

    // NSPopUpButton state
    @State private var selectedIndex: Int = 1
    @State private var pullsDown: Bool = false
    private let popUpItems = ["Small", "Medium", "Large", "Extra Large"]

    // NSComboButton state
    @State private var comboTitle: String = "Save"
    @State private var comboStyle: NSComboButton.Style = .split

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                referenceSection
                defaultSection
                bezelStylesSection
                popUpButtonSection
                comboButtonSection
                statusBarButtonSection
                touchBarItemSection
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
            Text("NSButton")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control that defines an area on the screen that a user clicks to trigger an action.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl : NSView \u{00b7} macOS 10.0+ \u{00b7} Documentation/AppKit/views-and-controls/nsbutton.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Reference — Subclass hierarchy

    private var referenceSection: some View {
        PageSection("Reference — NSButton Subclass Hierarchy") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSButton",
                    kind: "class : NSControl",
                    availability: "macOS 10.0+",
                    blurb: "The root button class. Configurable via bezelStyle, button type, state, image position, key equivalent, and tintProminence. Handles push buttons, checkboxes, radio buttons, image+title buttons, and more."
                ) {
                    snippet("""
                    NSButton  : NSControl
                    ├─ NSPopUpButton      — displays a menu and retains a single selection
                    └─ NSStatusBarButton  — lives in the system menu bar (via NSStatusItem)
                    """)
                }

                refBlock(
                    name: "NSPopUpButton",
                    kind: "class : NSButton",
                    availability: "macOS 10.0+",
                    blurb: "Shows a menu and retains the selected item (pop-up mode) or shows a fixed title and lets items perform actions (pull-down mode). Full type signatures in the NSPopUpButton section below."
                ) {
                    snippet("""
                    // Key differences from NSButton:
                    var pullsDown: Bool                    // false = pop-up; true = pull-down
                    var selectedItem: NSMenuItem?          // nil in pull-down mode
                    var indexOfSelectedItem: Int
                    func addItems(withTitles titles: [String])
                    func selectItem(at index: Int)
                    """)
                }

                refBlock(
                    name: "NSStatusBarButton",
                    kind: "class : NSButton",
                    availability: "macOS 10.10+",
                    blurb: "A button that lives in the macOS menu bar, obtained via NSStatusItem.button. Never instantiate directly — create an NSStatusItem and access its .button property. Described in the NSStatusBarButton section below."
                ) {
                    snippet("""
                    // Always created via NSStatusItem:
                    let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
                    let button: NSStatusBarButton? = item.button
                    """)
                }

                refBlock(
                    name: "NSComboButton",
                    kind: "class : NSControl",
                    availability: "macOS 13.0+",
                    blurb: "A button that pairs a default action with a pull-down menu of alternative actions. Two styles: .split (separate hit zones for title and menu chevron) and .unified (single surface; long-press reveals menu). Does NOT inherit NSButton."
                ) {
                    snippet("""
                    // NSComboButton is NSControl, not NSButton:
                    class NSComboButton: NSControl
                    var style: NSComboButton.Style    // .split / .unified
                    var menu: NSMenu
                    """)
                }
            }
        }
    }

    // MARK: Default NSButton

    private var defaultSection: some View {
        PageSection("Default — NSButton") {
            VStack(alignment: .leading, spacing: 16) {
                block("NSButton with bezel + state controls") {
                    VStack(alignment: .leading, spacing: 12) {
                        NSButtonDemo(
                            title: title,
                            bezelStyle: bezelStyle,
                            isBordered: isBordered,
                            isTransparent: isTransparent,
                            allowsMixedState: allowsMixedState,
                            state: state
                        )
                        .frame(height: 32)
                        .frame(maxWidth: 360)
                        .padding(12)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                        HStack(spacing: 12) {
                            Text("title").font(.caption).foregroundStyle(.secondary)
                            TextField("", text: $title).frame(width: 200)
                        }

                        HStack(spacing: 12) {
                            Text("bezelStyle").font(.caption).foregroundStyle(.secondary)
                            Picker("", selection: $bezelStyle) {
                                Text("automatic").tag(NSButton.BezelStyle.automatic)
                                Text("push").tag(NSButton.BezelStyle.push)
                                Text("flexiblePush").tag(NSButton.BezelStyle.flexiblePush)
                                Text("glass (macOS 26)").tag(NSButton.BezelStyle.glass)
                                Text("toolbar").tag(NSButton.BezelStyle.toolbar)
                                Text("accessoryBar").tag(NSButton.BezelStyle.accessoryBar)
                                Text("accessoryBarAction").tag(NSButton.BezelStyle.accessoryBarAction)
                                Text("badge").tag(NSButton.BezelStyle.badge)
                                Text("smallSquare").tag(NSButton.BezelStyle.smallSquare)
                                Text("circular").tag(NSButton.BezelStyle.circular)
                                Text("helpButton").tag(NSButton.BezelStyle.helpButton)
                                Text("disclosure").tag(NSButton.BezelStyle.disclosure)
                                Text("pushDisclosure").tag(NSButton.BezelStyle.pushDisclosure)
                            }
                            .labelsHidden()
                            .pickerStyle(.menu)
                            .frame(width: 220)
                        }

                        HStack(spacing: 12) {
                            Text("state").font(.caption).foregroundStyle(.secondary)
                            Picker("", selection: $state) {
                                Text("off").tag(NSControl.StateValue.off)
                                Text("on").tag(NSControl.StateValue.on)
                                Text("mixed").tag(NSControl.StateValue.mixed)
                            }
                            .labelsHidden()
                            .pickerStyle(.segmented)
                            .frame(width: 240)
                        }

                        Toggle("isBordered", isOn: $isBordered).controlSize(.small)
                        Toggle("isTransparent", isOn: $isTransparent).controlSize(.small)
                        Toggle("allowsMixedState (enables tri-state cycling)", isOn: $allowsMixedState).controlSize(.small)

                        APICallout("let b = NSButton(title: \"Press Me\", target: nil, action: nil)")
                        APICallout("b.bezelStyle = .push; b.state = .on; b.allowsMixedState = false")
                    }
                }

                block("Standard convenience initializers") {
                    NSButtonStandardSet()
                        .frame(height: 36)
                        .padding(12)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                    snippet("""
                    NSButton(title: "Push", target: nil, action: nil)
                    NSButton(checkboxWithTitle: "Checkbox", target: nil, action: nil)
                    NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
                    NSButton(title: "Image+Title", image: img, target: nil, action: nil)
                    NSButton(image: img, target: nil, action: nil)
                    """)
                }
            }
        }
    }

    // MARK: Bezel Styles

    private var bezelStylesSection: some View {
        PageSection("Button Types (Bezel Styles)") {
            VStack(alignment: .leading, spacing: 16) {
                block("Semantic bezel styles") {
                    snippet("""
                    b.bezelStyle = .push               // standard push button
                    b.bezelStyle = .flexiblePush       // width grows with title
                    b.bezelStyle = .glass              // macOS 26+ Liquid Glass effect
                    b.bezelStyle = .toolbar            // toolbar icon button
                    b.bezelStyle = .accessoryBar       // accessory bar (e.g., ruler)
                    b.bezelStyle = .accessoryBarAction // action variant for accessory bar
                    b.bezelStyle = .badge              // badge / count indicator
                    b.bezelStyle = .smallSquare        // square small button
                    b.bezelStyle = .circular           // circular icon button
                    b.bezelStyle = .helpButton         // ? help button
                    b.bezelStyle = .disclosure         // triangle disclosure
                    b.bezelStyle = .pushDisclosure     // recessed disclosure
                    b.bezelStyle = .automatic          // platform resolves the style
                    """)
                }

                block("Image, tint, and prominence") {
                    snippet("""
                    b.image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)
                    b.imagePosition = .imageLeading   // .noImage / .imageOnly / .imageLeading / .imageTrailing
                                                       // .imageAbove / .imageBelow / .imageOverlaps
                    b.imageScaling = .scaleProportionallyDown
                    b.imageHugsTitle = false

                    b.contentTintColor = .controlAccentColor
                    b.tintProminence = .secondary      // .automatic / .primary / .secondary / .tertiary
                    b.borderShape = .roundedRectangle  // .roundedSquare / .roundedRectangle / .circle / .capsule
                    b.hasDestructiveAction = true      // hint to system: tint as destructive
                    """)
                }

                block("Key equivalent and tri-state") {
                    snippet("""
                    b.keyEquivalent = "\\r"            // Return acts as default-button key
                    b.keyEquivalentModifierMask = [.command]

                    // Tri-state: .off → .on → .mixed → .off
                    b.allowsMixedState = true
                    b.setNextState()
                    """)
                }
            }
        }
    }

    // MARK: NSPopUpButton

    private var popUpButtonSection: some View {
        PageSection("NSPopUpButton") {
            VStack(alignment: .leading, spacing: 16) {
                block("Pop-up (selection retained) vs pull-down (fixed title)") {
                    VStack(alignment: .leading, spacing: 12) {
                        NSPopUpButtonDemo(
                            titles: popUpItems,
                            pullsDown: pullsDown,
                            pullDownTitle: "Actions",
                            selectedIndex: $selectedIndex
                        )
                        .frame(height: 28)
                        .frame(maxWidth: 240)
                        .padding(12)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                        HStack(spacing: 12) {
                            Text("pullsDown").font(.caption).foregroundStyle(.secondary)
                            Picker("", selection: $pullsDown) {
                                Text("false (pop-up — shows selection)").tag(false)
                                Text("true (pull-down — fixed title)").tag(true)
                            }
                            .labelsHidden()
                            .pickerStyle(.radioGroup)
                        }

                        if !pullsDown {
                            HStack(spacing: 12) {
                                Text("selectedIndex").font(.caption).foregroundStyle(.secondary)
                                Stepper(value: $selectedIndex, in: 0...(popUpItems.count - 1)) {
                                    Text("\(selectedIndex) — \(popUpItems[selectedIndex])").font(.caption).fontDesign(.monospaced)
                                }
                                .frame(width: 280)
                            }
                        }

                        APICallout("let b = NSPopUpButton(frame: .zero, pullsDown: false)")
                        APICallout("b.addItems(withTitles: [\"Small\", \"Medium\", \"Large\"])")
                        APICallout("b.selectItem(at: 1)")
                    }
                }

                block("Initializers") {
                    snippet("""
                    NSPopUpButton(frame: rect, pullsDown: false)               // pop-up
                    NSPopUpButton(frame: rect, pullsDown: true)                // pull-down
                    NSPopUpButton(image: img, pullDownMenu: menu)              // image-only pull-down
                    NSPopUpButton(popUpMenu: menu, target: self, action: ...)
                    NSPopUpButton(title: "Actions", image: img, pullDownMenu: menu)
                    """)
                }

                block("Adding, removing, and selecting items") {
                    snippet("""
                    b.addItem(withTitle: "Small")
                    b.addItems(withTitles: ["Medium", "Large"])
                    b.insertItem(withTitle: "Tiny", at: 0)
                    b.removeItem(withTitle: "Tiny")
                    b.removeItem(at: 0)
                    b.removeAllItems()

                    b.selectItem(at: 1)
                    b.selectItem(withTitle: "Medium")
                    b.selectItem(withTag: 42)
                    b.select(menuItem)

                    let item  = b.selectedItem           // NSMenuItem? (pop-up only)
                    let title = b.titleOfSelectedItem    // String?
                    let i     = b.indexOfSelectedItem
                    """)
                }

                block("Pull-down configuration") {
                    snippet("""
                    b.pullsDown = true               // fixed-title menu; first item is the label
                    b.altersStateOfSelectedItem      // toggle .on/.off of chosen item
                    b.usesItemFromMenu               // clone menu item as button title content
                    b.preferredEdge = .maxY          // pop-up direction in constrained layouts
                    b.autoenablesItems = true        // items respond to NSMenuValidation
                    """)
                }
            }
        }
    }

    // MARK: NSComboButton

    private var comboButtonSection: some View {
        PageSection("NSComboButton") {
            VStack(alignment: .leading, spacing: 16) {
                block("Default action + pull-down menu (.split vs .unified)") {
                    VStack(alignment: .leading, spacing: 12) {
                        NSComboButtonDemo(title: comboTitle, style: comboStyle)
                            .frame(height: 32)
                            .frame(maxWidth: 240)
                            .padding(12)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                        HStack(spacing: 12) {
                            Text("title").font(.caption).foregroundStyle(.secondary)
                            TextField("", text: $comboTitle).frame(width: 200)
                        }

                        HStack(spacing: 12) {
                            Text("style").font(.caption).foregroundStyle(.secondary)
                            Picker("", selection: $comboStyle) {
                                Text("split (chevron is its own hit zone)").tag(NSComboButton.Style.split)
                                Text("unified (long-press shows menu)").tag(NSComboButton.Style.unified)
                            }
                            .labelsHidden()
                            .pickerStyle(.radioGroup)
                        }

                        APICallout("NSComboButton(title: \"Save\", menu: menu, target: nil, action: nil)")
                        APICallout("button.style = .split   // .split / .unified")
                    }
                }

                block("Initializers and style") {
                    snippet("""
                    NSComboButton(title: "Save", menu: menu, target: nil, action: nil)
                    NSComboButton(image: img, menu: menu, target: nil, action: nil)
                    NSComboButton(title: "Save", image: img, menu: menu, target: nil, action: nil)

                    button.style = .split      // separate hit zones for title and chevron
                    button.style = .unified    // single surface; long-press reveals menu
                    """)
                }

                block("Menu construction") {
                    snippet("""
                    let menu = NSMenu()
                    menu.addItem(withTitle: "Save As\u{2026}", action: #selector(saveAs(_:)), keyEquivalent: "")
                    menu.addItem(withTitle: "Export\u{2026}",  action: #selector(export(_:)), keyEquivalent: "")
                    menu.addItem(NSMenuItem.separator())
                    menu.addItem(withTitle: "Send to\u{2026}", action: #selector(send(_:)),   keyEquivalent: "")
                    button.menu = menu

                    // Image scaling:
                    button.image = NSImage(systemSymbolName: "square.and.arrow.up", accessibilityDescription: nil)
                    button.imageScaling = .scaleProportionallyDown

                    // Primary action:
                    button.target = self
                    button.action = #selector(save(_:))   // tap on title runs the default action
                    """)
                }
            }
        }
    }

    // MARK: NSStatusBarButton

    private var statusBarButtonSection: some View {
        PageSection("NSStatusBarButton") {
            VStack(alignment: .leading, spacing: 16) {
                block("Status bar item integration") {
                    snippet("""
                    // Create the status item (retain it in a property — it's deallocated if released):
                    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

                    // Access the button:
                    if let button = statusItem.button {
                        button.image = NSImage(systemSymbolName: "bolt.fill", accessibilityDescription: "Bolt")
                        button.toolTip = "My App"
                        button.appearsDisabled = false     // dims without affecting isEnabled
                        button.target = self
                        button.action = #selector(statusItemClicked(_:))
                    }

                    // Variable-length item (title shown next to icon):
                    let wide = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
                    wide.button?.title = "My App"
                    wide.button?.image = NSImage(systemSymbolName: "bolt.fill", accessibilityDescription: nil)
                    """)
                }

                block("Key properties") {
                    snippet("""
                    // Inherited from NSButton:
                    button.image             // shown in the menu bar
                    button.alternateImage    // shown while menu is open
                    button.title             // text label alongside image
                    button.toolTip           // hover tooltip
                    button.isEnabled         // disables the item (rare)
                    button.appearsDisabled   // dims visually without disabling behavior
                    button.sendAction(on:)   // typically .leftMouseUp or .leftMouseDown
                    """)
                }

                block("Right-click / long-press menu") {
                    snippet("""
                    // Assign a menu to the status item (not the button) for auto popover:
                    statusItem.menu = NSMenu()
                    statusItem.menu?.addItem(withTitle: "Preferences", action: #selector(showPrefs), keyEquivalent: ",")
                    statusItem.menu?.addItem(withTitle: "Quit", action: #selector(NSApp.terminate), keyEquivalent: "q")

                    // Note: if a menu is set, the button's action is NOT called — the menu appears instead.
                    """)
                }
            }
        }
    }

    // MARK: NSButtonTouchBarItem (describe-only)

    private var touchBarItemSection: some View {
        PageSection("NSButtonTouchBarItem") {
            VStack(alignment: .leading, spacing: 16) {
                block("Describe — Touch Bar button item (no renderable demo)") {
                    Text("NSButtonTouchBarItem places an NSButton in the Touch Bar. It cannot be rendered in a standard macOS window without Touch Bar hardware. All content below is type-signature reference only.")
                        .font(.callout).foregroundStyle(.secondary)

                    snippet("""
                    // NSButtonTouchBarItem type signatures:
                    class NSButtonTouchBarItem: NSTouchBarItem  // macOS 10.15+

                    init(identifier: NSTouchBarItem.Identifier, title: String,
                         image: NSImage?, target: AnyObject?, action: Selector?)

                    static func withTitleAndTarget(_ title: String,
                                                   target: AnyObject?,
                                                   action: Selector?) -> NSButtonTouchBarItem

                    static func withImage(_ image: NSImage,
                                          target: AnyObject?,
                                          action: Selector?) -> NSButtonTouchBarItem

                    var title: String
                    var image: NSImage?
                    var bezelColor: NSColor?              // tints the bezel
                    var isEnabled: Bool
                    var target: AnyObject?
                    var action: Selector?
                    var customizationLabel: String        // shown in Touch Bar customization UI
                    """)
                }

                block("Touch Bar setup context") {
                    snippet("""
                    // Set up Touch Bar in an NSViewController:
                    override func makeTouchBar() -> NSTouchBar? {
                        let bar = NSTouchBar()
                        bar.delegate = self
                        bar.defaultItemIdentifiers = [.myButton]
                        return bar
                    }

                    func touchBar(_ touchBar: NSTouchBar,
                                  makeItemForIdentifier id: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
                        guard id == .myButton else { return nil }
                        return NSButtonTouchBarItem(
                            identifier: id,
                            title: "Action",
                            image: NSImage(systemSymbolName: "bolt", accessibilityDescription: nil),
                            target: self,
                            action: #selector(touchBarAction(_:))
                        )
                    }
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("doc.text", "NSButton inherits NSControl. NSPopUpButton and NSStatusBarButton are subclasses. NSComboButton is a separate NSControl subclass (macOS 13.0+), not an NSButton subclass.")
                noteRow("paintbrush", "bezelStyle resolves automatically to system look — pick the semantic one (.push / .toolbar / .helpButton / .accessoryBar) over hand-styling.")
                noteRow("hand.point.up", "Tri-state checkbox: set allowsMixedState = true and call setNextState() in the action to cycle .off → .on → .mixed → .off.")
                noteRow("info.circle", "tintProminence (macOS 11+) maps the system accent through .primary / .secondary / .tertiary tiers — prefer it over hardcoded contentTintColor.")
                noteRow("menubar", "NSStatusBarButton is accessed only via NSStatusItem.button — never instantiated directly. Retain the NSStatusItem or the status bar item disappears.")
                noteRow("hand.draw", "NSButtonTouchBarItem requires Touch Bar hardware and an NSTouchBar setup — there is no standalone view to embed. No renderable demo is possible in a standard macOS window.")
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

extension NSButtonPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewsAndControls.nsButton",
        title: "NSButton",
        folder: "Views and controls",
        framework: .appKit,
        absorbedSymbols: [
            "NSButton",
            "NSPopUpButton",
            "NSComboButton",
            "NSStatusBarButton",
            "NSButtonTouchBarItem"
        ],
        blurb: "A control that defines an area on the screen that a user clicks to trigger an action. Absorbs the full NSButton family: NSPopUpButton, NSComboButton, NSStatusBarButton, and NSButtonTouchBarItem.",
        signature: "class NSButton : NSControl",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/views-and-controls/nsbutton.md",
        page: { AnyView(NSButtonPage()) }
    )
}

#Preview {
    NSButtonPage().frame(width: 1100, height: 900)
}
