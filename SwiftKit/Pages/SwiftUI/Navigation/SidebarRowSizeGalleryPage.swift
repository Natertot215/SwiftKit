import SwiftUI

struct SidebarRowSizeGalleryPage: View {
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

extension SidebarRowSizeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.sidebarRowSize",
        title: "SidebarRowSize",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "SidebarRowSize",
            "EnvironmentValues/sidebarRowSize"
        ],
        blurb: "The standard sizes of sidebar rows on macOS — small, medium, and large. Read from the environment to adapt sidebar row layouts to the user's Sidebar Icon Size preference.",
        signature: "enum SidebarRowSize",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/sidebarrowsize.md",
        page: { AnyView(SidebarRowSizeGalleryPage()) }
    )
}

#Preview {
    SidebarRowSizeGalleryPage()
        .frame(width: 900, height: 700)
}
