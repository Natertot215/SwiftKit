import SwiftUI

struct ToggleGalleryPage: View {
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

extension ToggleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.toggle",
        title: "Toggle",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["Toggle"],
        blurb: "A control that toggles between on and off states. Bind isOn to a Boolean and supply a label that describes the switching behavior.",
        signature: "struct Toggle<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/toggle.md",
        page: { AnyView(ToggleGalleryPage()) }
    )
}

#Preview {
    ToggleGalleryPage()
        .frame(width: 900, height: 700)
}
