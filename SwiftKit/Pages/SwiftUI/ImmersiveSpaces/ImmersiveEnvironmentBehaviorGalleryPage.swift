import SwiftUI

struct ImmersiveEnvironmentBehaviorGalleryPage: View {
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

extension ImmersiveEnvironmentBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.immersiveEnvironmentBehavior",
        title: "ImmersiveEnvironmentBehavior",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "ImmersiveEnvironmentBehavior",
            "swiftui.immersive-spaces.immersiveenvironmentbehavior"
        ],
        blurb: "The behavior of the system-provided immersive environments when a scene is opened by your app. Choose automatic, coexist, or replace.",
        signature: "struct ImmersiveEnvironmentBehavior",
        availability: "visionOS 26.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/immersiveenvironmentbehavior.md",
        page: { AnyView(ImmersiveEnvironmentBehaviorGalleryPage()) }
    )
}

#Preview {
    ImmersiveEnvironmentBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
