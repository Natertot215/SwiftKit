import SwiftUI

// SwiftUI `ScrollAnchorRole` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollanchorrole.md
// macOS 15.0+. The role enum used to scope a default scroll anchor.

struct ScrollAnchorRoleDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollAnchorRole",
            docPath: "Documentation/SwiftUI/scroll-views/scrollanchorrole.md",
            availability: "macOS 15.0+",
            blurb: """
            A type defining the role of a scroll anchor. You use ScrollAnchorRole to \
            tell defaultScrollAnchor(_:for:) which behavior the supplied UnitPoint \
            should govern.

            Three roles are defined as static properties:
            \u{2022} initialOffset \u{2014} where the scroll view should initially be scrolled.
            \u{2022} sizeChanges \u{2014} how the scroll view repositions when content size changes.
            \u{2022} alignment \u{2014} how content smaller than the container is parked inside it.

            By default the unscoped defaultScrollAnchor(_:) modifier governs all three. \
            Layer defaultScrollAnchor(_:for:) on top to override one role at a time.

            See View/defaultScrollAnchor(_:for:) for working examples.
            """,
            signatures: [
                "struct ScrollAnchorRole",
                "static var initialOffset: ScrollAnchorRole",
                "static var sizeChanges: ScrollAnchorRole",
                "static var alignment: ScrollAnchorRole"
            ],
            notes: [
                "Conforms to Equatable and Hashable.",
                "Used only as the for: argument to defaultScrollAnchor(_:for:).",
                "Stack the unscoped defaultScrollAnchor first, then role-scoped overrides on top.",
                "Pre-15: there's no role split \u{2014} use defaultScrollAnchor(_:) which covers all three.",
                "ScrollPosition behaves orthogonally and isn't affected by ScrollAnchorRole."
            ]
        )
    }
}

#Preview {
    ScrollAnchorRoleDescribePage().frame(width: 900, height: 700)
}
