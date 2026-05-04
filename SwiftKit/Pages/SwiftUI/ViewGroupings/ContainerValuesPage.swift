import SwiftUI

// SwiftUI ContainerValueKey, ContainerValues, containerValue(_:_:),
// ForEachSectionCollection, ForEachSubviewCollection, Subview, SubviewsCollection,
// SubviewsCollectionSlice, SectionCollection, SectionConfiguration,
// GroupElementsOfContent, GroupSectionsOfContent reference page.
// macOS 26.0+

struct ContainerValuesPage: View {
    var body: some View {
        DescribePage(
            title: "Container Values & Subview APIs",
            docPath: "Documentation/SwiftUI/view-groupings/",
            availability: "macOS 26.0+",
            blurb: """
            SwiftUI 6 (macOS 26) introduced a rich set of APIs for custom container views \
            to inspect and customize their children's content.

            containerValue(_:_:) annotates a view with a custom value readable by its parent \
            container via ContainerValues (analogous to LayoutValueKey, but for container views). \
            ContainerValueKey defines the key type and its default value.

            ForEachSubviewCollection iterates over a container's subviews as Subview values, \
            giving the container access to each child's containerValues. SubviewsCollection is \
            the typed collection; SubviewsCollectionSlice is a contiguous slice.

            ForEachSectionCollection iterates over groups of subviews that were separated by \
            Section — each group is a SectionConfiguration carrying its header, footer, and \
            content SubviewsCollection.

            SectionCollection is the full collection of SectionConfiguration values in a \
            container. GroupElementsOfContent and GroupSectionsOfContent are ForEach-style \
            views that enumerate subviews or sections respectively.

            The companion guide "Creating custom container views" (listed as iOS/Mac Catalyst \
            only in current docs) explains the full pattern. The APIs themselves are available \
            on macOS 26.
            """,
            signatures: [
                "struct MyKey: ContainerValueKey { static let defaultValue = \"\" }",
                ".containerValue(\\.myKey, \"Hello\")",
                "ForEachSubviewCollection(content) { subview in subview[MyKey.self] }",
                "ForEachSectionCollection(content) { section in section.content }",
                "SectionConfiguration: { header; footer; content: SubviewsCollection }",
                "GroupElementsOfContent(of: MyContainer.self, content: { … })",
                "GroupSectionsOfContent(of: MyContainer.self, content: { … })"
            ],
            notes: [
                "All these APIs require macOS 26.0+ — part of the custom container view system introduced at WWDC 2024.",
                "ContainerValues is the environment-like dictionary accessed via subview[KeyType.self].",
                "These enable List/TabView-style child inspection without reflection.",
                "The 'Creating custom container views' article has full worked examples (available in the local Documentation mirror under SwiftUI/view-groupings/)."
            ]
        )
    }
}

#Preview {
    ContainerValuesPage().frame(width: 900, height: 700)
}
