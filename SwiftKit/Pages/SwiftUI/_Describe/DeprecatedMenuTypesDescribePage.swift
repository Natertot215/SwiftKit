import SwiftUI

struct DeprecatedMenuTypesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Deprecated Menu Types",
            docPath: "Documentation/SwiftUI/menus-and-commands/",
            availability: "macOS 10.15+ (deprecated)",
            blurb: """
            ContextMenu (the struct initializer form), MenuButton, and PullDownButton were deprecated in favor of modern equivalents. The old contextMenu(menuItems:) / ContextMenu pattern has been replaced by View.contextMenu(menuItems:) and View.contextMenu(forSelectionType:menu:primaryAction:). MenuButton has been fully replaced by Menu — the modern API supports labels, roles, primary actions, and nested menus. PullDownButton is a typealias that has long been routed through MenuButton; new code should use Menu with .menuStyle(.button) for the same pull-down-button appearance. All three remain in the SDK for source compatibility with older codebases but should not appear in new macOS 26 projects. SwiftKit documents them here for historical reference.
            """,
            signatures: [
                "ContextMenu(menuItems: { Button(\"Copy\") { } })",
                "MenuButton(\"Action\") { Button … }",
                "PullDownButton(\"Action\") { Button … }  // typealias, deprecated"
            ],
            notes: [
                "Replace MenuButton(\"Title\") { … } with Menu(\"Title\") { … }.",
                "Replace ContextMenu { … } usage with .contextMenu { … } directly on the target view.",
                "Replace PullDownButton(\"Title\") { … } with Menu(\"Title\") { … }.menuStyle(.button) — the .button style produces the pull-down-button appearance without the deprecated typealias.",
                "PullDownButton resolves to a SwiftUI._PullDownButton<Label, Content> internally; the typealias has been deprecated since macOS 10.15."
            ]
        )
    }
}

#Preview {
    DeprecatedMenuTypesDescribePage()
        .frame(width: 900, height: 700)
}
