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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
