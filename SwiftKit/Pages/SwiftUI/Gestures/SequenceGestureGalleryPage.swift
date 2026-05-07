import SwiftUI

struct SequenceGestureGalleryPage: View {
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

extension SequenceGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.sequenceGesture",
        title: "SequenceGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "SequenceGesture",
            "Composing SwiftUI gestures"
        ],
        blurb: "A gesture that's a sequence of two gestures: SwiftUI must recognize the first before it recognizes the second. Use sequenced(before:) to compose, e.g., a long press followed by a drag.",
        signature: "@frozen struct SequenceGesture<First, Second> where First : Gesture, Second : Gesture",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/sequencegesture.md",
        page: { AnyView(SequenceGestureGalleryPage()) }
    )
}

#Preview {
    SequenceGestureGalleryPage()
        .frame(width: 900, height: 700)
}
