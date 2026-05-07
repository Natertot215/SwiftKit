import SwiftUI

struct ImmersiveSpaceContentBuilderGalleryPage: View {
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

extension ImmersiveSpaceContentBuilderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.immersiveSpaceContentBuilder",
        title: "ImmersiveSpaceContentBuilder",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "ImmersiveSpaceContentBuilder",
            "swiftui.immersive-spaces.immersivespacecontentbuilder"
        ],
        blurb: "A result builder for composing a collection of immersive space elements. SwiftUI uses it to assemble the content closure passed to ImmersiveSpace.",
        signature: "@resultBuilder struct ImmersiveSpaceContentBuilder",
        availability: "macOS 26.0+, visionOS 1.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/immersivespacecontentbuilder.md",
        page: { AnyView(ImmersiveSpaceContentBuilderGalleryPage()) }
    )
}

#Preview {
    ImmersiveSpaceContentBuilderGalleryPage()
        .frame(width: 900, height: 700)
}
