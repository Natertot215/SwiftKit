import SwiftUI

struct ScenePhaseGalleryPage: View {
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

extension ScenePhaseGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.scenePhase",
        title: "ScenePhase",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScenePhase",
            "EnvironmentValues/scenePhase",
            "swiftui.scenes.scenephase",
            "swiftui.scenes.scenephase.type"
        ],
        blurb: "An enumeration of the operational state of a scene — active, inactive, or background. Read it from the environment via the scenePhase environment value to react to scene activation changes.",
        signature: "enum ScenePhase",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/scenes/scenephase.md",
        page: { AnyView(ScenePhaseGalleryPage()) }
    )
}

#Preview {
    ScenePhaseGalleryPage()
        .frame(width: 900, height: 700)
}
