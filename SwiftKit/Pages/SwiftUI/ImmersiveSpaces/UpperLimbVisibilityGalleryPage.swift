import SwiftUI

struct UpperLimbVisibilityGalleryPage: View {
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

extension UpperLimbVisibilityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.upperLimbVisibility",
        title: "UpperLimbVisibility",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/upperLimbVisibility(_:)",
            "Scene/upperLimbVisibility(_:)",
            "swiftui.immersive-spaces.upperlimbvisibility(_:)",
            "swiftui.immersive-spaces.upperlimbvisibility(_:).modifier"
        ],
        blurb: "Sets the preferred visibility of the user's upper limbs while an ImmersiveSpace scene is presented. Useful when displaying virtual hands instead of real arms.",
        signature: "nonisolated func upperLimbVisibility(_ preferredVisibility: Visibility) -> some View",
        availability: "visionOS 1.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/upperlimbvisibility(_:).md",
        page: { AnyView(UpperLimbVisibilityGalleryPage()) }
    )
}

#Preview {
    UpperLimbVisibilityGalleryPage()
        .frame(width: 900, height: 700)
}
