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
            "Adding interactivity with gestures",
            "Composing SwiftUI gestures",
            "ExclusiveGesture",
            "Gesture",
            "GestureMask",
            "GestureState",
            "GestureStateGesture",
            "SequenceGesture",
            "SimultaneousGesture",
            "View/gesture(_:)",
            "View/gesture(_:including:)",
            "View/gesture(_:isEnabled:)",
            "View/gesture(_:name:isEnabled:)",
            "View/highPriorityGesture(_:including:)",
            "View/highPriorityGesture(_:isEnabled:)",
            "View/highPriorityGesture(_:name:isEnabled:)",
            "View/simultaneousGesture(_:including:)",
            "View/simultaneousGesture(_:isEnabled:)",
            "View/simultaneousGesture(_:name:isEnabled:)"
        ],
        blurb: "The protocol that all SwiftUI gestures conform to, attached to views via the gesture(_:) family and tracked with @GestureState. Composition wrappers layer recognizers together: HighPriorityGesture intercepts ahead of children, SimultaneousGesture runs two recognizers in parallel, ExclusiveGesture lets only one win, and SequenceGesture chains one after another.",
        signature: "Gesture \u{00b7} HighPriorityGesture \u{00b7} SimultaneousGesture \u{00b7} ExclusiveGesture \u{00b7} SequenceGesture \u{00b7} GestureMask \u{00b7} GestureState",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/gesture.md",
        page: { AnyView(GestureGalleryPage()) }
    )
}

#Preview {
    GestureGalleryPage()
        .frame(width: 900, height: 700)
}
