import SwiftUI

struct AccessibilityDirectTouchGalleryPage: View {
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
                name: "default direct-touch area",
                api: ".accessibilityDirectTouch()"
            ) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.tint.opacity(0.2))
                    .frame(width: 140, height: 60)
                    .overlay(Text("Drawing canvas").font(.caption))
                    .accessibilityDirectTouch()
            }

            VariantTile(
                name: "silent on touch",
                api: ".accessibilityDirectTouch(options: .silentOnTouch)"
            ) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.tint.opacity(0.2))
                    .frame(width: 140, height: 60)
                    .overlay(Text("Pad").font(.caption))
                    .accessibilityDirectTouch(options: .silentOnTouch)
            }

            VariantTile(
                name: "requires activation",
                api: ".accessibilityDirectTouch(options: .requiresActivation)"
            ) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.tint.opacity(0.2))
                    .frame(width: 140, height: 60)
                    .overlay(Text("Instrument").font(.caption))
                    .accessibilityDirectTouch(options: .requiresActivation)
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityDirectTouchOptions",
                signature: "struct AccessibilityDirectTouchOptions : OptionSet  // .silentOnTouch, .requiresActivation",
                note: "OptionSet used to refine direct-touch behavior. Combine flags as needed."
            )

            ReferenceTile(
                name: "When to reach for it",
                signature: "Drawing canvases, musical instruments, video-game controls, signature pads.",
                note: "VoiceOver normally swallows touches to read elements aloud. Direct touch lets the underlying view receive raw input — at the cost of standard VoiceOver navigation inside the region."
            )
        }
    }
}

extension AccessibilityDirectTouchGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityDirectTouch",
        title: "AccessibilityDirectTouch",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityDirectTouch(_:options:)",
            "AccessibilityDirectTouchOptions",
            "swiftui.accessible-controls.accessibilitydirecttouch(_:options:)",
            "swiftui.accessible-controls.accessibilitydirecttouchoptions"
        ],
        blurb: "Marks a region as one that VoiceOver passes through directly so users can interact with it without VoiceOver intercepting touches. Useful for drawing canvases and musical instruments.",
        signature: "func accessibilityDirectTouch(_ isDirectTouchArea: Bool = true, options: AccessibilityDirectTouchOptions = []) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilitydirecttouch(_:options:).md",
        page: { AnyView(AccessibilityDirectTouchGalleryPage()) }
    )
}

#Preview {
    AccessibilityDirectTouchGalleryPage()
        .frame(width: 900, height: 700)
}
