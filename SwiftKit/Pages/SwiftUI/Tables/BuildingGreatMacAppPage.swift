import SwiftUI

// "Building a great Mac app with SwiftUI" article page.
// Source: Documentation/SwiftUI/tables/building-a-great-mac-app-with-swiftui.md

struct BuildingGreatMacAppPage: View {
    var body: some View {
        DescribePage(
            title: "Building a Great Mac App with SwiftUI",
            docPath: "Documentation/SwiftUI/tables/building-a-great-mac-app-with-swiftui.md",
            availability: "macOS 12.0+",
            blurb: """
            "Building a great Mac app with SwiftUI" is Apple's comprehensive guide and WWDC \
            sample (session 10062) that showcases production-quality macOS app patterns.

            Key topics covered:
            • Table with multi-column sorting, multiple selection, and column customization.
            • DisclosureTableRow for hierarchical/outline table rows.
            • NavigationSplitView with a three-column layout (sidebar, content, detail).
            • Toolbar customization and contextual actions.
            • Keyboard shortcuts and menu commands.
            • Focus management and accessibility.
            • NSHostingView integration for AppKit interop.

            The article demonstrates that a great Mac app uses Table (not List) for tabular \
            data, provides full keyboard navigation, and respects the macOS selection model \
            (click, Shift+click, Cmd+click for multi-select).
            """,
            signatures: [
                "Table(items, selection: $selection, sortOrder: $sortOrder, columnCustomization: $customization) { columns }",
                "TableColumn(\"Name\", value: \\.name).customizationID(\"name\")",
                "DisclosureTableRow(root) { childRows }",
                "NavigationSplitView { sidebar } content: { table } detail: { detail }"
            ],
            notes: [
                "The full sample code is available in Apple's developer documentation / WWDC 2021 session 10062.",
                "TableColumnCustomization and DisclosureTableRow are wired in separate gallery pages.",
                "This article is the canonical macOS Table usage reference."
            ]
        )
    }
}

#Preview {
    BuildingGreatMacAppPage().frame(width: 900, height: 600)
}
