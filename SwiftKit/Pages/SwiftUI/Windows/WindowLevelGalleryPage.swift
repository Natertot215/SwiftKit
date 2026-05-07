import SwiftUI

struct WindowLevelGalleryPage: View {
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

extension WindowLevelGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowLevel",
        title: "WindowLevel",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowLevel",
            "Scene/windowLevel(_:)"
        ],
        blurb: "The level of a window — its ordering relative to other windows. Use with the windowLevel(_:) scene modifier to make a window float above or below normal windows.",
        signature: "struct WindowLevel",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowlevel.md",
        page: { AnyView(WindowLevelGalleryPage()) }
    )
}

#Preview {
    WindowLevelGalleryPage()
        .frame(width: 900, height: 700)
}
