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
            ReferenceTile(
                name: "SpatialEventGesture",
                signature: "struct SpatialEventGesture : Gesture  // Value == SpatialEventCollection",
                note: "Surfaces ongoing spatial events (clicks, touches, pinches) on supported platforms. The gesture's Value is a SpatialEventCollection — iterate it to inspect every concurrent event.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "SpatialEventCollection",
                signature: "struct SpatialEventCollection : Collection { struct Event { id, location, phase, kind, … } }",
                note: "A collection of spatial events. Each Event includes a stable id, a location, a phase (.active / .ended), a kind (.touch, .indirectPinch, .pointer), and a hand chirality (.left, .right) when applicable."
            )

            ReferenceTile(
                name: "Chirality",
                signature: "enum Chirality  ·  .left  ·  .right",
                note: "Identifies which hand produced an event. Use to drive bilateral interactions where left vs. right hand should map to different actions."
            )

            ReferenceTile(
                name: "Use cases",
                signature: "Multi-finger drawing, two-hand object manipulation, spatial multi-select.",
                note: "SpatialEventGesture is intended for canvases that need raw simultaneous-event access. For everyday taps and drags use SpatialTapGesture or DragGesture."
            )

            ReferenceTile(
                name: "macOS availability",
                signature: "Compiles on macOS 15+; events deliver on visionOS hardware.",
                note: "Surfaced cross-platform for SDK parity. SwiftKit's macOS preview cannot generate SpatialEventCollection contents."
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
