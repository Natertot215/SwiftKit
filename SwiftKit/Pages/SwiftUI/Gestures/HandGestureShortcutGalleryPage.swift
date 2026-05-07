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
            ReferenceTile(
                name: "HandGestureShortcut",
                signature: "struct HandGestureShortcut  ·  .primaryAction",
                note: "Names a hand-gesture shortcut that activates a button or toggle. Currently exposes a single value, .primaryAction, mapped to the platform's primary hand gesture (visionOS pinch).",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "View.handGestureShortcut(_:isEnabled:)",
                signature: "func handGestureShortcut(_ shortcut: HandGestureShortcut, isEnabled: Bool = true) -> some View",
                note: "Attach to a Button or Toggle to wire its action to the named hand-gesture shortcut. Pair with isEnabled: to gate availability based on app state.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "HandActivationBehavior",
                signature: "struct HandActivationBehavior  ·  .automatic  ·  .pinch",
                note: "Configures the activation policy a control accepts. .automatic respects the user's System Settings; .pinch forces the pinch activation regardless of preference.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Apply only to controls whose action benefits from a system-recognized gesture.",
                note: "Hand gesture shortcuts are macOS-surfaced for SDK parity but only render on visionOS hardware. SwiftKit shows the API surface; live demos require visionOS."
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
