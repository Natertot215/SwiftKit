import SwiftUI

struct PasteButtonGalleryPage: View {
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

extension PasteButtonGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.pasteButton",
        title: "PasteButton",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["PasteButton"],
        blurb: "A system button that reads Transferable items from the system pasteboard and delivers them to a closure.",
        signature: "@MainActor @preconcurrency struct PasteButton",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/pastebutton.md",
        page: { AnyView(PasteButtonGalleryPage()) }
    )
}

#Preview {
    PasteButtonGalleryPage()
        .frame(width: 900, height: 700)
}
