import SwiftUI

/// Gallery page scaffold for Custom Content. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct CustomContentGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "accessibilityRotor(_:entries:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityRotor(_:textRanges:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityRotorEntry(id:in:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityLinkedGroup(id:in:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilitySortPriority(_:)", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityRotorEntry", api: nil) { Color.clear }
            VariantTile(name: "AccessibilitySystemRotor", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityRotorContent", api: nil) { Color.clear }
            VariantTile(name: "AccessibilityRotorContentBuilder", api: nil) { Color.clear }
            VariantTile(name: "accessibilityIgnoresInvertColors(_:)", api: nil) { Color.clear }
            VariantTile(name: "accessibilityShowsLargeContentViewer()", api: nil) { Color.clear }
            VariantTile(name: "accessibilityShowsLargeContentViewer(_:)", api: nil) { Color.clear }
            VariantTile(name: "LegibilityWeight", api: nil) { Color.clear }
            VariantTile(name: "AssistiveAccess", api: nil) { Color.clear }
        }
    }
}

extension CustomContentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.customContent",
        title: "Custom Content",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: ["CustomContent", "accessibilityRotor", "accessibilityRotorEntry"],
        blurb: "Custom Content — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(CustomContentGalleryPage()) }
    )
}
