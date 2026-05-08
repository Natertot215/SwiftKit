import SwiftUI

/// Gallery page scaffold for Actions and Behavior. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ActionsAndBehaviorGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "accessibilityAction(_:_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityAction(named:_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityAction(intent:label:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityActions(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityAdjustableAction(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityScrollAction(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityZoomAction(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityActivationPoint(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityDragPoint(_:description:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityDropPoint(_:description:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityDirectTouch(_:options:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityQuickAction(style:content:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityRespondsToUserInteraction(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityFocused(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityFocused(_:equals:)", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityFocusState", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityActionKind", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityActionCategory", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityAdjustmentDirection", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityDirectTouchOptions", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityZoomGestureAction", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityQuickActionStyle", api: nil) { Color.clear }
            VariantTile(name: "accessibilityElement(children:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityHidden(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityChildren(children:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityRepresentation(representation:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityAddTraits(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityRemoveTraits(_:)", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityTraits", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityChildBehavior", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityAttachmentModifier", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityTechnologies", api: nil) { Color.clear }
        }
    }
}

extension ActionsAndBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.actionsAndBehavior",
        title: "Actions and Behavior",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: ["ActionsandBehavior", "accessibilityAction"],
        blurb: "Actions and Behavior — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ActionsAndBehaviorGalleryPage()) }
    )
}
