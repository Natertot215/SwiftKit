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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
