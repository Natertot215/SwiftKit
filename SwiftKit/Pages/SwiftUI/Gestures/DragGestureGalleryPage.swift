import SwiftUI

struct DragGestureGalleryPage: View {
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

extension DragGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.dragGesture",
        title: "DragGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "DragGesture"
        ],
        blurb: "A dragging motion that invokes an action as the drag-event sequence changes. Tracks translation, location, predicted end location, and time across updating, onChanged, and onEnded callbacks.",
        signature: "struct DragGesture",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/draggesture.md",
        page: { AnyView(DragGestureGalleryPage()) }
    )
}

#Preview {
    DragGestureGalleryPage()
        .frame(width: 900, height: 700)
}
