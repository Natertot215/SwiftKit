import SwiftUI

struct DragSessionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "DragSession",
            docPath: "Documentation/SwiftUI/drag-and-drop/dragsession.md",
            availability: "macOS 26.0+",
            blurb: """
            Describes the ongoing dragging session.

            ## Overview

            DragSession is a value provided to drag-source callbacks on macOS 26+ to describe the live state of an ongoing drag — its location, the index of the item currently under the cursor, the session phase, and a stable identity for grouping per-session work.

            Use DragSession when you need richer per-frame information than `onDrag(_:)` exposes — for example, while configuring a multi-item drag through `DragConfiguration` or while customizing previews on the fly.

            DragSession conforms to `Identifiable`. Its nested `DragSession.ID` lets you key state (such as a per-drag preview cache) to the session.
            """,
            signatures: [
                "struct DragSession : Identifiable",
                "session.id              // DragSession.ID",
                "session.draggedItemIndex // index of the dragged item",
                "session.location        // CGPoint of the drag",
                "session.phase           // current phase of the drag"
            ],
            notes: [
                "DragSession is macOS 26.0+ — available alongside DragConfiguration and DragDropPreviewsFormation.",
                "Distinct from DropSession: DragSession describes the source side of the operation, DropSession describes the destination side."
            ]
        )
    }
}

#Preview {
    DragSessionDescribePage()
        .frame(width: 900, height: 800)
}
