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
            "ContentToolbarPlacement",
            "CustomizableToolbarContent",
            "DefaultToolbarItem",
            "EnvironmentValues/toolbarLabelStyle",
            "OrnamentAttachmentAnchor",
            "SearchToolbarBehavior",
            "SpacerSizing",
            "ToolbarContent",
            "ToolbarContentBuilder",
            "ToolbarCustomizationBehavior",
            "ToolbarCustomizationOptions",
            "ToolbarDefaultItemKind",
            "ToolbarItem",
            "ToolbarItemGroup",
            "ToolbarItemPlacement",
            "ToolbarLabelStyle",
            "ToolbarPlacement",
            "ToolbarRole",
            "ToolbarSpacer",
            "ToolbarTitleDisplayMode",
            "View/ornament(visibility:attachmentAnchor:contentAlignment:ornament:)",
            "View/toolbar(_:for:)",
            "View/toolbar(content:)",
            "View/toolbar(id:content:)",
            "View/toolbar(removing:)",
            "View/toolbarBackground(_:for:)",
            "View/toolbarBackgroundVisibility(_:for:)",
            "View/toolbarForegroundStyle(_:for:)",
            "View/toolbarRole(_:)",
            "View/toolbarTitleDisplayMode(_:)",
            "View/toolbarVisibility(_:for:)"
        ],
        blurb: "Populates a window or scene's toolbar with items, groups, spacers, and placements, and exposes the customization, role, and visibility/style modifiers that tune toolbar behavior. Also covers Ornament — the visionOS analogue for scene-anchored auxiliary content — included here for API completeness.",
        signature: "toolbar(content:) \u{00b7} ToolbarItem \u{00b7} ToolbarItemGroup \u{00b7} ToolbarSpacer \u{00b7} toolbar(id:content:) \u{00b7} CustomizableToolbarContent \u{00b7} toolbarRole(_:) \u{00b7} ornament(visibility:attachmentAnchor:contentAlignment:ornament:)",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/toolbars/toolbar(content:).md",
        page: { AnyView(ToolbarGalleryPage()) }
    )
}

#Preview {
    ToolbarGalleryPage()
        .frame(width: 900, height: 700)
}
