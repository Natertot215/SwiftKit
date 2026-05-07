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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
