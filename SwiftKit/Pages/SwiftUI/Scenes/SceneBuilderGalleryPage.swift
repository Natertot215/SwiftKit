import SwiftUI

struct SceneBuilderGalleryPage: View {
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

extension SceneBuilderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.sceneBuilder",
        title: "SceneBuilder",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: ["SceneBuilder", "swiftui.scenes.scenebuilder"],
        blurb: "A result builder for composing a collection of scenes into a single composite scene. Used implicitly inside an App's body to combine multiple top-level scenes such as a WindowGroup plus a Settings scene.",
        signature: "@resultBuilder struct SceneBuilder",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/scenes/scenebuilder.md",
        page: { AnyView(SceneBuilderGalleryPage()) }
    )
}

#Preview {
    SceneBuilderGalleryPage()
        .frame(width: 900, height: 700)
}
