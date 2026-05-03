import SwiftUI

@MainActor
enum PageRegistry {
    static func view(for leaf: Leaf) -> AnyView {
        switch leaf.pageBuilder {
        case .placeholder:
            return AnyView(PlaceholderPage(leaf: leaf))
        case .real(let symbol):
            if let builder = realPages[symbol] {
                return builder(leaf)
            }
            return AnyView(PlaceholderPage(leaf: leaf))
        }
    }

    private static let realPages: [String: (Leaf) -> AnyView] = [
        "Typography":          { _ in AnyView(TypographyPage()) },
        "List":                { _ in AnyView(ListPage()) },
        "OutlineGroup":        { _ in AnyView(OutlineGroupPage()) },
        "DisclosureGroup":     { _ in AnyView(DisclosureGroupPage()) },
        "ForEach":             { _ in AnyView(ForEachPage()) },
        "Table":               { _ in AnyView(TablePage()) },
        "TableColumn":         { _ in AnyView(TableColumnPage()) },
        "NavigationSplitView": { _ in AnyView(NavigationSplitViewPage()) },
        "NavigationStack":     { _ in AnyView(NavigationStackPage()) },
        "NavigationLink":      { _ in AnyView(NavigationLinkPage()) }
    ]
}
