import SwiftUI

struct ImmersionStyleGalleryPage: View {
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

extension ImmersionStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.immersionStyle",
        title: "ImmersionStyle",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "ImmersionStyle",
            "Scene/immersionStyle(selection:in:)",
            "ImmersionStyle/mixed",
            "ImmersionStyle/full",
            "ImmersionStyle/progressive",
            "swiftui.immersive-spaces.immersionstyle",
            "swiftui.immersive-spaces.immersionstyle(selection:in:)",
            "swiftui.immersive-spaces.mixed",
            "swiftui.immersive-spaces.full",
            "swiftui.immersive-spaces.progressive"
        ],
        blurb: "The styles that an immersive space can have. Apply with the immersionStyle(selection:in:) scene modifier and switch between mixed, full, and progressive styles.",
        signature: "protocol ImmersionStyle",
        availability: "macOS 26.0+, visionOS 1.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/immersionstyle.md",
        page: { AnyView(ImmersionStyleGalleryPage()) }
    )
}

#Preview {
    ImmersionStyleGalleryPage()
        .frame(width: 900, height: 700)
}
