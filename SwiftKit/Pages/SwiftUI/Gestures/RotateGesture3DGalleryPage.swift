import SwiftUI

struct RotateGesture3DGalleryPage: View {
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

extension RotateGesture3DGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.rotateGesture3D",
        title: "RotateGesture3D",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "RotateGesture3D"
        ],
        blurb: "A gesture that recognizes 3D rotation motion and tracks the angle and axis of the rotation. Constrainable to a specific axis with constrainedToAxis:.",
        signature: "struct RotateGesture3D",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/gestures/rotategesture3d.md",
        page: { AnyView(RotateGesture3DGalleryPage()) }
    )
}

#Preview {
    RotateGesture3DGalleryPage()
        .frame(width: 900, height: 700)
}
