import SwiftUI

struct SceneLaunchBehaviorGalleryPage: View {
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

extension SceneLaunchBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.sceneLaunchBehavior",
        title: "SceneLaunchBehavior",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "SceneLaunchBehavior",
            "Scene/defaultLaunchBehavior(_:)"
        ],
        blurb: "The launch behavior for a scene — determines how the system presents the scene at launch when no previously restored scenes exist.",
        signature: "struct SceneLaunchBehavior",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/scenelaunchbehavior.md",
        page: { AnyView(SceneLaunchBehaviorGalleryPage()) }
    )
}

#Preview {
    SceneLaunchBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
