import SwiftUI

struct OrnamentGalleryPage: View {
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

extension OrnamentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.toolbars.ornament",
        title: "Ornament",
        folder: "Toolbars",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/ornament(visibility:attachmentAnchor:contentAlignment:ornament:)",
            "OrnamentAttachmentAnchor"
        ],
        blurb: "Presents an ornament attached to a scene at a specified anchor — visionOS-only, included here for API completeness on macOS.",
        signature: "func ornament<Content>(visibility: Visibility = .automatic, attachmentAnchor: OrnamentAttachmentAnchor, contentAlignment: Alignment3D = .back, @ViewBuilder ornament: () -> Content) -> some View where Content : View",
        availability: "visionOS 1.0+",
        docPath: "Documentation/SwiftUI/toolbars/ornament(visibility:attachmentanchor:contentalignment:ornament:).md",
        page: { AnyView(OrnamentGalleryPage()) }
    )
}

#Preview {
    OrnamentGalleryPage()
        .frame(width: 900, height: 700)
}
