import SwiftUI

struct LongPressGestureGalleryPage: View {
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

extension LongPressGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.longPressGesture",
        title: "LongPressGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "LongPressGesture",
            "View/onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)",
            "View/onLongPressGesture(minimumDuration:perform:onPressingChanged:)",
            "View/onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)"
        ],
        blurb: "A gesture that succeeds when the user performs a long press. Pair with the onLongPressGesture(...) modifier for the common case, or attach a LongPressGesture instance via gesture(_:) for full updating/onChanged/onEnded callbacks.",
        signature: "struct LongPressGesture",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/longpressgesture.md",
        page: { AnyView(LongPressGestureGalleryPage()) }
    )
}

#Preview {
    LongPressGestureGalleryPage()
        .frame(width: 900, height: 700)
}
