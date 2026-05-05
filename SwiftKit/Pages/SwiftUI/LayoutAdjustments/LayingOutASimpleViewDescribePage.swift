import SwiftUI

// SwiftUI "Laying out a simple view" article describe page.
// Source: Documentation/SwiftUI/layout-adjustments/laying-out-a-simple-view.md
// Article — no platform availability stamp.

struct LayingOutASimpleViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Laying out a simple view",
            docPath: "Documentation/SwiftUI/layout-adjustments/laying-out-a-simple-view.md",
            availability: "Article \u{2014} guide",
            blurb: """
            The canonical SwiftUI layout walkthrough. Compose a hierarchy first, then refine \
            sizing with frame and padding. SwiftUI's layout pass is bottom-up: a parent proposes \
            a size to each child, and each child reports back the size it actually used. The \
            parent then places its children inside its own bounds.

            Three sizing classes of built-in views: views that expand to fill the proposed size \
            (Color, LinearGradient, Circle, Rectangle), views with a content-driven ideal size \
            (Text, container views), and views with a fixed ideal size (Toggle, DatePicker).

            Adding View/frame(width:height:alignment:) wraps the affected view in a sized container \
            \u{2014} the wrapped view receives a smaller proposal. Pair frame with HStack/VStack \
            alignment to anchor sibling tops/bottoms cleanly. Add View/padding(_:_:) to inset the \
            outer edges and avoid visually crowding the bounds.
            """,
            signatures: [
                "HStack(alignment: .top) { ZStack { Circle().fill(.yellow); Text(initials) }.frame(width: 40, height: 40); Text(message) }",
                ".frame(width: 40, height: 40)  // wraps the ZStack in a fixed container",
                ".padding([.horizontal])  // system-default horizontal padding"
            ],
            notes: [
                "Layout is recursive: each child's reported size feeds into its parent's placement.",
                "frame(width:) without height lets the wrapped view's height stay flexible.",
                "Alignment values on HStack/VStack only matter once siblings have different sizes.",
                "Use temporary borders (.border(.gray)) while authoring to make the layout visible."
            ]
        )
    }
}

#Preview {
    LayingOutASimpleViewDescribePage().frame(width: 900, height: 700)
}
