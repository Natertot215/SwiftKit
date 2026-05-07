import SwiftUI

struct SceneGalleryPage: View {
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

extension SceneGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.scene",
        title: "Scene",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: ["Scene", "swiftui.scenes.scene"],
        blurb: "A part of an app's user interface with a life cycle managed by the system. Scenes are the top-level containers that an App's body composes — WindowGroup, Window, Settings, MenuBarExtra, and DocumentGroup all conform to Scene.",
        signature: "@MainActor @preconcurrency protocol Scene",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/scenes/scene.md",
        page: { AnyView(SceneGalleryPage()) }
    )
}

#Preview {
    SceneGalleryPage()
        .frame(width: 900, height: 700)
}
