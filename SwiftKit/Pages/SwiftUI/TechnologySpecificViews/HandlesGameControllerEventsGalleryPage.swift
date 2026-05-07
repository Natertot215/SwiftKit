import SwiftUI

struct HandlesGameControllerEventsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "handlesGameControllerEvents(matching:)",
                signature: "func handlesGameControllerEvents(matching mask: GCUIEventTypes) -> some View",
                note: "Declares that this view handles a given class of game controller events. Without the modifier, gamepad input flows to the system's default handlers (focus engine, parental-control overlays)."
            )

            ReferenceTile(
                name: "GCUIEventTypes",
                signature: "struct GCUIEventTypes: OptionSet  //  .gamepad, .pause, .menu …",
                note: "Mask the event categories the view consumes. Common usage is .gamepad — letting your app receive raw button/stick input — combined with reading GCController.controllers() for state."
            )

            ReferenceTile(
                name: "Required import",
                signature: "import GameController",
                note: "GameController framework. Gate the modifier behind GCController.controllers().isEmpty == false if you also support keyboard/mouse input, so non-gamepad sessions stay clean."
            )

            ReferenceTile(
                name: "Use case",
                signature: "Custom game scenes / immersive controller routing",
                note: "The default focus engine (used for buttons and pickers) intercepts dpad/stick events. Apply this modifier on the in-game view so SwiftUI lets the events reach your input system instead."
            )
        }
    }
}

extension HandlesGameControllerEventsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.handlesGameControllerEvents",
        title: "HandlesGameControllerEvents",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/handlesGameControllerEvents(matching:)"
        ],
        blurb: "GameController modifier that declares the view as a handler for game controller events matching a given event mask.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/handlesgamecontrollerevents(matching:).md",
        page: { AnyView(HandlesGameControllerEventsGalleryPage()) }
    )
}

#Preview {
    HandlesGameControllerEventsGalleryPage()
        .frame(width: 900, height: 700)
}
