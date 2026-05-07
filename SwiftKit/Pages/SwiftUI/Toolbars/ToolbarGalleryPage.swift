import SwiftUI

struct ToolbarGalleryPage: View {
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

extension ToolbarGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.toolbars.toolbar",
        title: "Toolbar",
        folder: "Toolbars",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/toolbar(content:)",
            "View/toolbar(_:for:)",
            "View/toolbar(removing:)",
            "View/toolbarVisibility(_:for:)",
            "View/toolbarBackground(_:for:)",
            "View/toolbarBackgroundVisibility(_:for:)",
            "View/toolbarForegroundStyle(_:for:)",
            "View/toolbarTitleDisplayMode(_:)",
            "ToolbarItem",
            "ToolbarItemGroup",
            "ToolbarItemPlacement",
            "ToolbarContent",
            "ToolbarContentBuilder",
            "ToolbarSpacer",
            "DefaultToolbarItem",
            "ToolbarPlacement",
            "ContentToolbarPlacement",
            "ToolbarTitleDisplayMode",
            "ToolbarDefaultItemKind",
            "EnvironmentValues/toolbarLabelStyle",
            "ToolbarLabelStyle",
            "SpacerSizing",
            "SearchToolbarBehavior"
        ],
        blurb: "Populates a window or scene's toolbar with items, groups, spacers, and placements. Companion modifiers configure visibility, background, foreground style, title display mode, and label style across toolbar regions.",
        signature: "func toolbar<Content>(@ToolbarContentBuilder content: () -> Content) -> some View where Content : ToolbarContent",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/toolbars/toolbar(content:).md",
        page: { AnyView(ToolbarGalleryPage()) }
    )
}

#Preview {
    ToolbarGalleryPage()
        .frame(width: 900, height: 700)
}
