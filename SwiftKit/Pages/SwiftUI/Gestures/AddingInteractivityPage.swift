import SwiftUI

// Gesture overview + Chirality, HandGestureShortcut, WindowDragGesture,
// allowsWindowActivationEvents, SpatialEventGesture/SpatialTapGesture doc page.
// The guide content is covered in GestureCompositionPage + GestureDocsPage.
// This file provides the "Adding interactivity with gestures" article entry.

struct AddingInteractivityPage: View {
    var body: some View {
        DescribePage(
            title: "Adding Interactivity with Gestures",
            docPath: "Documentation/SwiftUI/gestures/",
            availability: "macOS 10.15+",
            blurb: """
            "Adding interactivity with gestures" is Apple's guide article for the SwiftUI \
            gesture system. It explains the full lifecycle of gesture recognition, the \
            protocol hierarchy, and how to attach multiple recognizers to a single view.

            Key concepts covered:
            • Gesture protocol — the root protocol all gesture types conform to.
            • onEnded, onChanged, updating — the three observation points in a gesture lifecycle.
            • Composing gestures: ExclusiveGesture, SimultaneousGesture, SequenceGesture.
            • GestureMask — which views' gestures can interfere.
            • View/gesture(_:), .simultaneousGesture(_:), .highPriorityGesture(_:).

            Live demo versions of each gesture type are in the sibling gallery pages: \
            DragGesturePage, TapGesturePage, MagnifyRotateGesturePage, \
            GestureCompositionPage.
            """,
            signatures: [
                "view.gesture(MyGesture())",
                "view.gesture(DragGesture(), including: .subviews)",
                "view.gesture(TapGesture(), isEnabled: isInteractive)",
                "view.highPriorityGesture(LongPressGesture())",
                "view.simultaneousGesture(TapGesture())"
            ],
            notes: [
                "The guide is at Documentation/SwiftUI/gestures/ in the local mirror.",
                "Gesture is a protocol, not a struct — it cannot be rendered as a standalone view.",
                "See GestureCompositionPage for live composition demos."
            ]
        )
    }
}

#Preview {
    AddingInteractivityPage().frame(width: 900, height: 600)
}
