import SwiftUI

struct DropOperationDescribePage: View {
    var body: some View {
        DescribePage(
            title: "DropOperation",
            docPath: "Documentation/SwiftUI/drag-and-drop/dropoperation.md",
            availability: "macOS 10.15+",
            blurb: """
            Operation types that determine how a drag and drop session resolves when the user drops a drag item.

            ## Overview

            Use DropOperation values inside a `DropProposal` (returned from `DropDelegate.dropUpdated(info:)`) to control which operation the system performs.

            ```swift
            func dropUpdated(info: DropInfo) -> DropProposal? {
                DropProposal(operation: .copy)
            }
            ```

            ### Cases

            - `copy` — duplicate the item to the destination.
            - `move` — transfer ownership; the source is expected to remove its copy.
            - `forbidden` — the drop is not permitted; cursor shows ⊘.
            - `cancel` — the operation was cancelled.

            The nested `DropOperation.Set` is an option set used to express *which* operations a drag source or drop target supports (e.g., when configuring a `DragSession`'s allowed operations).

            Conforms to `Equatable`, `Hashable`, `Sendable`, `Copyable`.
            """,
            signatures: [
                "enum DropOperation",
                "DropOperation.copy        // duplicates the dragged item",
                "DropOperation.move        // moves the item; source removes the original",
                "DropOperation.forbidden   // shows the ⊘ cursor — drop not allowed",
                "DropOperation.cancel      // user cancelled the drop",
                "struct DropOperation.Set  // option set for allowed operations"
            ],
            notes: [
                ".move on macOS triggers the source to delete the original item — only use .move when both source and destination agree on ownership transfer.",
                "Use DropOperation.Set when expressing allowed operations on DragConfiguration / DropConfiguration (macOS 26+)."
            ]
        )
    }
}

#Preview {
    DropOperationDescribePage()
        .frame(width: 900, height: 800)
}
