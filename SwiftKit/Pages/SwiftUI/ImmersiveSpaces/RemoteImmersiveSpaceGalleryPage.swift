import SwiftUI

struct RemoteImmersiveSpaceGalleryPage: View {
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

extension RemoteImmersiveSpaceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.remoteImmersiveSpace",
        title: "RemoteImmersiveSpace",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "RemoteImmersiveSpace",
            "swiftui.immersive-spaces.remoteimmersivespace"
        ],
        blurb: "A scene that presents its content in an unbounded space on a remote device. Use from macOS apps to drive compositor content on a user's chosen visionOS device.",
        signature: "struct RemoteImmersiveSpace<Content, Data> where Content : ImmersiveSpaceContent, Data : Decodable, Data : Encodable, Data : Hashable",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/remoteimmersivespace.md",
        page: { AnyView(RemoteImmersiveSpaceGalleryPage()) }
    )
}

#Preview {
    RemoteImmersiveSpaceGalleryPage()
        .frame(width: 900, height: 700)
}
