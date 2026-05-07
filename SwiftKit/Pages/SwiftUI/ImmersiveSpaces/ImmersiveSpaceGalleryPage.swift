import SwiftUI

struct ImmersiveSpaceGalleryPage: View {
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

extension ImmersiveSpaceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.immersiveSpace",
        title: "ImmersiveSpace",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "ImmersiveSpace",
            "swiftui.immersive-spaces.immersivespace"
        ],
        blurb: "A scene that presents its content in an unbounded space. Use as a container for a view hierarchy that extends beyond a window into the user's surroundings.",
        signature: "struct ImmersiveSpace<Content, Data> where Content : ImmersiveSpaceContent, Data : Decodable, Data : Encodable, Data : Hashable",
        availability: "visionOS 1.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/immersivespace.md",
        page: { AnyView(ImmersiveSpaceGalleryPage()) }
    )
}

#Preview {
    ImmersiveSpaceGalleryPage()
        .frame(width: 900, height: 700)
}
