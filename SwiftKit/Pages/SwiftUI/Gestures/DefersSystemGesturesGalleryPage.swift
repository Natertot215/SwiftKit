import SwiftUI

struct DefersSystemGesturesGalleryPage: View {
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

extension DefersSystemGesturesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.defersSystemGestures",
        title: "DefersSystemGestures",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/defersSystemGestures(on:)"
        ],
        blurb: "Sets the screen edges from which an app gesture takes precedence over the system's edge gesture. Useful inside drawing or game canvases that need to capture edge swipes.",
        signature: "func defersSystemGestures(on edges: Edge.Set) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/gestures/deferssystemgestures(on:).md",
        page: { AnyView(DefersSystemGesturesGalleryPage()) }
    )
}

#Preview {
    DefersSystemGesturesGalleryPage()
        .frame(width: 900, height: 700)
}
