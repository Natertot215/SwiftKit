import SwiftUI

struct RotateGestureGalleryPage: View {
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

extension RotateGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.rotateGesture",
        title: "RotateGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "RotateGesture",
            "RotationGesture"
        ],
        blurb: "A gesture that recognizes a rotation motion and tracks the angle of the rotation. RotateGesture (macOS 14+) supersedes the deprecated RotationGesture.",
        signature: "struct RotateGesture",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/gestures/rotategesture.md",
        page: { AnyView(RotateGestureGalleryPage()) }
    )
}

#Preview {
    RotateGestureGalleryPage()
        .frame(width: 900, height: 700)
}
