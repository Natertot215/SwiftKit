import SwiftUI

struct ProgressiveImmersionAspectRatioGalleryPage: View {
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

extension ProgressiveImmersionAspectRatioGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.progressiveImmersionAspectRatio",
        title: "ProgressiveImmersionAspectRatio",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "ProgressiveImmersionAspectRatio",
            "swiftui.immersive-spaces.progressiveimmersionaspectratio"
        ],
        blurb: "The aspect ratio used by progressive immersion styles. Choose automatic, landscape, or portrait.",
        signature: "struct ProgressiveImmersionAspectRatio",
        availability: "macOS 26.0+, visionOS 26.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/progressiveimmersionaspectratio.md",
        page: { AnyView(ProgressiveImmersionAspectRatioGalleryPage()) }
    )
}

#Preview {
    ProgressiveImmersionAspectRatioGalleryPage()
        .frame(width: 900, height: 700)
}
