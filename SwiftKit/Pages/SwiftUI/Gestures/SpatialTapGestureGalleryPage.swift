import SwiftUI

struct SpatialTapGestureGalleryPage: View {
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

extension SpatialTapGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.spatialTapGesture",
        title: "SpatialTapGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "SpatialTapGesture"
        ],
        blurb: "A gesture that recognizes one or more taps and reports their location, so you can react to where on the view the tap occurred.",
        signature: "struct SpatialTapGesture",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/gestures/spatialtapgesture.md",
        page: { AnyView(SpatialTapGestureGalleryPage()) }
    )
}

#Preview {
    SpatialTapGestureGalleryPage()
        .frame(width: 900, height: 700)
}
