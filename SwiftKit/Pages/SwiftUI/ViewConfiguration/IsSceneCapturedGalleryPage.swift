import SwiftUI

struct IsSceneCapturedGalleryPage: View {
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

extension IsSceneCapturedGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.isSceneCaptured",
        title: "IsSceneCaptured",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["EnvironmentValues/isSceneCaptured"],
        blurb: "True when the current scene is being mirrored, recorded, or AirPlayed elsewhere. Read it from the environment to obscure sensitive content while a capture is active.",
        signature: "var isSceneCaptured: Bool { get set }",
        availability: "iOS 17.0+, visionOS 1.0+ (no macOS support)",
        docPath: "Documentation/SwiftUI/view-configuration/isscenecaptured.md",
        page: { AnyView(IsSceneCapturedGalleryPage()) }
    )
}

#Preview {
    IsSceneCapturedGalleryPage()
        .frame(width: 900, height: 700)
}
