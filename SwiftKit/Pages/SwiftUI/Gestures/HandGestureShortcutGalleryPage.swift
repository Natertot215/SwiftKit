import SwiftUI

struct HandGestureShortcutGalleryPage: View {
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

extension HandGestureShortcutGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.handGestureShortcut",
        title: "HandGestureShortcut",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "HandGestureShortcut",
            "View/handGestureShortcut(_:isEnabled:)",
            "HandActivationBehavior"
        ],
        blurb: "Hand gesture shortcuts describe finger and wrist movements that activate a button or toggle. Apply to controls with handGestureShortcut(_:isEnabled:); configure activation policy with HandActivationBehavior.",
        signature: "struct HandGestureShortcut",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/gestures/handgestureshortcut.md",
        page: { AnyView(HandGestureShortcutGalleryPage()) }
    )
}

#Preview {
    HandGestureShortcutGalleryPage()
        .frame(width: 900, height: 700)
}
