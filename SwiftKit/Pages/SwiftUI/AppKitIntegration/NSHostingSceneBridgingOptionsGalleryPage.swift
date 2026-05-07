import SwiftUI

struct NSHostingSceneBridgingOptionsGalleryPage: View {
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

extension NSHostingSceneBridgingOptionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsHostingSceneBridgingOptions",
        title: "NSHostingSceneBridgingOptions",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: ["NSHostingSceneBridgingOptions"],
        blurb: "Options for how hosting views and controllers manage aspects of the associated window. OptionSet covering title, toolbars, and the all/none combinations exposed via sceneBridgingOptions.",
        signature: "struct NSHostingSceneBridgingOptions",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/appkit-integration/nshostingscenebridgingoptions.md",
        page: { AnyView(NSHostingSceneBridgingOptionsGalleryPage()) }
    )
}

#Preview {
    NSHostingSceneBridgingOptionsGalleryPage()
        .frame(width: 900, height: 700)
}
