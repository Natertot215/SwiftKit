import SwiftUI

// SwiftUI `ScrollTargetBehaviorProperties` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolltargetbehaviorproperties.md
// macOS 15.4+. Properties a ScrollTargetBehavior can return to influence its scroll view.

struct ScrollTargetBehaviorPropertiesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollTargetBehaviorProperties",
            docPath: "Documentation/SwiftUI/scroll-views/scrolltargetbehaviorproperties.md",
            availability: "macOS 15.4+",
            blurb: """
            Properties influencing the scroll view a scroll target behavior applies to. \
            Return a value of this type from ScrollTargetBehavior.properties(context:) to \
            tell SwiftUI how the scroll view should accommodate your behavior.

            The single instance property is:
            \u{2022} limitsScrolls \u{2014} when true, the scroll view limits gestures so the \
              user can only travel a small number of targets per swipe.

            Pair with ScrollTargetBehaviorPropertiesContext (passed to properties(context:)) \
            to vary the properties based on the scroll view's environment and axes.

            See ScrollTargetBehavior for how this fits into the protocol's customization \
            surface.
            """,
            signatures: [
                "struct ScrollTargetBehaviorProperties",
                "init()",
                "var limitsScrolls: Bool"
            ],
            notes: [
                "Conforms to Equatable and Sendable.",
                "Returned from ScrollTargetBehavior.properties(context:); the default impl returns the empty value.",
                "limitsScrolls true \u{2014} only a few targets per gesture; mirrors ViewAlignedScrollTargetBehavior.LimitBehavior.always.",
                "macOS 15.4+. On earlier macOS 14/15, behaviors influence scrolling only via updateTarget(_:context:).",
                "Reads context from ScrollTargetBehaviorPropertiesContext (axes + environment)."
            ]
        )
    }
}

#Preview {
    ScrollTargetBehaviorPropertiesDescribePage().frame(width: 900, height: 700)
}
