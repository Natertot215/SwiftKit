import SwiftUI

/// Gallery page scaffold for Gestures. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct GesturesGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "TapGesture", api: nil) { Color.clear }
            VariantTile(name: "SpatialTapGesture", api: nil) { Color.clear }
            VariantTile(name: "LongPressGesture", api: nil) { Color.clear }
            VariantTile(name: "DragGesture", api: nil) { Color.clear }
            VariantTile(name: "MagnifyGesture", api: nil) { Color.clear }
            VariantTile(name: "MagnificationGesture", api: nil) { Color.clear }
            VariantTile(name: "RotateGesture", api: nil) { Color.clear }
            VariantTile(name: "RotateGesture3D", api: nil) { Color.clear }
            VariantTile(name: "RotationGesture", api: nil) { Color.clear }
            VariantTile(name: "SpatialEventGesture", api: nil) { Color.clear }
            VariantTile(name: "SpatialEventCollection", api: nil) { Color.clear }
            VariantTile(name: "WindowDragGesture", api: nil) { Color.clear }
            VariantTile(name: "SequenceGesture", api: nil) { Color.clear }
            VariantTile(name: "SimultaneousGesture", api: nil) { Color.clear }
            VariantTile(name: "ExclusiveGesture", api: nil) { Color.clear }
            VariantTile(name: "AnyGesture", api: nil) { Color.clear }
            VariantTile(name: "Gesture", api: nil) { Color.clear }
            VariantTile(name: "GestureState", api: nil) { Color.clear }
            VariantTile(name: "GestureStateGesture", api: nil) { Color.clear }
            VariantTile(name: "GestureMask", api: nil) { Color.clear }
            VariantTile(name: "gesture(_:)", api: nil) { Color.clear }
            VariantTile(name: "highPriorityGesture(_:including:)", api: nil) { Color.clear }
            VariantTile(name: "simultaneousGesture(_:including:)", api: nil) { Color.clear }
            VariantTile(name: "onTapGesture(count:coordinateSpace:perform:)", api: nil) { Color.clear }
            VariantTile(name: "onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)", api: nil) { Color.clear }
        }
    }
}

extension GesturesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gesturesAndInput.gestures",
        title: "Gestures",
        folder: "Gestures and Input",
        framework: .swiftUI,
        absorbedSymbols: ["Gestures", "LongPressGesture", "SpatialTapGesture", "TapGesture"],
        blurb: "Gestures — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(GesturesGalleryPage()) }
    )
}
