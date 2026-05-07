import SwiftUI

struct ExclusiveGestureGalleryPage: View {
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

extension ExclusiveGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.exclusiveGesture",
        title: "ExclusiveGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "ExclusiveGesture"
        ],
        blurb: "A gesture that consists of two gestures where only one of them can succeed. The first gesture takes precedence; the second only fires if the first fails.",
        signature: "@frozen struct ExclusiveGesture<First, Second> where First : Gesture, Second : Gesture",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/exclusivegesture.md",
        page: { AnyView(ExclusiveGestureGalleryPage()) }
    )
}

#Preview {
    ExclusiveGestureGalleryPage()
        .frame(width: 900, height: 700)
}
