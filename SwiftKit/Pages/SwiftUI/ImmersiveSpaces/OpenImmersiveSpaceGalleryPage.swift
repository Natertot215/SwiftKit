import SwiftUI

struct OpenImmersiveSpaceGalleryPage: View {
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

extension OpenImmersiveSpaceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.openImmersiveSpace",
        title: "OpenImmersiveSpace",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "EnvironmentValues/openImmersiveSpace",
            "OpenImmersiveSpaceAction",
            "swiftui.immersive-spaces.openimmersivespace",
            "swiftui.immersive-spaces.openimmersivespaceaction"
        ],
        blurb: "An action that presents an immersive space. Read it from the environment and call it asynchronously to open a space by id, value, or both.",
        signature: "var openImmersiveSpace: OpenImmersiveSpaceAction { get }",
        availability: "macOS 26.0+, visionOS 1.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/openimmersivespace.md",
        page: { AnyView(OpenImmersiveSpaceGalleryPage()) }
    )
}

#Preview {
    OpenImmersiveSpaceGalleryPage()
        .frame(width: 900, height: 700)
}
