import SwiftUI

struct WindowGroupGalleryPage: View {
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

extension WindowGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowGroup",
        title: "WindowGroup",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "Bringing multiple windows to your SwiftUI app",
            "Scene/defaultLaunchBehavior(_:)",
            "Scene/restorationBehavior(_:)",
            "SceneLaunchBehavior",
            "SceneRestorationBehavior",
            "WindowGroup"
        ],
        blurb: "A scene that presents a group of identically structured windows. WindowGroup also covers scene lifecycle — launch behavior (how the system presents scenes at launch) and restoration behavior (how windows are restored from a previous run).",
        signature: "WindowGroup \u{00b7} Scene/defaultLaunchBehavior(_:) \u{00b7} Scene/restorationBehavior(_:)",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/windows/windowgroup.md",
        page: { AnyView(WindowGroupGalleryPage()) }
    )
}

#Preview {
    WindowGroupGalleryPage()
        .frame(width: 900, height: 700)
}
