import SwiftUI

// AppKit Views and Controls / Related types describe page.
// Covers: NSDirectionalEdgeInsets — a struct holding top / leading / bottom /
// trailing insets that respect right-to-left layout direction.
// Source: Documentation/AppKit/views-and-controls/nsdirectionaledgeinsets.md
//
// Why describe rather than render: This is a value type (a struct of four
// CGFloats). It has no visual representation; it's consumed by other AppKit
// APIs that apply the insets.

struct NSDirectionalEdgeInsetsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSDirectionalEdgeInsets",
            docPath: "Documentation/AppKit/views-and-controls/nsdirectionaledgeinsets.md",
            availability: "macOS 10.15+",
            blurb: """
            The inset distances for views, taking the user interface layout \
            direction into account. Unlike NSEdgeInsets (which uses left / \
            right / top / bottom), this struct uses leading / trailing — \
            so the same value flips correctly under right-to-left locales.

            Members:

              \u{2022} top, bottom — vertical insets, layout-direction \
            independent.
              \u{2022} leading, trailing — horizontal insets, mirrored under \
            RTL.

            Used wherever AppKit (especially the modern collection-view \
            layout API) wants directional padding: \
            NSCollectionLayoutItem.contentInsets, \
            NSCollectionLayoutSection.contentInsets, \
            NSCollectionLayoutGroup.contentInsets, edge insets on supplementary \
            and decoration items, and so on.
            """,
            signatures: [
                "struct NSDirectionalEdgeInsets",
                "init()",
                "init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)",
                "var top: CGFloat",
                "var leading: CGFloat",
                "var bottom: CGFloat",
                "var trailing: CGFloat",
                "static let NSDirectionalEdgeInsetsZero: NSDirectionalEdgeInsets",
                "static func string(for insets: NSDirectionalEdgeInsets) -> String",
                "static func nsDirectionalEdgeInsets(for string: String) -> NSDirectionalEdgeInsets",
                "// Conforms to: BitwiseCopyable, Sendable"
            ],
            notes: [
                "Prefer this over NSEdgeInsets in any layout that should adapt to RTL — leading/trailing flip, left/right do not.",
                "string(for:) and nsDirectionalEdgeInsets(for:) round-trip insets to/from a serialized string — useful for storyboard / nib encoding parity.",
                "Pairs with NSRectAlignment and NSDirectionalRectEdge — AppKit's directional-layout trio.",
                "There's nothing to render for a value type on its own. See the collection-view layout pages (NSCollectionLayoutItem, NSCollectionLayoutSection, NSCollectionLayoutGroup) for live consumers."
            ]
        )
    }
}

#Preview {
    NSDirectionalEdgeInsetsDescribePage()
        .frame(width: 900, height: 700)
}
