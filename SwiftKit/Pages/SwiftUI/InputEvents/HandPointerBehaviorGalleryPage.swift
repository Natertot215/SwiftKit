import SwiftUI

struct HandPointerBehaviorGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "HandPointerBehavior",
                signature: "struct HandPointerBehavior  ·  .automatic  ·  .preferred  ·  .prohibited",
                note: "Configures whether a view should encourage or suppress the hand pointer in spatial contexts. .preferred draws the cursor; .prohibited hides it.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "View.handPointerBehavior(_:)",
                signature: "func handPointerBehavior(_ behavior: HandPointerBehavior?) -> some View",
                note: "Applies a hand-pointer behavior to a view. Pass nil to inherit the parent's setting.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "macOS 26 availability",
                signature: "Compiles on macOS 26 for SDK parity; renders only on visionOS hardware.",
                note: "SwiftKit's macOS preview displays the modifier surface only. Live cursor behavior requires a visionOS device."
            )

            ReferenceTile(
                name: "Use cases",
                signature: "Annotation-heavy surfaces (canvases, code editors) should prefer the pointer; immersive 3D scenes can prohibit it.",
                note: "Use .preferred for any control that benefits from a precise indicator and .prohibited where the pointer competes with content (full-screen video, fully spatial scenes)."
            )
        }
    }
}

extension HandPointerBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.handPointerBehavior",
        title: "HandPointerBehavior",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "HandPointerBehavior",
            "View/handPointerBehavior(_:)"
        ],
        blurb: "Configures how the hand pointer behaves while interacting with a view in spatial contexts. visionOS-leaning behavior; macOS surfaces it for cross-platform code paths.",
        signature: "struct HandPointerBehavior",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/input-events/handpointerbehavior.md",
        page: { AnyView(HandPointerBehaviorGalleryPage()) }
    )
}

#Preview {
    HandPointerBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
