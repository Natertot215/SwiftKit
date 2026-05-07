import SwiftUI

struct AccessibilityDropPointGalleryPage: View {
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
                name: "default drop target",
                api: #".accessibilityDropPoint(.center, description: Text("Drop into Inbox"))"#
            ) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.tint.opacity(0.15))
                    .frame(width: 140, height: 60)
                    .overlay(Text("Inbox").font(.caption))
                    .accessibilityDropPoint(
                        .center,
                        description: Text("Drop into Inbox")
                    )
            }

            VariantTile(
                name: "edge target",
                api: #".accessibilityDropPoint(.bottom, description: Text("Append to bottom of list"))"#
            ) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.tint.opacity(0.15))
                    .frame(width: 140, height: 60)
                    .overlay(Text("Playlist").font(.caption))
                    .accessibilityDropPoint(
                        .bottom,
                        description: Text("Append to bottom of list")
                    )
            }

            // MARK: Reference

            ReferenceTile(
                name: "Pair with accessibilityDragPoint",
                signature: ".accessibilityDragPoint(_:description:)",
                note: "A drop point is meaningless without a defined drag origin somewhere else in the same view hierarchy."
            )

            ReferenceTile(
                name: "isEnabled overload",
                signature: "func accessibilityDropPoint(_:description:isEnabled:)",
                note: "Disable drop targets per state — useful when a column rejects new items or a quota is reached."
            )

            ReferenceTile(
                name: "Multiple targets per view",
                signature: "Apply the modifier multiple times with different UnitPoints.",
                note: "Each invocation registers a separate drop point. VoiceOver presents them as a chooser when the user releases."
            )
        }
    }
}

extension AccessibilityDropPointGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityDropPoint",
        title: "AccessibilityDropPoint",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityDropPoint(_:description:)",
            "View/accessibilityDropPoint(_:description:isEnabled:)",
            "swiftui.accessible-controls.accessibilitydroppoint(_:description:)",
            "swiftui.accessible-controls.accessibilitydroppoint(_:description:isenabled:)"
        ],
        blurb: "Defines a drop target and description that assistive technologies use to complete an accessible drag-and-drop gesture into a custom view.",
        signature: "func accessibilityDropPoint(_ point: UnitPoint, description: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilitydroppoint(_:description:).md",
        page: { AnyView(AccessibilityDropPointGalleryPage()) }
    )
}

#Preview {
    AccessibilityDropPointGalleryPage()
        .frame(width: 900, height: 700)
}
