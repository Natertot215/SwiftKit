import SwiftUI

struct WindowDragGestureGalleryPage: View {
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

extension WindowDragGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.windowDragGesture",
        title: "WindowDragGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowDragGesture",
            "View/allowsWindowActivationEvents(_:)"
        ],
        blurb: "A gesture that recognizes the motion of and handles dragging the containing window. Pair with allowsWindowActivationEvents(_:) so dragging works even while the window is inactive.",
        signature: "struct WindowDragGesture",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/gestures/windowdraggesture.md",
        page: { AnyView(WindowDragGestureGalleryPage()) }
    )
}

#Preview {
    WindowDragGestureGalleryPage()
        .frame(width: 900, height: 700)
}
