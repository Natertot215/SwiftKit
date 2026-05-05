import SwiftUI

// SwiftUI `ScrollTargetBehaviorPropertiesContext` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolltargetbehaviorpropertiescontext.md
// macOS 15.4+. Read-only context passed to ScrollTargetBehavior.properties(context:).

struct ScrollTargetBehaviorPropertiesContextDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollTargetBehaviorPropertiesContext",
            docPath: "Documentation/SwiftUI/scroll-views/scrolltargetbehaviorpropertiescontext.md",
            availability: "macOS 15.4+",
            blurb: """
            The context in which a scroll target behavior can decide its properties. \
            SwiftUI hands a value of this type to ScrollTargetBehavior.properties(context:); \
            read it to tailor the returned ScrollTargetBehaviorProperties.

            The context exposes:
            \u{2022} axes \u{2014} the Axis.Set the scroll view scrolls in.
            \u{2022} environment \u{2014} the EnvironmentValues active for the scroll view.

            Returning different ScrollTargetBehaviorProperties from properties(context:) is \
            how a behavior says 'limit scrolls in compact horizontal size class' or 'don't \
            limit on vertical scrolls' \u{2014} all without your view code knowing.

            See ScrollTargetBehaviorProperties for the value you build using this context.
            """,
            signatures: [
                "struct ScrollTargetBehaviorPropertiesContext",
                "var axes: Axis.Set",
                "var environment: EnvironmentValues"
            ],
            notes: [
                "Read-only \u{2014} the only thing your behavior writes is the ScrollTargetBehaviorProperties return value.",
                "environment lets you branch on horizontalSizeClass, layoutDirection, dynamicTypeSize, etc.",
                "axes is the scrolling axis set; useful when limiting only horizontal swipes.",
                "macOS 15.4+. The properties(context:) callsite is a default-implemented method on ScrollTargetBehavior.",
                "Pairs with ScrollTargetBehaviorContext (used in updateTarget) for the full customization surface."
            ]
        )
    }
}

#Preview {
    ScrollTargetBehaviorPropertiesContextDescribePage().frame(width: 900, height: 700)
}
