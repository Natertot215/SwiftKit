import SwiftUI

struct HoverGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension HoverGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.hover",
        title: "Hover",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onHover(perform:)",
            "View/onContinuousHover(coordinateSpace:perform:)",
            "HoverPhase"
        ],
        blurb: "Detects pointer enter/exit on a view's frame. onHover reports a Bool, onContinuousHover reports a HoverPhase with the pointer location while the pointer remains over the view.",
        signature: "func onHover(perform action: @escaping (Bool) -> Void) -> some View",
        availability: "macOS 10.15+ (onContinuousHover: macOS 14.0+)",
        docPath: "Documentation/SwiftUI/input-events/onhover(perform:).md",
        page: { AnyView(HoverGalleryPage()) }
    )
}

#Preview {
    HoverGalleryPage()
        .frame(width: 900, height: 700)
}
