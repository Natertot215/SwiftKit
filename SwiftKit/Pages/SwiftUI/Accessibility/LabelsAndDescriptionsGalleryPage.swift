import SwiftUI

/// Gallery page scaffold for Labels and Descriptions. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct LabelsAndDescriptionsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "accessibilityLabel(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityLabel(_:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityLabel(content:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityHint(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityHint(_:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityValue(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityValue(_:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityIdentifier(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityIdentifier(_:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityInputLabels(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityInputLabels(_:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityHeading(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityTextContentType(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityCustomContent(_:_:importance:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityLabeledPair(role:id:in:)", api: nil) { Color.clear }
            VariantTile(name: "speechAlwaysIncludesPunctuation(_:)", api: nil) { Color.clear }
            VariantTile(name: "speechSpellsOutCharacters(_:)", api: nil) { Color.clear }
            VariantTile(name: "speechAdjustedPitch(_:)", api: nil) { Color.clear }
            VariantTile(name: "speechAnnouncementsQueued(_:)", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityCustomContentKey", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityTextContentType", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityHeadingLevel", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityLabeledPairRole", api: nil) { Color.clear }
            VariantTile(name: "AXChartDescriptorRepresentable", api: nil) { Color.clear }
            VariantTile(name: "accessibilityChartDescriptor(_:)", api: nil) { Color.clear }
        }
    }
}

extension LabelsAndDescriptionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.labelsAndDescriptions",
        title: "Labels and Descriptions",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: ["LabelsandDescriptions", "accessibilityLabel"],
        blurb: "Labels and Descriptions — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(LabelsAndDescriptionsGalleryPage()) }
    )
}
