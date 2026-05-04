import SwiftUI

// Describe-track page for DynamicViewContent.
// Source: Documentation/SwiftUI/view-groupings/dynamicviewcontent.md
// macOS 10.15+. Protocol — ForEach is its primary conforming type.

struct DynamicViewContentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "DynamicViewContent",
            docPath: "Documentation/SwiftUI/view-groupings/dynamicviewcontent.md",
            availability: "macOS 10.15+",
            blurb: """
            DynamicViewContent is the protocol that connects a view producing content from a collection \
            to the edit actions available in a List or ForEach context. ForEach is its primary conforming \
            type — by conforming to DynamicViewContent, ForEach can receive .onDelete(perform:), \
            .onMove(perform:), and .onInsert(of:perform:) modifiers that wire drag-to-reorder, \
            swipe-to-delete, and drag-insert behavior into the enclosing List. The Data associated type \
            is the underlying collection — typically an array. You rarely conform to DynamicViewContent \
            yourself; the value is in the modifier chain it unlocks on ForEach-inside-List. The protocol \
            itself is a conformance target with no standalone rendering.
            """,
            signatures: [
                "protocol DynamicViewContent: View — associatedtype Data: Collection",
                "ForEach<Data, ID, Content>: DynamicViewContent",
                ".onInsert(of:perform:) — drag-insert support",
                ".onMove(perform:) — reorder support (requires List context)",
                ".onDelete(perform:) — swipe-to-delete (requires List context)"
            ],
            notes: [
                "DynamicViewContent is a protocol — ForEach is its main conforming type in practice.",
                ".onDelete and .onMove only function correctly inside a List — use in other containers has no effect.",
                ".onInsert(of:perform:) enables drag-from-outside into a ForEach inside a List."
            ]
        )
    }
}

#Preview {
    DynamicViewContentDescribePage()
        .frame(width: 900, height: 700)
}
