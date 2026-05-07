import SwiftUI

struct ShareLinkGalleryPage: View {
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

extension ShareLinkGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.shareLink",
        title: "ShareLink",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: [
            "ShareLink",
            "SharePreview"
        ],
        blurb: "A view that controls a system sharing presentation. Optionally pair with a SharePreview to customize how the shared content appears in the share sheet.",
        signature: "struct ShareLink<Data, PreviewImage, PreviewIcon, Label> where Data : RandomAccessCollection, PreviewImage : Transferable, PreviewIcon : Transferable, Label : View, Data.Element : Transferable",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/sharelink.md",
        page: { AnyView(ShareLinkGalleryPage()) }
    )
}

#Preview {
    ShareLinkGalleryPage()
        .frame(width: 900, height: 700)
}
