import SwiftUI

struct ControlSizeGalleryPage: View {
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

extension ControlSizeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.controlSize",
        title: "ControlSize",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: [
            "ControlSize",
            "View/controlSize(_:)"
        ],
        blurb: "The size classes — like regular, small, mini, large, and extraLarge — that you can apply to controls within a view via the controlSize(_:) modifier.",
        signature: "enum ControlSize",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/controlsize.md",
        page: { AnyView(ControlSizeGalleryPage()) }
    )
}

#Preview {
    ControlSizeGalleryPage()
        .frame(width: 900, height: 700)
}
