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
        "Typography": { _ in AnyView(TypographyPage()) },
        "List":       { _ in AnyView(ListPage()) }
    ]
}
