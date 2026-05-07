import SwiftUI

struct PencilGesturesGalleryPage: View {
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

extension PencilGesturesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.pencilGestures",
        title: "PencilGestures",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onPencilDoubleTap(perform:)",
            "View/onPencilSqueeze(perform:)",
            "PencilDoubleTapGestureValue",
            "PencilSqueezeGestureValue",
            "PencilSqueezeGesturePhase",
            "PencilHoverPose",
            "PencilPreferredAction"
        ],
        blurb: "Apple Pencil interaction modifiers and value types. onPencilDoubleTap and onPencilSqueeze deliver double-tap and squeeze events; the companion value types describe each gesture's phase, location, and preferred action.",
        signature: nil,
        availability: "macOS 14.5+",
        docPath: "Documentation/SwiftUI/gestures/onpencildoubletap(perform:).md",
        page: { AnyView(PencilGesturesGalleryPage()) }
    )
}

#Preview {
    PencilGesturesGalleryPage()
        .frame(width: 900, height: 700)
}
