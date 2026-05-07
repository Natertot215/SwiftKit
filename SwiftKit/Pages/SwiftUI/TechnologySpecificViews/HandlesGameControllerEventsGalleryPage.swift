import SwiftUI

struct HandlesGameControllerEventsGalleryPage: View {
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

extension HandlesGameControllerEventsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.handlesGameControllerEvents",
        title: "HandlesGameControllerEvents",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/handlesGameControllerEvents(matching:)"
        ],
        blurb: "GameController modifier that declares the view as a handler for game controller events matching a given event mask.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/handlesgamecontrollerevents(matching:).md",
        page: { AnyView(HandlesGameControllerEventsGalleryPage()) }
    )
}

#Preview {
    HandlesGameControllerEventsGalleryPage()
        .frame(width: 900, height: 700)
}
