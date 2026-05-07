import SwiftUI

struct WindowToolbarStyleGalleryPage: View {
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

extension WindowToolbarStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowToolbarStyle",
        title: "WindowToolbarStyle",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowToolbarStyle",
            "Scene/windowToolbarStyle(_:)",
            "Scene/windowToolbarLabelStyle(_:)",
            "Scene/windowToolbarLabelStyle(fixed:)",
            "WindowToolbarFullScreenVisibility",
            "View/windowToolbarFullScreenVisibility(_:)"
        ],
        blurb: "A specification for the appearance and behavior of a window's toolbar. Companion modifiers configure label style and full-screen visibility behavior.",
        signature: "protocol WindowToolbarStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/windows/windowtoolbarstyle.md",
        page: { AnyView(WindowToolbarStyleGalleryPage()) }
    )
}

#Preview {
    WindowToolbarStyleGalleryPage()
        .frame(width: 900, height: 700)
}
