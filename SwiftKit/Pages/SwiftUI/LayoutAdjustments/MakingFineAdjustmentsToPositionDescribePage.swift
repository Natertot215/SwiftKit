import SwiftUI

// SwiftUI "Making fine adjustments to a view's position" article describe page.
// Source: Documentation/SwiftUI/layout-adjustments/making-fine-adjustments-to-a-view-s-position.md
// Article — no platform availability stamp.

struct MakingFineAdjustmentsToPositionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Making fine adjustments to a view's position",
            docPath: "Documentation/SwiftUI/layout-adjustments/making-fine-adjustments-to-a-view-s-position.md",
            availability: "Article \u{2014} guide",
            blurb: """
            Compose first, fine-tune second. When composition alone can't reach the layout you \
            want, shift individual views with offset or position.

            View/offset(x:y:) shifts the rendered content from where the parent placed it. The \
            view's layout slot stays where it was; only the rendering moves. Siblings keep their \
            original positions.

            View/position(x:y:) replaces the parent's placement entirely \u{2014} the view's center \
            is fixed at an absolute (x, y) in the parent's coordinate space.

            SwiftUI's coordinate system: x increases from leading to trailing, y increases from \
            top to bottom. Leading is right when LayoutDirection is .rightToLeft, so don't \
            assume "left."

            See also: View/offset(_:) (CGSize variant), View/position(_:) (CGPoint variant), \
            View/offset(z:) for visionOS depth offset.
            """,
            signatures: [
                ".offset(x: 40, y: -40)  // shift rendering only",
                ".position(x: 144, y: 80)  // pin center inside the parent",
                ".offset(CGSize(width: 12, height: -8))  // CGSize convenience"
            ],
            notes: [
                "offset doesn't affect layout \u{2014} adjacent siblings won't reflow.",
                "position takes the FULL responsibility for placing the view; the parent's stack/grid no longer drives placement.",
                "Combining offset with .animation produces the standard slide-in / slide-out motion.",
                "Coordinate origin is the top-leading corner of the parent's coordinate space."
            ]
        )
    }
}

#Preview {
    MakingFineAdjustmentsToPositionDescribePage().frame(width: 900, height: 700)
}
