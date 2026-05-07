import SwiftUI

struct AccessibilityDragPointGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Demos

            VariantTile(
                name: "single drag point",
                api: #".accessibilityDragPoint(.center, description: Text("Move card"))"#
            ) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.tint.opacity(0.25))
                    .frame(width: 120, height: 60)
                    .overlay(Text("Drag me").font(.caption))
                    .accessibilityDragPoint(.center, description: Text("Move card"))
            }

            VariantTile(
                name: "named handle",
                api: #".accessibilityDragPoint(.topLeading, description: Text("Top-left grip"))"#
            ) {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.tint, lineWidth: 1.5)
                    .frame(width: 120, height: 60)
                    .accessibilityDragPoint(
                        .topLeading,
                        description: Text("Top-left grip")
                    )
            }

            // MARK: Reference

            ReferenceTile(
                name: "Pair with accessibilityDropPoint",
                signature: ".accessibilityDropPoint(_:description:)",
                note: "A drag origin without a drop target can't complete an accessible drag-and-drop. Define both endpoints with descriptive labels VoiceOver speaks during the gesture."
            )

            ReferenceTile(
                name: "isEnabled overload",
                signature: "func accessibilityDragPoint(_:description:isEnabled:)",
                note: "Toggle drag availability per state — for example, disable while a row is in edit mode or while a transaction is pending."
            )

            ReferenceTile(
                name: "Description text",
                signature: "Text(\"Move {item} to a new column\")",
                note: "VoiceOver reads the description verbatim when the user starts a drag. Use full sentences and identify the item being dragged."
            )
        }
    }
}

extension AccessibilityDragPointGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityDragPoint",
        title: "AccessibilityDragPoint",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityDragPoint(_:description:)",
            "View/accessibilityDragPoint(_:description:isEnabled:)",
            "swiftui.accessible-controls.accessibilitydragpoint(_:description:)",
            "swiftui.accessible-controls.accessibilitydragpoint(_:description:isenabled:)"
        ],
        blurb: "Defines a drag origin and description that assistive technologies use to start an accessible drag gesture from a custom view.",
        signature: "func accessibilityDragPoint(_ point: UnitPoint, description: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilitydragpoint(_:description:).md",
        page: { AnyView(AccessibilityDragPointGalleryPage()) }
    )
}

#Preview {
    AccessibilityDragPointGalleryPage()
        .frame(width: 900, height: 700)
}
