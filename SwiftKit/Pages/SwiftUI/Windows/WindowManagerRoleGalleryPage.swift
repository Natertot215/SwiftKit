import SwiftUI

struct WindowManagerRoleGalleryPage: View {
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

extension WindowManagerRoleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowManagerRole",
        title: "WindowManagerRole",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowManagerRole",
            "Scene/windowManagerRole(_:)"
        ],
        blurb: "Options for defining how a scene's windows behave when used within a managed window context, such as full-screen mode and Stage Manager.",
        signature: "struct WindowManagerRole",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowmanagerrole.md",
        page: { AnyView(WindowManagerRoleGalleryPage()) }
    )
}

#Preview {
    WindowManagerRoleGalleryPage()
        .frame(width: 900, height: 700)
}
