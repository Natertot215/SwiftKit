import SwiftUI

struct AnyGestureGalleryPage: View {
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

extension AnyGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.anyGesture",
        title: "AnyGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "AnyGesture"
        ],
        blurb: "A type-erased gesture. Use AnyGesture to return heterogeneous gesture types from a single property or function.",
        signature: "@frozen struct AnyGesture<Value>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/anygesture.md",
        page: { AnyView(AnyGestureGalleryPage()) }
    )
}

#Preview {
    AnyGestureGalleryPage()
        .frame(width: 900, height: 700)
}
