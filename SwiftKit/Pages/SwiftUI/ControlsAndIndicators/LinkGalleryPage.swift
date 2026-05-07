import SwiftUI

struct LinkGalleryPage: View {
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

extension LinkGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.link",
        title: "Link",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["Link"],
        blurb: "A control for navigating to a URL. Pair a destination URL with a title or label that describes the link's purpose.",
        signature: "@MainActor @preconcurrency struct Link<Label> where Label : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/link.md",
        page: { AnyView(LinkGalleryPage()) }
    )
}

#Preview {
    LinkGalleryPage()
        .frame(width: 900, height: 700)
}
