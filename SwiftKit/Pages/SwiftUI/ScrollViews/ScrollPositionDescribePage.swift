import SwiftUI

// SwiftUI `ScrollPosition` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollposition.md
// macOS 15.0+. Value type used as a Binding to control / observe a scroll view's position.

struct ScrollPositionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollPosition",
            docPath: "Documentation/SwiftUI/scroll-views/scrollposition.md",
            availability: "macOS 15.0+",
            blurb: """
            A type that defines the semantic position of where a scroll view is \
            scrolled within its content. You bind one to a scroll view via the \
            scrollPosition(_:anchor:) modifier and SwiftUI keeps both directions \
            in sync \u{2014} writing scrolls; user gestures update the value.

            ScrollPosition can address scroll position three ways:
            \u{2022} by view identity \u{2014} init(idType:), with viewID(type:) and scrollTo(id:anchor:).
            \u{2022} by concrete offset \u{2014} init(idType:x:y:), with x/y/point and scrollTo(point:).
            \u{2022} by edge \u{2014} init(idType:edge:), with edge and scrollTo(edge:).

            isPositionedByUser is true while the user is actively driving the scroll.

            For a working demo, see View/scrollPosition(_:anchor:).
            """,
            signatures: [
                "struct ScrollPosition",
                "init<ID>(idType: ID.Type) where ID : Hashable",
                "init<ID>(idType: ID.Type, edge: Edge)",
                "init<ID>(idType: ID.Type, x: CGFloat, y: CGFloat)",
                "var viewID: AnyHashable?",
                "var x: CGFloat?",
                "var y: CGFloat?",
                "var edge: Edge?",
                "var isPositionedByUser: Bool",
                "func viewID<T>(type: T.Type) -> T?",
                "mutating func scrollTo(id: some Hashable, anchor: UnitPoint? = nil)",
                "mutating func scrollTo(edge: Edge)",
                "mutating func scrollTo(point: CGPoint)",
                "mutating func scrollTo(x: CGFloat, y: CGFloat)"
            ],
            notes: [
                "Conforms to Equatable and Sendable. Pass via @State and bind into scrollPosition(_:anchor:).",
                "Pair with .scrollTargetLayout() on the LazyVStack/LazyHStack inside ScrollView.",
                "viewID(type:) returns the typed id directly when you know the id type.",
                "isPositionedByUser \u{2014} guard automatic scrolls so they don't fight an active drag.",
                "macOS 15+. For pre-15 use scrollPosition(id:anchor:) with a Hashable id binding."
            ]
        )
    }
}

#Preview {
    ScrollPositionDescribePage().frame(width: 900, height: 700)
}
