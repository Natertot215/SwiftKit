import SwiftUI

struct NSHostingControllerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "NSHostingController",
                signature: "class NSHostingController<Content> : NSViewController where Content : View",
                note: "AppKit view controller that wraps a SwiftUI view hierarchy. Use to embed SwiftUI inside an AppKit-driven app, or to present SwiftUI content from existing AppKit navigation (NSWindowController, NSSplitViewController, segues)."
            )

            ReferenceTile(
                name: "Initializer",
                signature: "init(rootView: Content)",
                note: "Construct with the SwiftUI view that becomes the controller's content. The view tree is owned by the controller; rebuild the controller to swap in a different root view."
            )

            ReferenceTile(
                name: "Present from AppKit",
                signature: "windowController.contentViewController = NSHostingController(rootView: MyView())",
                note: "Standard pattern for embedding SwiftUI in an AppKit window. Also valid as a sheet (presentAsSheet), modal (presentAsModalWindow), or popover (NSPopover.contentViewController)."
            )

            ReferenceTile(
                name: "NSHostingSizingOptions",
                signature: "struct NSHostingSizingOptions : OptionSet  // .preferredContentSize, .intrinsicContentSize, .standardBounds",
                note: "Configures how the SwiftUI content participates in Auto Layout. .standardBounds is the default; opt into preferredContentSize or intrinsicContentSize when sizing is driven by enclosing AppKit layout."
            )

            ReferenceTile(
                name: "NSHostingSceneBridgingOptions",
                signature: "struct NSHostingSceneBridgingOptions : OptionSet  // .title, .toolbar, .all",
                note: "macOS 12+. Controls which scene-level pieces — window title, toolbar — bridge from the hosted SwiftUI tree to the enclosing window. Set on sceneBridgingOptions to opt in."
            )

            ReferenceTile(
                name: "Drives unified animations",
                signature: "AppKit and SwiftUI animations are synchronized when bridged through NSHostingController",
                note: "Runs SwiftUI's transaction system in lockstep with AppKit's animation context — sheets, popovers, and toolbar transitions stay coherent across the boundary."
            )
        }
    }
}

extension NSHostingControllerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsHostingController",
        title: "NSHostingController",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: [
            "NSHostingController",
            "NSHostingSceneBridgingOptions",
            "NSHostingSizingOptions",
            "swiftui.appkit-integration.unifying-your-app-s-animations"
        ],
        blurb: "An AppKit view controller that hosts a SwiftUI view hierarchy. Use it to embed SwiftUI inside an AppKit-driven app, or to present SwiftUI content from existing AppKit navigation. The page also covers the option-set types that configure it: NSHostingSceneBridgingOptions (window title and toolbar bridging) and NSHostingSizingOptions (Auto Layout sizing behavior).",
        signature: "NSHostingController<Content> \u{00b7} NSHostingSceneBridgingOptions \u{00b7} NSHostingSizingOptions",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/appkit-integration/nshostingcontroller.md",
        page: { AnyView(NSHostingControllerGalleryPage()) }
    )
}

#Preview {
    NSHostingControllerGalleryPage()
        .frame(width: 900, height: 700)
}
