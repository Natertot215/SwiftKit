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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
