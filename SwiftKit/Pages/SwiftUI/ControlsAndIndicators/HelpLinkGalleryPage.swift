import SwiftUI

struct HelpLinkGalleryPage: View {
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

extension HelpLinkGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.helpLink",
        title: "HelpLink",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["HelpLink"],
        blurb: "A button with a standard appearance that opens app-specific help documentation, typically jumping to an anchor in an Apple Help book.",
        signature: "struct HelpLink",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/helplink.md",
        page: { AnyView(HelpLinkGalleryPage()) }
    )
}

#Preview {
    HelpLinkGalleryPage()
        .frame(width: 900, height: 700)
}
