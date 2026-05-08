import SwiftUI

/// Gallery page scaffold for FocusState. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct FocusStateGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "FocusState", api: nil) { Color.clear }
            VariantTile(name: "FocusedValue", api: nil) { Color.clear }
            VariantTile(name: "FocusedBinding", api: nil) { Color.clear }
            VariantTile(name: "FocusedObject", api: nil) { Color.clear }
            VariantTile(name: "FocusedValues", api: nil) { Color.clear }
            VariantTile(name: "FocusedValueKey", api: nil) { Color.clear }
            VariantTile(name: "ResetFocusAction", api: nil) { Color.clear }
            VariantTile(name: "DefaultFocusEvaluationPriority", api: nil) { Color.clear }
            VariantTile(name: "FocusInteractions", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityFocusState", api: nil) { Color.clear }
            VariantTile(name: "focused(_:)", api: nil) { Color.clear }
            VariantTile(name: "focused(_:equals:)", api: nil) { Color.clear }
            VariantTile(name: "focusable(_:)", api: nil) { Color.clear }
            VariantTile(name: "focusable(_:interactions:)", api: nil) { Color.clear }
            VariantTile(name: "focusEffectDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "focusScope(_:)", api: nil) { Color.clear }
            VariantTile(name: "focusSection()", api: nil) { Color.clear }
            VariantTile(name: "defaultFocus(_:_:priority:)", api: nil) { Color.clear }
            VariantTile(name: "focusedValue(_:)", api: nil) { Color.clear }
            VariantTile(name: "focusedValue(_:_:)", api: nil) { Color.clear }
            VariantTile(name: "focusedSceneValue(_:)", api: nil) { Color.clear }
            VariantTile(name: "focusedSceneValue(_:_:)", api: nil) { Color.clear }
            VariantTile(name: "focusedSceneObject(_:)", api: nil) { Color.clear }
            VariantTile(name: "focusedObject(_:)", api: nil) { Color.clear }
            VariantTile(name: "prefersDefaultFocus(_:in:)", api: nil) { Color.clear }
            VariantTile(name: "searchFocused(_:)", api: nil) { Color.clear }
        }
    }
}

extension FocusStateGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gesturesAndInput.focusState",
        title: "FocusState",
        folder: "Gestures and Input",
        framework: .swiftUI,
        absorbedSymbols: ["FocusState", "FocusedBinding", "FocusedValue"],
        blurb: "FocusState — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(FocusStateGalleryPage()) }
    )
}
