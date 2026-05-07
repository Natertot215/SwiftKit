import SwiftUI

struct ImmersiveSpaceDisplacementGalleryPage: View {
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

extension ImmersiveSpaceDisplacementGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.immersiveSpaceDisplacement",
        title: "ImmersiveSpaceDisplacement",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "EnvironmentValues/immersiveSpaceDisplacement",
            "swiftui.immersive-spaces.immersivespacedisplacement"
        ],
        blurb: "The displacement that the system applies to the immersive space when moving the space away from its default position, in meters. Useful when reconciling shared-activity participant locations.",
        signature: "var immersiveSpaceDisplacement: Pose3D { get }",
        availability: "visionOS 1.1+",
        docPath: "Documentation/SwiftUI/immersive-spaces/immersivespacedisplacement.md",
        page: { AnyView(ImmersiveSpaceDisplacementGalleryPage()) }
    )
}

#Preview {
    ImmersiveSpaceDisplacementGalleryPage()
        .frame(width: 900, height: 700)
}
