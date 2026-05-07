import SwiftUI

struct DismissWindowGalleryPage: View {
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

extension DismissWindowGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.dismissWindow",
        title: "DismissWindow",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "DismissWindowAction",
            "EnvironmentValues/dismissWindow",
            "EnvironmentValues/dismiss",
            "DismissAction",
            "DismissBehavior",
            "View/windowDismissBehavior(_:)"
        ],
        blurb: "Environment actions and configuration for dismissing windows and presentations. dismiss is the general action; dismissWindow is the window-specific variant; DismissBehavior controls the dismissal strategy.",
        signature: "struct DismissWindowAction",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/windows/dismisswindowaction.md",
        page: { AnyView(DismissWindowGalleryPage()) }
    )
}

#Preview {
    DismissWindowGalleryPage()
        .frame(width: 900, height: 700)
}
