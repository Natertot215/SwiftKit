import SwiftUI

struct WindowGalleryPage: View {
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

extension WindowGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.window",
        title: "Window",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "Window"
        ],
        blurb: "A scene that presents its content in a single, unique window. Use a Window scene to augment the main interface with secondary windows that give people access to supplemental functionality.",
        signature: "struct Window<Content> where Content : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/windows/window.md",
        page: { AnyView(WindowGalleryPage()) }
    )
}

#Preview {
    WindowGalleryPage()
        .frame(width: 900, height: 700)
}
