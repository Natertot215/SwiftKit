import SwiftUI

struct ButtonGalleryPage: View {
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

extension ButtonGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.button",
        title: "Button",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: [
            "Button",
            "DefaultButtonLabel"
        ],
        blurb: "A control that initiates an action. Compose with a label view describing the action; SwiftUI styles it appropriately for context.",
        signature: "struct Button<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/button.md",
        page: { AnyView(ButtonGalleryPage()) }
    )
}

#Preview {
    ButtonGalleryPage()
        .frame(width: 900, height: 700)
}
