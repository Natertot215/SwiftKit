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
            "swiftui.appkit-integration.unifying-your-app-s-animations"
        ],
        blurb: "An AppKit view controller that hosts a SwiftUI view hierarchy. Use it to embed SwiftUI inside an AppKit-driven app, or to present SwiftUI content from existing AppKit navigation.",
        signature: "class NSHostingController<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/appkit-integration/nshostingcontroller.md",
        page: { AnyView(NSHostingControllerGalleryPage()) }
    )
}

#Preview {
    NSHostingControllerGalleryPage()
        .frame(width: 900, height: 700)
}
