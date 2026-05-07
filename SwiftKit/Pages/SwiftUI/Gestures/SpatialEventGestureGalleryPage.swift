import SwiftUI

struct SpatialEventGestureGalleryPage: View {
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

extension SpatialEventGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.spatialEventGesture",
        title: "SpatialEventGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "SpatialEventGesture",
            "SpatialEventCollection",
            "Chirality"
        ],
        blurb: "A gesture that surfaces ongoing spatial events such as clicks and touches. Iterate the SpatialEventCollection to inspect each event's location, phase, and chirality.",
        signature: "struct SpatialEventGesture",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/gestures/spatialeventgesture.md",
        page: { AnyView(SpatialEventGestureGalleryPage()) }
    )
}

#Preview {
    SpatialEventGestureGalleryPage()
        .frame(width: 900, height: 700)
}
