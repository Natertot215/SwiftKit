import SwiftUI

struct GestureGalleryPage: View {
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

extension GestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.gesture",
        title: "Gesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "Gesture",
            "View/gesture(_:)",
            "View/gesture(_:isEnabled:)",
            "View/gesture(_:name:isEnabled:)",
            "View/gesture(_:including:)",
            "GestureMask",
            "GestureState",
            "GestureStateGesture",
            "Adding interactivity with gestures"
        ],
        blurb: "The protocol that all SwiftUI gestures conform to. Attach gestures to views with the gesture(_:) family of modifiers; track transient state with @GestureState; constrain interaction with GestureMask.",
        signature: "@MainActor @preconcurrency protocol Gesture<Value>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/gesture.md",
        page: { AnyView(GestureGalleryPage()) }
    )
}

#Preview {
    GestureGalleryPage()
        .frame(width: 900, height: 700)
}
