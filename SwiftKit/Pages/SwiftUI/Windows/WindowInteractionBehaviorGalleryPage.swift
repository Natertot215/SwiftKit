import SwiftUI

struct WindowInteractionBehaviorGalleryPage: View {
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

extension WindowInteractionBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowInteractionBehavior",
        title: "WindowInteractionBehavior",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowInteractionBehavior",
            "View/windowMinimizeBehavior(_:)",
            "View/windowFullScreenBehavior(_:)",
            "View/windowResizeBehavior(_:)",
            "Scene/windowBackgroundDragBehavior(_:)"
        ],
        blurb: "Options for enabling and disabling per-window interaction behaviors — minimize, full-screen, resize, and background drag.",
        signature: "struct WindowInteractionBehavior",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowinteractionbehavior.md",
        page: { AnyView(WindowInteractionBehaviorGalleryPage()) }
    )
}

#Preview {
    WindowInteractionBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
