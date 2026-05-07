import SwiftUI

struct NSHostingViewGalleryPage: View {
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

extension NSHostingViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsHostingView",
        title: "NSHostingView",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: ["NSHostingView"],
        blurb: "An AppKit view that hosts a SwiftUI view hierarchy. Drop into an existing AppKit view tree to surface SwiftUI content as an NSView subclass while SwiftUI manages layout and event delivery.",
        signature: "class NSHostingView<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/appkit-integration/nshostingview.md",
        page: { AnyView(NSHostingViewGalleryPage()) }
    )
}

#Preview {
    NSHostingViewGalleryPage()
        .frame(width: 900, height: 700)
}
