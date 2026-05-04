import SwiftUI

// Describe-track page for the "Creating Custom Container Views" article.
// Source: Documentation/SwiftUI/view-groupings/creating-custom-container-views.md
// Article — macOS 14.0+ (article); key APIs require macOS 15.0+.

struct CreatingCustomContainerViewsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Creating Custom Container Views",
            docPath: "Documentation/SwiftUI/view-groupings/creating-custom-container-views.md",
            availability: "macOS 14.0+ (article)",
            blurb: """
            This Apple developer documentation article explains how to build custom container views — \
            views that accept a @ViewBuilder content closure and lay out or transform the child views \
            produced by that closure. The key APIs introduced in macOS 15.0 / iOS 18.0 are: \
            Group(subviewsOf:), which lets a container view iterate and recompose its subviews using \
            SubviewsCollection; ForEach(subviews:), a specialized ForEach that iterates subviews of a \
            content closure; and ContainerValues, a mechanism for subviews to pass typed values up to \
            their container (analogous to PreferenceKey but with cleaner syntax). These APIs power custom \
            layouts like HStack, TabView, and List. The full article with code examples is at \
            Documentation/SwiftUI/view-groupings/creating-custom-container-views.md in the local doc \
            mirror. Note: the article's availability listing shows iOS/Mac Catalyst in the macOS 26 SDK; \
            macOS support for these APIs should be confirmed before shipping.
            """,
            signatures: [
                "Group(subviewsOf: content) { subviews in … } — subview introspection (macOS 15+)",
                "ForEach(subviews: content) { subview in … } — iterate subviews (macOS 15+)",
                "ContainerValues — custom values passed from subviews to their container"
            ],
            notes: [
                "Group(subviewsOf:) and ForEach(subviews:) require macOS 15.0+ / iOS 18.0+.",
                "ContainerValues is defined by declaring extensions on ContainerValues with @Entry macros.",
                "This article's macOS availability is ambiguous in the SDK — verify before use."
            ]
        )
    }
}

#Preview {
    CreatingCustomContainerViewsDescribePage()
        .frame(width: 900, height: 700)
}
