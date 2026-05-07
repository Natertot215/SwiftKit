import SwiftUI

struct DigitalCrownAccessoryGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "View.digitalCrownAccessory(_:)",
                signature: "func digitalCrownAccessory(_ visibility: Visibility) -> some View",
                note: "Toggles visibility of the system Digital Crown accessory (the small label near the crown). Pass .visible, .hidden, or .automatic.",
                badge: "watchOS"
            )

            ReferenceTile(
                name: "View.digitalCrownAccessory(content:)",
                signature: "func digitalCrownAccessory<C>(@ViewBuilder content: () -> C) -> some View where C : View",
                note: "Replaces the system accessory with custom content — typically a small label or symbol that hints at what the crown affects on the focused view.",
                badge: "watchOS"
            )

            ReferenceTile(
                name: "macOS availability",
                signature: "Compiles on macOS for SDK parity; live-rendered only on watchOS hardware.",
                note: "SwiftKit ships a macOS-only target. The modifiers accept arguments here so cross-platform code compiles, but no Digital Crown accessory exists on this platform."
            )

            ReferenceTile(
                name: "Companion modifier",
                signature: "View.digitalCrownRotation(_:…) — pairs with the accessory.",
                note: "An accessory typically describes the value the crown drives. Pair with digitalCrownRotation so the focused view's accessory and rotation handler stay in sync."
            )
        }
    }
}

extension DigitalCrownAccessoryGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.digitalCrownAccessory",
        title: "DigitalCrownAccessory",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/digitalCrownAccessory(_:)",
            "View/digitalCrownAccessory(content:)"
        ],
        blurb: "Configures the accessory shown alongside the Digital Crown — either toggling the system accessory's visibility or providing custom accessory content. watchOS-leaning; surfaced cross-platform for SDK parity.",
        signature: "func digitalCrownAccessory(_ visibility: Visibility) -> some View",
        availability: "watchOS 9.0+",
        docPath: "Documentation/SwiftUI/input-events/digitalcrownaccessory(_:).md",
        page: { AnyView(DigitalCrownAccessoryGalleryPage()) }
    )
}

#Preview {
    DigitalCrownAccessoryGalleryPage()
        .frame(width: 900, height: 700)
}
