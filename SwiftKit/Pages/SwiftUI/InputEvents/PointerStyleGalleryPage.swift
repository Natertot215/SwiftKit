import SwiftUI

struct PointerStyleGalleryPage: View {
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

extension PointerStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.pointerStyle",
        title: "PointerStyle",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "PointerStyle",
            "View/pointerStyle(_:)",
            "View/pointerVisibility(_:)"
        ],
        blurb: "Customizes the pointer's appearance over a view. Built-in styles (.default, .link, .text, .horizontalText, .grabIdle, .grabActive, .frameResize, .columnResize, .rowResize, .zoomIn, .zoomOut) plus visibility control via pointerVisibility.",
        signature: "struct PointerStyle",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/input-events/pointerstyle.md",
        page: { AnyView(PointerStyleGalleryPage()) }
    )
}

#Preview {
    PointerStyleGalleryPage()
        .frame(width: 900, height: 700)
}
