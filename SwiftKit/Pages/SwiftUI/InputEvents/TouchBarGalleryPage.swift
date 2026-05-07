import SwiftUI

struct TouchBarGalleryPage: View {
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

extension TouchBarGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.touchBar",
        title: "TouchBar",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "TouchBar",
            "View/touchBar(_:)",
            "View/touchBar(content:)",
            "View/touchBarItemPrincipal(_:)",
            "View/touchBarCustomizationLabel(_:)",
            "View/touchBarItemPresence(_:)",
            "TouchBarItemPresence"
        ],
        blurb: "Container for views shown in the MacBook Pro Touch Bar. The TouchBar value plus its companion modifiers (touchBar, touchBarItemPrincipal, touchBarCustomizationLabel, touchBarItemPresence) declare which controls appear and how customization treats them.",
        signature: "struct TouchBar<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/input-events/touchbar.md",
        page: { AnyView(TouchBarGalleryPage()) }
    )
}

#Preview {
    TouchBarGalleryPage()
        .frame(width: 900, height: 700)
}
