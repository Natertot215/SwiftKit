import SwiftUI

struct MagnifyGestureGalleryPage: View {
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

extension MagnifyGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.magnifyGesture",
        title: "MagnifyGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "MagnifyGesture",
            "MagnificationGesture"
        ],
        blurb: "A gesture that recognizes a magnification motion and tracks the amount of magnification. MagnifyGesture (macOS 14+) supersedes the deprecated MagnificationGesture.",
        signature: "struct MagnifyGesture",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/gestures/magnifygesture.md",
        page: { AnyView(MagnifyGestureGalleryPage()) }
    )
}

#Preview {
    MagnifyGestureGalleryPage()
        .frame(width: 900, height: 700)
}
