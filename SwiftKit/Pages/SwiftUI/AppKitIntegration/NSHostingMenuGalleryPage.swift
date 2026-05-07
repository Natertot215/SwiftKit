import SwiftUI

struct NSHostingMenuGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "NSHostingMenu",
                signature: "class NSHostingMenu<Content> : NSMenu where Content : View",
                note: "AppKit NSMenu subclass whose items are defined declaratively by a SwiftUI view tree. Drop into existing NSMenu hierarchies — context menus, dock menus, status-bar menus — and let SwiftUI authoring drive the contents."
            )

            ReferenceTile(
                name: "Initializer",
                signature: "init(rootView: Content)",
                note: "Construct with the SwiftUI view that supplies the menu's items — typically a Group of Buttons, Toggles, Pickers, and Dividers wrapped by Section, Menu, or Picker for nested submenus."
            )

            ReferenceTile(
                name: "Mount on an existing NSMenu",
                signature: "menuItem.submenu = NSHostingMenu(rootView: MyMenu())",
                note: "Assign the hosting menu as a submenu on an NSMenuItem, or as the dockMenu / statusItem.menu directly. AppKit lifecycle and event delivery work as usual."
            )

            ReferenceTile(
                name: "Allowed item kinds",
                signature: "Button · Toggle · Picker · Menu · Section · Divider · Text",
                note: "Same vocabulary that's valid inside SwiftUI's Menu { … } content. Custom views render as labels but don't get interactive menu semantics — keep the content closure to menu-eligible primitives."
            )

            ReferenceTile(
                name: "Compare to SwiftUI Menu",
                signature: "Menu { … }  vs  NSHostingMenu(rootView: …)",
                note: "Use SwiftUI Menu inside a SwiftUI hierarchy. Reach for NSHostingMenu only when you need to inject SwiftUI-authored items into AppKit code paths that demand an NSMenu."
            )
        }
    }
}

extension NSHostingMenuGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsHostingMenu",
        title: "NSHostingMenu",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: ["NSHostingMenu"],
        blurb: "An AppKit menu whose items are defined by a SwiftUI View. NSMenu subclass — drop into existing AppKit menu hierarchies and let SwiftUI declarations drive the items.",
        signature: "class NSHostingMenu<Content> where Content : View",
        availability: "macOS 14.4+",
        docPath: "Documentation/SwiftUI/appkit-integration/nshostingmenu.md",
        page: { AnyView(NSHostingMenuGalleryPage()) }
    )
}

#Preview {
    NSHostingMenuGalleryPage()
        .frame(width: 900, height: 700)
}
