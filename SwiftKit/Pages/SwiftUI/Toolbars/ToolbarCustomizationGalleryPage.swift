import SwiftUI

struct ToolbarCustomizationGalleryPage: View {
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

extension ToolbarCustomizationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.toolbars.toolbarCustomization",
        title: "ToolbarCustomization",
        folder: "Toolbars",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/toolbar(id:content:)",
            "CustomizableToolbarContent",
            "ToolbarCustomizationBehavior",
            "ToolbarCustomizationOptions"
        ],
        blurb: "Identifies a toolbar's customizable content so the system persists user reordering and removal. The CustomizableToolbarContent protocol, customization behavior, and options describe per-item customization rules.",
        signature: "func toolbar<Content>(id: String, @ToolbarContentBuilder content: () -> Content) -> some View where Content : CustomizableToolbarContent",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/toolbars/toolbar(id:content:).md",
        page: { AnyView(ToolbarCustomizationGalleryPage()) }
    )
}

#Preview {
    ToolbarCustomizationGalleryPage()
        .frame(width: 900, height: 700)
}
