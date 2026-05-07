import SwiftUI

struct SceneRestorationBehaviorGalleryPage: View {
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

extension SceneRestorationBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.sceneRestorationBehavior",
        title: "SceneRestorationBehavior",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "SceneRestorationBehavior",
            "Scene/restorationBehavior(_:)"
        ],
        blurb: "The restoration behavior for a scene — determines how the system restores windows from a previous run of the application.",
        signature: "struct SceneRestorationBehavior",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/scenerestorationbehavior.md",
        page: { AnyView(SceneRestorationBehaviorGalleryPage()) }
    )
}

#Preview {
    SceneRestorationBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
