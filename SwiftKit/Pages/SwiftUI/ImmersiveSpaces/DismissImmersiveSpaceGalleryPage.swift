import SwiftUI

struct DismissImmersiveSpaceGalleryPage: View {
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

extension DismissImmersiveSpaceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.dismissImmersiveSpace",
        title: "DismissImmersiveSpace",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "EnvironmentValues/dismissImmersiveSpace",
            "DismissImmersiveSpaceAction",
            "swiftui.immersive-spaces.dismissimmersivespace",
            "swiftui.immersive-spaces.dismissimmersivespaceaction"
        ],
        blurb: "An immersive space dismissal action stored in a view's environment. Call asynchronously to close the currently open immersive space; no identifier is needed because only one space can be open at a time.",
        signature: "var dismissImmersiveSpace: DismissImmersiveSpaceAction { get }",
        availability: "macOS 26.0+, visionOS 1.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/dismissimmersivespace.md",
        page: { AnyView(DismissImmersiveSpaceGalleryPage()) }
    )
}

#Preview {
    DismissImmersiveSpaceGalleryPage()
        .frame(width: 900, height: 700)
}
