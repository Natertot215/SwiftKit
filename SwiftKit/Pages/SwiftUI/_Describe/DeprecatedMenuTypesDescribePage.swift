import SwiftUI

struct DeprecatedMenuTypesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Deprecated Menu Types",
            docPath: "Documentation/SwiftUI/menus-and-commands/",
            availability: "macOS 10.15+ (deprecated)",
            blurb: """
            ContextMenu (the struct initializer form) and MenuButton were deprecated in favor of modern equivalents. The old contextMenu(menuItems:) / ContextMenu pattern has been replaced by View.contextMenu(menuItems:) and View.contextMenu(forSelectionType:menu:primaryAction:). MenuButton has been fully replaced by Menu — the modern API supports labels, roles, primary actions, and nested menus. Both types remain in the SDK for source compatibility with older codebases but should not appear in new macOS 26 projects. SwiftKit documents them here for historical reference.
            """,
            signatures: [
                "ContextMenu(menuItems: { Button(\"Copy\") { } })",
                "MenuButton(\"Action\") { Button … }"
            ],
            notes: [
                "Replace MenuButton(\"Title\") { … } with Menu(\"Title\") { … }.",
                "Replace ContextMenu { … } usage with .contextMenu { … } directly on the target view."
            ]
        )
    }
}

#Preview {
    DeprecatedMenuTypesDescribePage()
        .frame(width: 900, height: 700)
}
