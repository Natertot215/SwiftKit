import SwiftUI

struct NSGestureRecognizerRepresentableGalleryPage: View {
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

extension NSGestureRecognizerRepresentableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsGestureRecognizerRepresentable",
        title: "NSGestureRecognizerRepresentable",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: [
            "NSGestureRecognizerRepresentable",
            "NSGestureRecognizerRepresentableContext",
            "NSGestureRecognizerRepresentableCoordinateSpaceConverter"
        ],
        blurb: "A wrapper for an NSGestureRecognizer that you use to integrate that recognizer into your SwiftUI hierarchy. Attach via .gesture; supports environment, data dependencies, and a coordinate-space converter for translating hits.",
        signature: "protocol NSGestureRecognizerRepresentable",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/appkit-integration/nsgesturerecognizerrepresentable.md",
        page: { AnyView(NSGestureRecognizerRepresentableGalleryPage()) }
    )
}

#Preview {
    NSGestureRecognizerRepresentableGalleryPage()
        .frame(width: 900, height: 700)
}
