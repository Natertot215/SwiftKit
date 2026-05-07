import SwiftUI

struct AccessibilityZoomActionGalleryPage: View {
    @State private var zoomLevel: Double = 1.0

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Demo

            VariantTile(
                name: "zoom handler",
                api: ".accessibilityZoomAction { action in … }"
            ) {
                VStack(spacing: 6) {
                    Image(systemName: "map.fill")
                        .font(.title2)
                        .scaleEffect(zoomLevel)
                    Text(String(format: "%.1fx", zoomLevel))
                        .font(.caption)
                        .monospacedDigit()
                }
                .frame(width: 120, height: 70)
                .accessibilityZoomAction { action in
                    switch action.direction {
                    case .zoomIn:
                        zoomLevel = min(zoomLevel + 0.2, 3)
                    case .zoomOut:
                        zoomLevel = max(zoomLevel - 0.2, 0.5)
                    @unknown default:
                        break
                    }
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityZoomGestureAction",
                signature: "struct AccessibilityZoomGestureAction { var direction; var location; var phase }",
                note: "Carries direction (.zoomIn / .zoomOut), gesture location as a UnitPoint, and phase (.begin, .change, .end). React to `phase == .end` for one-shot zoom changes."
            )

            ReferenceTile(
                name: "AccessibilityZoomGestureAction.Direction",
                signature: "enum Direction { case zoomIn, zoomOut }",
                note: "VoiceOver users invoke a zoom action with two-finger double tap. Switch Control offers explicit Zoom In / Zoom Out commands."
            )

            ReferenceTile(
                name: "When to apply",
                signature: "Maps, image viewers, document canvases — anywhere you support pinch-to-zoom visually.",
                note: "Without this modifier, VoiceOver users can't zoom views you've made pinchable. The handler is your one path to expose zoom semantics to assistive tech."
            )
        }
    }
}

extension AccessibilityZoomActionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityZoomAction",
        title: "AccessibilityZoomAction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityZoomAction(_:)",
            "AccessibilityZoomGestureAction",
            "swiftui.accessible-controls.accessibilityzoomaction(_:)",
            "swiftui.accessible-controls.accessibilityzoomgestureaction"
        ],
        blurb: "Adds an action to allow VoiceOver users to zoom a view via two-finger double tap gestures. The handler receives an AccessibilityZoomGestureAction describing direction and phase.",
        signature: "func accessibilityZoomAction(_ handler: @escaping (AccessibilityZoomGestureAction) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityzoomaction(_:).md",
        page: { AnyView(AccessibilityZoomActionGalleryPage()) }
    )
}

#Preview {
    AccessibilityZoomActionGalleryPage()
        .frame(width: 900, height: 700)
}
