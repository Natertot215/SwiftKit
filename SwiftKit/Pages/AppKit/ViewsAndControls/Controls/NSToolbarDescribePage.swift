import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSToolbar — a window-attached toolbar manager.
// Source: Documentation/AppKit/views-and-controls/nstoolbar.md
//
// Why describe rather than render: NSToolbar attaches to NSWindow.toolbar.
// A child NSViewRepresentable can't host one without spinning up an internal
// NSWindow + NSWindowController, which would be re-implementing window chrome.
// The right surface to point at is SwiftKit's host window — its title bar
// already shows a real NSToolbar (configured by the SwiftUI shell).

struct NSToolbarDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSToolbar",
            docPath: "Documentation/AppKit/views-and-controls/nstoolbar.md",
            availability: "macOS",
            blurb: """
            An object that manages the space above your app's custom content \
            and either below or integrated with the window's title bar. \
            NSToolbar owns an ordered list of NSToolbarItem objects and \
            renders them in the chrome of an NSWindow.

            Lifecycle:

              \u{2022} Construct with init(identifier:) — the identifier is \
            the autosave key. Multiple toolbars sharing an identifier sync \
            their items and state.
              \u{2022} Assign an NSToolbarDelegate that supplies items via \
            toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:) \
            (see "Integrating a Toolbar and Touch Bar into Your App").
              \u{2022} Attach to a window: window.toolbar = toolbar.

            NSToolbar exposes runtime configuration knobs (displayMode, \
            isVisible, allowsUserCustomization, autosavesConfiguration) and \
            commands for inserting/removing items at runtime. Window > \
            Customize Toolbar invokes runCustomizationPalette(_:).

            NSToolbar attaches to a window, not to a child view, so SwiftKit \
            describes the API instead of rendering one. The SwiftKit window's \
            own title bar already hosts a real NSToolbar managed by the \
            SwiftUI shell.
            """,
            signatures: [
                "@MainActor class NSToolbar",
                "init(identifier: NSToolbar.Identifier)",
                "var delegate: (any NSToolbarDelegate)?",
                "var items: [NSToolbarItem]",
                "var visibleItems: [NSToolbarItem]?",
                "var displayMode: NSToolbar.DisplayMode  // .default / .iconAndLabel / .iconOnly / .labelOnly",
                "var allowsUserCustomization: Bool",
                "var autosavesConfiguration: Bool",
                "var selectedItemIdentifier: NSToolbarItem.Identifier?",
                "func insertItem(withItemIdentifier: NSToolbarItem.Identifier, at: Int)",
                "func runCustomizationPalette(_ sender: Any?)",
                "func validateVisibleItems()"
            ],
            notes: [
                "Window-attached. NSToolbar lives on NSWindow.toolbar; you can't host one inside a child view.",
                "Item construction is delegate-driven — see NSToolbarDelegate and the 'Integrating a Toolbar...' article.",
                "displayMode and the deprecated sizeMode/.NSToolbar.SizeMode pair: prefer displayMode on macOS 26 — sizeMode is marked deprecated.",
                "Identifier is the autosave key. Reuse it across windows that should share configuration; pick a unique one when you don't want sharing."
            ]
        )
    }
}

#Preview {
    NSToolbarDescribePage()
        .frame(width: 900, height: 700)
}
