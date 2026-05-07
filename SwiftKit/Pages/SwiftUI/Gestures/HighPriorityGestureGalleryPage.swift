import SwiftUI

struct HighPriorityGestureGalleryPage: View {
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

extension HighPriorityGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.highPriorityGesture",
        title: "HighPriorityGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/highPriorityGesture(_:including:)",
            "View/highPriorityGesture(_:isEnabled:)",
            "View/highPriorityGesture(_:name:isEnabled:)"
        ],
        blurb: "Attaches a gesture that takes precedence over any gestures already defined on the view's children. Use when an ancestor must intercept input before descendant gestures can recognize it.",
        signature: "func highPriorityGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/highprioritygesture(_:including:).md",
        page: { AnyView(HighPriorityGestureGalleryPage()) }
    )
}

#Preview {
    HighPriorityGestureGalleryPage()
        .frame(width: 900, height: 700)
}
