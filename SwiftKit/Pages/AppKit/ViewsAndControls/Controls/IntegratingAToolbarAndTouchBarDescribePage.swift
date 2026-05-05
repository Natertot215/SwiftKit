import SwiftUI

// Article-style describe page for the "Integrating a Toolbar and Touch Bar
// into Your App" sample-code article.
// Source: Documentation/AppKit/views-and-controls/integrating-a-toolbar-and-touch-bar-into-your-app.md

struct IntegratingAToolbarAndTouchBarDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Integrating a Toolbar and Touch Bar into Your App",
            docPath: "Documentation/AppKit/views-and-controls/integrating-a-toolbar-and-touch-bar-into-your-app.md",
            availability: "macOS 10.13",
            blurb: """
            Apple's sample-code article that walks through the full delegate- \
            driven setup for an NSToolbar plus a parallel NSTouchBar. \
            It documents the canonical recipe Apple expects every \
            toolbar-integrating macOS app to follow.

            The recipe, in order:

              1. Create an NSWindowController subclass that conforms to \
            NSToolbarDelegate. Wire NSToolbar.delegate to the controller.
              2. Define your custom NSToolbarItem.Identifier values as static \
            constants in a private extension.
              3. Implement toolbarAllowedItemIdentifiers(_:) to declare every \
            item the user can choose in the customization palette, plus the \
            standard identifiers (.space, .flexibleSpace, .print, etc.).
              4. Implement toolbarDefaultItemIdentifiers(_:) to declare the \
            initial set of items shown the first time the user launches.
              5. Implement toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:) \
            to construct an NSToolbarItem for each custom identifier. Standard \
            identifiers are constructed by AppKit — don't return one yourself.
              6. (Optional) Implement toolbarWillAddItem(_:) to mutate item \
            attributes (toolTip, target) just before insertion.
              7. Set NSToolbar.allowsUserCustomization = true and \
            NSToolbar.autosavesConfiguration = true to enable View > Customize \
            Toolbar and persist user reordering across launches.
              8. Override NSResponder.makeTouchBar() to mirror the toolbar to \
            an NSTouchBar driven by NSTouchBarDelegate.

            The sample's full Swift source is the reference implementation \
            for any custom toolbar in macOS — this page summarizes the steps \
            and points back to the markdown for the complete code listings.
            """,
            signatures: [
                "Sample article (no single API surface)",
                "Anchor types: NSWindowController, NSToolbar, NSToolbarDelegate",
                "Toolbar delegate: toolbarAllowedItemIdentifiers(_:) / toolbarDefaultItemIdentifiers(_:) / toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:) / toolbarWillAddItem(_:)",
                "Persistence: NSToolbar.allowsUserCustomization, NSToolbar.autosavesConfiguration",
                "Touch Bar mirror: NSResponder.makeTouchBar(), NSTouchBar, NSTouchBarDelegate"
            ],
            notes: [
                "Article, not API — there's nothing to render. The local doc has the full Swift listings.",
                "The toolbar lives on NSWindow, not on a child view. SwiftUI apps reach toolbars through .toolbar(content:); pure-AppKit apps wire NSToolbar to NSWindowController.window?.toolbar.",
                "The Touch Bar half of the article is largely historical — recent MacBook Pro models ship without a Touch Bar — but the toolbar half is current macOS 26 doctrine."
            ]
        )
    }
}

#Preview {
    IntegratingAToolbarAndTouchBarDescribePage()
        .frame(width: 900, height: 700)
}
