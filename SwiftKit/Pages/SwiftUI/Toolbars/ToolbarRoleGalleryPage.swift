import SwiftUI

struct ToolbarRoleGalleryPage: View {
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

extension ToolbarRoleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.toolbars.toolbarRole",
        title: "ToolbarRole",
        folder: "Toolbars",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/toolbarRole(_:)",
            "ToolbarRole"
        ],
        blurb: "Describes the purpose of toolbar content so the system can adjust rendering — for example, leading-aligning a title in a browser-style toolbar.",
        signature: "func toolbarRole(_ role: ToolbarRole) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/toolbars/toolbarrole(_:).md",
        page: { AnyView(ToolbarRoleGalleryPage()) }
    )
}

#Preview {
    ToolbarRoleGalleryPage()
        .frame(width: 900, height: 700)
}
